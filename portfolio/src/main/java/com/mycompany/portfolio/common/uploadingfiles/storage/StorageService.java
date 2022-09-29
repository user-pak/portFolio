package com.mycompany.portfolio.common.uploadingfiles.storage;

import java.nio.file.Path;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

public interface StorageService {

	String storeImg(MultipartFile multipartFile);
	
	Stream<Path> loadAll();
	
	Resource loadAsResource(String filename);
	
	void deleteImg(String renameFilename);
}
