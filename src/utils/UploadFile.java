package utils;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadFile {

	private static final String TMP_PATH = System.getProperty("java.io.tmpdir");
	private static final String TARGET_PATH = "C:\\study\\workspace\\juso_homework\\WebContent\\WEB-INF\\addr";
	private static final int MEMORY_SIZE = 10*1024*1024; // 메모리 사이즈
	private static final int TOTAL_SIZE = 1000*1024*1024; // 총 사이즈
	private static final int FILE_SIZE = 1000*1024*1024; // 파일 하나당 사이즈
	private static final File TMP_FOLDER = new File(TMP_PATH); // 임시 저장소
//	private static final File TARGET_FOLDER = new File(TARGET_PATH);
	
	private static final DiskFileItemFactory DFI_FACTORY = new DiskFileItemFactory();
	
	static {
		DFI_FACTORY.setSizeThreshold(MEMORY_SIZE); // 메모리크기
		DFI_FACTORY.setRepository(TMP_FOLDER); // 저장위치
	}
	
	public static Map<String, Object> parseRequest(HttpServletRequest request) throws ServletException {
		if (!ServletFileUpload.isMultipartContent(request)) {
			throw new ServletException("올바른 폼형식이 아닙니다.");
		}
		ServletFileUpload sfu = new ServletFileUpload(DFI_FACTORY);
		sfu.setFileSizeMax(FILE_SIZE);
		sfu.setSizeMax(TOTAL_SIZE);
		try {
			List<FileItem> fileList = sfu.parseRequest(request);
			Map<String, Object> paramMap = new HashMap<>();
			for (FileItem file : fileList) {
				String key = file.getFieldName();
				if (file.isFormField()) {
					String value = file.getString("utf-8");
					paramMap.put(key, value);
				} else {
					paramMap.put(key, file);			
				}				
			}
			return paramMap;
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static File writeFile(FileItem file) throws Exception {
		String fileName = file.getName();
		String path = TARGET_PATH + File.separator + fileName; // File.separator = 각 OS 에 맞는 구분자
		File targetFile = new File(path);
		file.write(targetFile);
		return targetFile;
	}
}
