package com.mycompany.portfolio.common.uploadingfiles.storage;

import java.nio.file.Paths;

import org.junit.Before;
import org.junit.Test;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
import static org.assertj.core.api.Assertions.assertThat;

@SpringJUnitWebConfig
public class FileSystemStorageServiceTests {

	private FileSystemStorageService storageService;
	
	@Before
	public void initStorageService() {
		
		storageService = new FileSystemStorageService();
		storageService.setDirPathToTest(Paths.get("target/files"));
		storageService.deleteAll();
				
	}
	@Test
	public void shouldSaveAndLoad() {
		String renameFilename = storageService.storeImg(new MockMultipartFile("imgFile","foo.jpg", "text/plain", "FileService Test".getBytes()));
		assertThat(storageService.load(renameFilename)).exists();
	}
}
