package com.mycompany.portfolio.common.uploadingfiles.storage;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.stream.Stream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.event.EventListener;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@PropertySource(value = { "classpath:application.properties" })
public class FileSystemStorageService implements StorageService{

	private final Logger logger = LoggerFactory.getLogger(FileSystemStorageService.class);
	
	@Value("${uploadingImgFileDir}")
	private String rootImgDir;
	
	@Autowired
	private ServletContext servletContext;
	private Path rootImgLocation;
	
	private Path initRootLocation() {
		this.rootImgLocation = Paths.get(servletContext.getRealPath(rootImgDir));
		return rootImgLocation;
	}
	
	@Override
	public String storeImg(MultipartFile multipartFileImg){
		// TODO Auto-generated method stub
		initRootLocation();
		String renameFilename = System.currentTimeMillis() + "-" + multipartFileImg.getOriginalFilename();
		try {
			Files.createDirectories(rootImgLocation);
			Path destinationLocation = rootImgLocation.resolve(renameFilename).normalize().toAbsolutePath();
			Files.copy(multipartFileImg.getInputStream(), destinationLocation, StandardCopyOption.REPLACE_EXISTING);
			return renameFilename;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new StorageServiceException("이미지가 저장되지 않았습니다", e);
		}
	
	}

	@Override
	public Stream<Path> loadAll() {
		// TODO Auto-generated method stub
		initRootLocation();
		try {			
			return Files.walk(rootImgLocation).filter(path -> !path.equals(rootImgLocation));		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new StorageServiceException("이미지목록을 불러올 수 없습니다", e);			
		}
	}
	
	@Override
	public Resource loadAsResource(String filename) {
		// TODO Auto-generated method stub
		initRootLocation();
		Path destinationPath = rootImgLocation.resolve(Paths.get(filename));
		try {
			return new UrlResource(destinationPath.toUri());
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			throw new StorageServiceException("이미지를 불러올 수 없습니다", e);
		}
	}

	@Override
	public void deleteImg(String renameFilename) {
		// TODO Auto-generated method stub
		initRootLocation();
		try {
			Files.delete(rootImgLocation.resolve(Paths.get(renameFilename)));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new StorageServiceException("이미지를 삭제할 수 없습니다", e);
		}
	}

}
