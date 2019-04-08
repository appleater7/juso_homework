package service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface FileService {
	public Map<String, String> parseText(HttpServletRequest request) throws Exception;
	public Map<String, String> insertAddrFromFile(File file);
}
