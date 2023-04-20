package kh.com.nr.common;
 
import java.io.File;
import java.util.HashMap; 
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

@Component
@PropertySource("classpath:properties/newroom-info.properties")
public class FileUtil {
	
//	@Value("${local.repository}")
//	private String UPLOAD_FOLDER;
	
	@Autowired
	private Environment env;
	
//	@Bean
	public Map<String, String> saveFile(MultipartFile multi, HttpServletRequest request, String addedPath) throws Exception{
		Map<String, String> result = null;

		if(multi != null && !multi.equals("")) {
			result = new HashMap<String, String>();
			
			String scatchImg = multi.getOriginalFilename();
			
			
			// file을 server에 특정 위치(저장할 폴더)에 저장
			String propPath = env.getProperty("local.reprository");
			System.out.println(propPath);
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), propPath);
			System.out.println(path);
			if(addedPath != null) {
				path += addedPath;
			}
			// 저장할 폴더가 안만들어져 있다면 만들어줘야함.
			File folder = new File(path);
			if(!folder.exists()) {
				folder.mkdirs();
			} 
			multi.transferTo(new File(path + "\\" + scatchImg));
			result.put("original", scatchImg);
		}
		return result;
	}
	
}
