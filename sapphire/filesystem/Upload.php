<?php
/**
 * Manages uploads via HTML forms processed by PHP,
 * uploads to Silverstripe's default upload directory,
 * and either creates a new or uses an existing File-object
 * for syncing with the database.
 * 
 * <b>Validation</b>
 * 
 * By default, a user can upload files without extension limitations,
 * which can be a security risk if the webserver is not properly secured.
 * Use {@link setAllowedExtensions()} to limit this list,
 * and ensure the "assets/" directory does not execute scripts
 * (see http://doc.silverstripe.org/secure-development#filesystem).
 * {@link File::$allowed_extensions} provides a good start for a list of "safe" extensions.
 * 
 * @package sapphire
 * @subpackage filesystem
 * 
 * @todo Allow for non-database uploads
 */
class Upload extends Controller {
	
	/**
	 * A File object
	 * @var File
	 */
	protected $file;
	
	/**
	 * An instance of Upload_Validator
	 * @var Upload_Validator
	 */
	protected $validator;
	
	/**
	 * Information about the temporary file produced
	 * by the PHP-runtime.
	 *
	 * @var array
	 */
	protected $tmpFile;
	
	/**
	 * Processing errors that can be evaluated,
	 * e.g. by Form-validation.
	 *
	 * @var array
	 */
	protected $errors = array();
	
	/**
	 * A foldername relative to /assets,
	 * where all uploaded files are stored by default.
	 *
	 * @var string
	 */
	public static $uploads_folder = "Uploads"; 
	
	public function __construct() {
		parent::__construct();
		$this->validator = new Upload_Validator();
	}
	
	/**
	 * Get current validator
	 * 
	 * @return object $validator
	 */
	public function getValidator() {
		return $this->validator;
	}
	
	/**
	 * Set a different instance than {@link Upload_Validator}
	 * for this upload session.
	 * 
	 * @param object $validator
	 */
	public function setValidator($validator) {
		$this->validator = $validator;
	}
	
	/**
	 * Save an file passed from a form post into this object.
	 * 
	 * @param $tmpFile array Indexed array that PHP generated for every file it uploads.
	 * @param $folderPath string Folder path relative to /assets
	 * @return Boolean|string Either success or error-message.
	 */
	function load($tmpFile, $folderPath = false) {
		$this->clearErrors();
		
		if(!$folderPath) $folderPath = self::$uploads_folder;
		
		if(!$this->file) $this->file = new File();
		
		if(!is_array($tmpFile)) {
			user_error("Upload::load() Not passed an array.  Most likely, the form hasn't got the right enctype", E_USER_ERROR);
		}
		
		if(!$tmpFile['size']) {
			$this->errors[] = _t('File.NOFILESIZE', 'Filesize is zero bytes.');
			return false;
		}
		
		$valid = $this->validate($tmpFile);
		if(!$valid) return false;
		
		// @TODO This puts a HUGE limitation on files especially when lots
		// have been uploaded.
		$base = Director::baseFolder();
		$parentFolder = Folder::findOrMake($folderPath);

		// Create a folder for uploading.
		if(!file_exists(ASSETS_PATH)){
			mkdir(ASSETS_PATH, Filesystem::$folder_create_mask);
		}
		if(!file_exists(ASSETS_PATH . "/" . $folderPath)){
			mkdir(ASSETS_PATH . "/" . $folderPath, Filesystem::$folder_create_mask);
		}

		// Generate default filename
		$fileName = str_replace(' ', '-',$tmpFile['name']);
		$fileName = ereg_replace('[^A-Za-z0-9+.-]+','',$fileName);
		$fileName = ereg_replace('-+', '-',$fileName);
		$fileName = basename($fileName);

		$relativeFilePath = ASSETS_DIR . "/" . $folderPath . "/$fileName";
		
		// if filename already exists, version the filename (e.g. test.gif to test1.gif)
		while(file_exists("$base/$relativeFilePath")) {
			$i = isset($i) ? ($i+1) : 2;
			$oldFilePath = $relativeFilePath;
			// make sure archives retain valid extensions
			if(substr($relativeFilePath, strlen($relativeFilePath) - strlen('.tar.gz')) == '.tar.gz' ||
				substr($relativeFilePath, strlen($relativeFilePath) - strlen('.tar.bz2')) == '.tar.bz2') {
					$relativeFilePath = ereg_replace('[0-9]*(\.tar\.[^.]+$)',$i . '\\1', $relativeFilePath);
			} else if (strpos($relativeFilePath, '.') !== false) {
				$relativeFilePath = ereg_replace('[0-9]*(\.[^.]+$)',$i . '\\1', $relativeFilePath);
			} else if (strpos($relativeFilePath, '_') !== false) {
				$relativeFilePath = ereg_replace('_([^_]+$)', '_'.$i, $relativeFilePath);
			} else {
				$relativeFilePath .= "_$i";
			}
			if($oldFilePath == $relativeFilePath && $i > 2) user_error("Couldn't fix $relativeFilePath with $i tries", E_USER_ERROR);
		}

		if(file_exists($tmpFile['tmp_name']) && copy($tmpFile['tmp_name'], "$base/$relativeFilePath")) {
			$this->file->ParentID = $parentFolder->ID;
			// This is to prevent it from trying to rename the file
			$this->file->Name = basename($relativeFilePath);
			$this->file->write();
			return true;
		} else {
			$this->errors[] = _t('File.NOFILESIZE', 'Filesize is zero bytes.');
			return false;
		}
	}
	
	/**
	 * Load temporary PHP-upload into File-object.
	 *
	 * @param array $tmpFile
	 * @param File $file
	 * @return Boolean
	 */
	public function loadIntoFile($tmpFile, $file, $folderPath = false) {
		$this->file = $file;
		return $this->load($tmpFile, $folderPath);
	}
	
	/**
	 * Container for all validation on the file
	 * (e.g. size and extension restrictions).
	 * Is NOT connected to the {Validator} classes,
	 * please have a look at {FileField->validate()}
	 * for an example implementation of external validation.
	 *
	 * @param array $tmpFile
	 * @return boolean
	 */
	public function validate($tmpFile) {
		$validator = $this->validator;
		$validator->setTmpFile($tmpFile);
		$isValid = $validator->validate();
		if($validator->getErrors()) {
			$this->errors = array_merge($this->errors, $validator->getErrors());
		}
		return $isValid;
	}
	
	/**
	 * Get file-object, either generated from {load()},
	 * or manually set.
	 *
	 * @return File
	 */
	public function getFile() {
		return $this->file;
	}
	
	/**
	 * Set a file-object (similiar to {loadIntoFile()})
	 *
	 * @param File $file
	 */
	public function setFile($file) {
		$this->file = $file;
	}
	
	/**
	 * Get maximum file size for all or specified file extension.
	 * 
	 * @deprecated 2.5 Please use Upload_Validator::getAllowedMaxFileSize() instead
	 * 
	 * @param string $ext
	 * @return int Filesize in bytes
	 */
	public function getAllowedMaxFileSize($ext = null) {
		user_error('Upload::getAllowedMaxFileSize() is deprecated. Please use Upload_Validator::getAllowedMaxFileSize() instead', E_USER_NOTICE);
		return $this->validator->getAllowedMaxFileSize($ext);
	}
	
	/**
	 * Set filesize maximums (in bytes).
	 * Automatically converts extensions to lowercase
	 * for easier matching.
	 * 
	 * Example: 
	 * <code>
	 * array('*' => 200, 'jpg' => 1000)
	 * </code>
	 *
	 * @deprecated 2.5 Please use Upload_Validator::setAllowedMaxFileSize() instead
	 *
	 * @param array|int $rules
	 */
	public function setAllowedMaxFileSize($rules) {
		user_error('Upload::setAllowedMaxFileSize() is deprecated. Please use Upload_Validator::setAllowedMaxFileSize() instead', E_USER_NOTICE);
		$this->validator->setAllowedMaxFileSize($rules);
	}
	
	/**
	 * @deprecated 2.5 Please use Upload_Validator::getAllowedExtensions() instead
	 * @return array
	 */
	public function getAllowedExtensions() {
		user_error('Upload::getAllowedExtensions() is deprecated. Please use Upload_Validator::getAllowedExtensions() instead', E_USER_NOTICE);
		return $this->validator->getAllowedExtensions();
	}
	
	/**
	 * @deprecated 2.5 Please use Upload_Validator::setAllowedExtensions() instead
	 * @param array $rules
	 */
	public function setAllowedExtensions($rules) {
		user_error('Upload::setAllowedExtensions() is deprecated. Please use Upload_Validator::setAllowedExtensions() instead', E_USER_NOTICE);
		$this->validator->setAllowedExtensions($rules);
	}
	
	/**
	 * Determines if the bytesize of an uploaded
	 * file is valid - can be defined on an
	 * extension-by-extension basis in {$allowedMaxFileSize}
	 * 
	 * @deprecated 2.5 Please use Upload_Validator::isValidExtension() instead
	 *
	 * @param array $tmpFile
	 * @return boolean
	 */
	public function isValidSize($tmpFile) {
		user_error('Upload::isValidSize() is deprecated. Please use Upload_Validator::isValidSize() instead', E_USER_NOTICE);
		$validator = new Upload_Validator();
		$validator->setTmpFile($tmpFile);
		return $validator->isValidSize();
	}
	
	/**
	 * Determines if the temporary file has a valid extension
	 * 
	 * @deprecated 2.5 Please use Upload_Validator::isValidExtension() instead
	 * 
	 * @param array $tmpFile
	 * @return boolean
	 */
	public function isValidExtension($tmpFile) {
		user_error('Upload::isValidExtension() is deprecated. Please use Upload_Validator::isValidExtension() instead', E_USER_NOTICE);
		$validator = new Upload_Validator();
		$validator->setTmpFile($tmpFile);
		return $validator->isValidExtension();
	}
	
	/**
	 * Clear out all errors (mostly set by {loadUploaded()})
	 */
	public function clearErrors() {
		$this->errors = array();
	}
	
	/**
	 * Determines wether previous operations caused an error.
	 * 
	 * @return boolean
	 */
	public function isError() {
		return (count($this->errors));		
	}
	
	/**
	 * Return all errors that occurred while processing so far
	 * (mostly set by {loadUploaded()})
	 *
	 * @return array
	 */
	public function getErrors() {
		return $this->errors;		
	}
	
}

/**
 * @package sapphire
 * @subpackage filesystem
 */
class Upload_Validator {

	/**
	 * Information about the temporary file produced
	 * by the PHP-runtime.
	 *
	 * @var array
	 */
	protected $tmpFile;

	protected $errors = array();

	/**
	 * Restrict filesize for either all filetypes
	 * or a specific extension, with extension-name
	 * as array-key and the size-restriction in bytes as array-value.
	 * 
	 * @var array 
	 */
	public $allowedMaxFileSize = array();

	/**
	 * @var array Collection of extensions. 
	 * Extension-names are treated case-insensitive.
	 * 
	 * Example:
	 * <code>
	 * 	array("jpg","GIF")
	 * </code>
	 */
	public $allowedExtensions = array();

	/**
	 * Return all errors that occurred while validating
	 * the temporary file.
	 *
	 * @return array
	 */
	public function getErrors() {
		return $this->errors;		
	}

	/**
	 * Set information about temporary file produced by PHP.
	 * @param array $tmpFile
	 */
	public function setTmpFile($tmpFile) {
		$this->tmpFile = $tmpFile;
	}

	/**
	 * Get maximum file size for all or specified file extension.
	 *
	 * @param string $ext
	 * @return int Filesize in bytes
	 */
	public function getAllowedMaxFileSize($ext = null) {
		$ext = strtolower($ext);
		if(isset($ext) && isset($this->allowedMaxFileSize[$ext])) {
			return $this->allowedMaxFileSize[$ext];   
		} else {
			return (isset($this->allowedMaxFileSize['*'])) ? $this->allowedMaxFileSize['*'] : false;
		}
	}
	
	/**
	 * Set filesize maximums (in bytes).
	 * Automatically converts extensions to lowercase
	 * for easier matching.
	 * 
	 * Example: 
	 * <code>
	 * array('*' => 200, 'jpg' => 1000)
	 * </code>
	 *
	 * @param array|int $rules
	 */
	public function setAllowedMaxFileSize($rules) {
		if(is_array($rules) && count($rules)) {
			// make sure all extensions are lowercase
			$rules = array_change_key_case($rules, CASE_LOWER);
			$this->allowedMaxFileSize = $rules;
		} elseif((int) $rules > 0) {
			$this->allowedMaxFileSize['*'] = (int)$rules;
		}
	}
	
	/**
	 * @return array
	 */
	public function getAllowedExtensions() {
		return $this->allowedExtensions;
	}
	
	/**
	 * Limit allowed file extensions. Empty by default, allowing all extensions.
	 * To allow files without an extension, use an empty string.
	 * See {@link File::$allowed_extensions} to get a good standard set of
	 * extensions that are typically not harmful in a webserver context.
	 * See {@link setAllowedMaxFileSize()} to limit file size by extension.
	 * 
	 * @param array $rules List of extensions
	 */
	public function setAllowedExtensions($rules) {
		if(!is_array($rules)) return false;
		
		// make sure all rules are lowercase
		foreach($rules as &$rule) $rule = strtolower($rule);
		
		$this->allowedExtensions = $rules;
	}
	
	/**
	 * Determines if the bytesize of an uploaded
	 * file is valid - can be defined on an
	 * extension-by-extension basis in {@link $allowedMaxFileSize}
	 *
	 * @return boolean
	 */
	public function isValidSize() {
		$pathInfo = pathinfo($this->tmpFile['name']);
		$extension = isset($pathInfo['extension']) ? strtolower($pathInfo['extension']) : null;
		$maxSize = $this->getAllowedMaxFileSize($extension);
		return (!$this->tmpFile['size'] || !$maxSize || (int) $this->tmpFile['size'] < $maxSize);
	}
	
	/**
	 * Determines if the temporary file has a valid extension
	 * An empty string in the validation map indicates files without an extension.
	 * @return boolean
	 */
	public function isValidExtension() {
		$pathInfo = pathinfo($this->tmpFile['name']);
		
		// Special case for filenames without an extension
		if(!isset($pathInfo['extension'])) {
			return in_array('', $this->allowedExtensions, true);
		} else {
			return (!count($this->allowedExtensions) || in_array(strtolower($pathInfo['extension']), $this->allowedExtensions));
		}
	}	
	
	/**
	 * Run through the rules for this validator checking against
	 * the temporary file set by {@link setTmpFile()} to see if
	 * the file is deemed valid or not.
	 * 
	 * @return boolean
	 */
	public function validate() {
		// we don't validate for empty upload fields yet
		if(!isset($this->tmpFile['name']) || empty($this->tmpFile['name'])) return true;

		$isRunningTests = (class_exists('SapphireTest', false) && SapphireTest::is_running_test());
		if(isset($this->tmpFile['tmp_name']) && !is_uploaded_file($this->tmpFile['tmp_name']) && !$isRunningTests) {
			$this->errors[] = _t('File.NOVALIDUPLOAD', 'File is not a valid upload');
			return false;
		}

		$pathInfo = pathinfo($this->tmpFile['name']);
		// filesize validation
		if(!$this->isValidSize()) {
			$ext = (isset($pathInfo['extension'])) ? $pathInfo['extension'] : '';
			$arg = File::format_size($this->getAllowedMaxFileSize($ext));
			$this->errors[] = sprintf(
				_t(
					'File.TOOLARGE', 
					'Filesize is too large, maximum %s allowed.',
					PR_MEDIUM,
					'Argument 1: Filesize (e.g. 1MB)'
				),
				$arg
			);
			return false;
		}

		// extension validation
		if(!$this->isValidExtension()) {
			$this->errors[] = sprintf(
				_t(
					'File.INVALIDEXTENSION', 
					'Extension is not allowed (valid: %s)',
					PR_MEDIUM,
					'Argument 1: Comma-separated list of valid extensions'
				),
				wordwrap(implode(', ', $this->allowedExtensions))
			);
			return false;
		}
		
		return true;
	}

}