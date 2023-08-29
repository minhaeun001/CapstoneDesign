package kr.co.SAMGUN.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class FileUtil {
	
	public static boolean file_download(HttpServletRequest request,  HttpServletResponse response){
        boolean bl = true;
		String file_path = request.getParameter("file_path");
		String orgin_file_name = request.getParameter("orgin_file_name");
		String target_file_name = request.getParameter("target_file_name");
		String filePathToBeServed  = file_path + File.separator + target_file_name ;
        
        String contentType = "application/octet-stream";
        File saveFileName = new File(filePathToBeServed);
        if (!saveFileName.exists()) { //다운받을 파일이 없다면
        	return false;
        }
        
        long fileLength = saveFileName.length();
        
        response.setHeader("Content-Disposition", "attachment; filename=\"" + orgin_file_name + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Content-Type", contentType);
        response.setHeader("Content-Length", "" + fileLength);
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");
        
        try (FileInputStream fis = new FileInputStream(saveFileName); OutputStream out = response.getOutputStream();) 
        {
        
	        int readCount = 0;
	        byte[] buffer = new byte[1024 * 4];
	        
	        while((readCount = fis.read(buffer))!=-1){
	          out.write(buffer,0,readCount);
	        }
	        
        }catch(Exception ex){
        	
        	bl = false;
        	
          throw new RuntimeException("file Save Error");
        }

        return bl ;
	}
}
