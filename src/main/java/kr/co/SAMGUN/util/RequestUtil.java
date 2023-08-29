package kr.co.SAMGUN.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/** Request 유틸 */
public class RequestUtil {

    /** 리퀘스트 파라미터를 맵으로 */
    public static Map<String, Object> requestToMap( HttpServletRequest request) throws Exception {

    	boolean utf8Decode = false ;
    	return requestToMap( request, utf8Decode );
    	
    }
    /** 리퀘스트 파라미터를 맵으로 */
    public static Map<String, Object> requestToMap( HttpServletRequest request, boolean utf8Decode ) throws Exception {

        Map<String, Object> paramMap = new HashMap<String, Object>();

        Enumeration enums = request.getParameterNames();

        while( enums.hasMoreElements() ) {

            String paramName = (String)enums.nextElement();

            String[] parameters = request.getParameterValues( paramName );

            if( parameters.length > 1 ) { // Parameter가 배열일 경우

                for( int i = 0, n = parameters.length ; i < n ; i++ ) {

                	parameters[i] = XSSCleanUtil.defaultXSS(parameters[i] );
                }

                //여기서 작성해야하는데 작성안됨
                //parameters[i] 
                
            }
            else { // Parameter가 배열이 아닌 경우

            	paramMap.put( paramName, parameters[0] );
            }
              
        }

        return paramMap;
    }
    
    /** 리퀘스트 파라미터를 맵으로 */
    public static Map<String, String> requestToMap( MultipartHttpServletRequest request ) throws Exception {

        Map<String, String> paramMap = new HashMap<String, String>();

        Enumeration enums = request.getParameterNames();

        while( enums.hasMoreElements() ) {

            String paramName = (String)enums.nextElement();

            String[] parameters = request.getParameterValues( paramName );

            if( parameters.length > 1 ) { // Parameter가 배열일 경우

                for( int i = 0, n = parameters.length ; i < n ; i++ ) {

                	parameters[i] = XSSCleanUtil.defaultXSS(parameters[i] );
                }

                //여기서 작성해야하는데 작성안됨
                //parameters[i] 
                
            }
            else { // Parameter가 배열이 아닌 경우

            	paramMap.put( paramName, parameters[0] );
            }
              
        }

        return paramMap;
    }
    
    
    public static String today(){

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		Calendar c1 = Calendar.getInstance();
		
		String strToday = sdf.format(c1.getTime());
		
		System.out.println("Today=" + strToday);

		return strToday;
    }
}
