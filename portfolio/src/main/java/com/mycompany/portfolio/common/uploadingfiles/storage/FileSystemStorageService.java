package com.mycompany.portfolio.common.uploadingfiles.storage;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.stream.Stream;
import javax.servlet.ServletContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.FileSystemUtils;
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
	

	public void setDirPathToTest(Path testPath) {
		this.rootImgLocation = testPath;
	}
	
	public void init() {
		if(rootImgLocation == null) {
			this.rootImgLocation = Paths.get(servletContext.getRealPath(rootImgDir));
		}
		try {
			if(Files.notExists(rootImgLocation)) Files.createDirectories(rootImgLocation);
		} catch (NoSuchFileException e) {
			throw new StorageServiceException("파일이 없습니다");
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new StorageServiceException("디렉토리가 생성되지 않았습니다", e);
		}
	}
	public void deleteAll() {
		FileSystemUtils.deleteRecursively(rootImgLocation.toFile());
	}
		
	@Override
	public String storeImg(MultipartFile multipartFileImg){
		// TODO Auto-generated method stub
		init();
		String renameFilename = System.currentTimeMillis() + "-" + multipartFileImg.getOriginalFilename();		
		try (InputStream multipartFileInputStream = multipartFileImg.getInputStream()){
			Path destinationLocation = load(renameFilename).normalize().toAbsolutePath();
			Files.copy(multipartFileInputStream, destinationLocation, StandardCopyOption.REPLACE_EXISTING);
			return renameFilename;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new StorageServiceException("이미지가 저장되지 않았습니다", e);
		}
	
	}

	@Override
	public Stream<Path> loadAll() {
		// TODO Auto-generated method stub
		init();
		try {			
			return Files.walk(rootImgLocation).filter(path -> !path.equals(rootImgLocation));		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new StorageServiceException("이미지목록을 불러올 수 없습니다", e);			
		}
	}
	
	public Path load(String filename) {
		return rootImgLocation.resolve(filename);
	}
	
	@Override
	public Resource loadAsResource(String filename) {
		// TODO Auto-generated method stub
		init();
		Path destinationPath = load(filename);
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
		init();
		try {
			Files.delete(rootImgLocation.resolve(Paths.get(renameFilename)));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new StorageServiceException("이미지를 삭제할 수 없습니다", e);
		}
	}

}
