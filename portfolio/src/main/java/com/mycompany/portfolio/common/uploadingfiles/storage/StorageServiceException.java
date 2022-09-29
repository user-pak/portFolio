package com.mycompany.portfolio.common.uploadingfiles.storage;

public class StorageServiceException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public StorageServiceException(String message) {
		super(message);
	}

	public StorageServiceException(String message, Throwable cause) {
		super(message, cause);
	}
}
