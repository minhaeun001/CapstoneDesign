package kr.co.SAMGUN.util;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;

/** XSS필터 유틸 */
public class XSSCleanUtil {
     
    /** XSS 1번 = 3번 + 알파 */
    public static String defaultXSS( String param ) {
        
        param = XSSCleanUtil.defaultXSS3( param );
        
        param = param.replaceAll( "(?i)alert", "AL-ERT" );
        param = param.replaceAll( "(?i)confirm", "CON-FIRM" );
        param = param.replaceAll( "(?i)charset", "CHA-RSET" );
        param = param.replaceAll( "(?i)cookie", "COO-KIE" );
        param = param.replaceAll( "(?i)Href", "HR-EF" );
        param = param.replaceAll( "&", "&amp;" );   //태크관련해서 예외 처리함
        param = param.replaceAll( "\"", "″" );
        return param;
    }
    
    /** XSS 2번 = 3번 + 알파 */
    public static String defaultXSS2( String param ) {
        
        param = XSSCleanUtil.defaultXSS3( param );
        
        param = param.replaceAll( "%2d", " " );
        param = param.replaceAll( "%3e", " " );
        
        return param;
    }
    
    /** XSS 3번 */
    public static String defaultXSS3( String param ) {
        
        param = param.replaceAll( "(?i)<script", "SC-RIPT" );
        param = param.replaceAll( "(?i)script>", "SC-RIPT" );
        param = param.replaceAll( "(?i)<iframe", "IF-RAME" );
        param = param.replaceAll( "(?i)iframe>", "IF-RAME" );
        param = param.replaceAll( "(?i)text/javascript", "TE-XTJAVA-SCRIPT" );
        param = param.replaceAll( "(?i)eval", "EV-AL" );
        param = param.replaceAll( "(?i)onerror", "ON-ERROR" );
        param = param.replaceAll( "(?i)onload", "ON-LOAD" );
        param = param.replaceAll( "(?i)onclick", "ON-CLICK" );
        param = param.replaceAll( "(?i)onfocus", "ON-FOCUS" );
        param = param.replaceAll( "(?i)onunload", "ON-UNLOAD" );
        param = param.replaceAll( "(?i)onblur", "ON-BLUR" );
        param = param.replaceAll( "(?i)onkeydown", "ON-KEY-DOWN" );
        param = param.replaceAll( "(?i)onkeypress", "ON-KEY-PRESS" );
        param = param.replaceAll( "(?i)onkeyup", "ON-KEY-UP" );
        param = param.replaceAll( "(?i)onmouseover", "ON-MOUSEover" );
        param = param.replaceAll( "(?i)onmousedown", "ON-MOUSEdown" );
        param = param.replaceAll( "(?i)onmousemove", "ON-MOUSEmove" );
        param = param.replaceAll( "(?i)onmouseout", "ON-MOUSEout" );
        param = param.replaceAll( "(?i)onmouseup", "ON-MOUSEup" );
        param = param.replaceAll( "(?i)onselect", "ON-SELECT" );
        param = param.replaceAll( "(?i)onhelp", "ON-HELP" );
        param = param.replaceAll( "(?i)ondblclick", "ON-DBLCLICK" );
        param = param.replaceAll( "(?i)onchange", "ON-CHANGE" );
        param = param.replaceAll( "(?i)expression", "EXP-RESSION" );
        param = param.replaceAll( "(?i)applet", "APP-LET" );
        param = param.replaceAll( "(?i)meta", "&#x6d;&#x65;&#x74;&#x61;" );
        param = param.replaceAll( "(?i)xml", "X-ML" );
        param = param.replaceAll( "(?i)blink", "&#x62;&#x6c;&#x69;&#x6e;&#x6b;" );
        param = param.replaceAll( "(?i)frame", "F-RAME" );
        param = param.replaceAll( "(?i)frameset", "FRA-MESET" );
        param = param.replaceAll( "(?i)ilayer", "IL-AYER" );
        param = param.replaceAll( "(?i)layer", "&#x6c;&#x61;&#x79;&#x65;&#x72;" );
        param = param.replaceAll( "(?i)bgsound", "BGS-OUND" );
        param = param.replaceAll( "(?i)title", "&#x74;&#x69;&#x74;&#x6c;&#x65;" );
        param = param.replaceAll( "(?i)onbefore", "ON-BEFORE" );
        param = param.replaceAll( "(?i)onrowenter", "ON-ROWenter" );
        param = param.replaceAll( "(?i)oncontextmenu", "ON-CON-TEXTMENU" );
        param = param.replaceAll( "(?i)document", "&#x64;&#x6f;&#x63;&#x75;&#x6d;&#x65;&#x6e;&#x74;" );
        param = param.replaceAll( "(?i)string", "&#x73;&#x74;&#x72;&#x69;&#x6e;&#x67;" );
        param = param.replaceAll( "(?i)create", "&#x63;&#x72;&#x65;&#x61;&#x74;&#x65;" );
        param = param.replaceAll( "(?i)append", "&#x61;&#x70;&#x70;&#x65;&#x6e;&#x64;" );
        param = param.replaceAll( "(?i)binding", "BIN-DING" );
        param = param.replaceAll( "(?i)msgbox", "MSG-BOX" );
        param = param.replaceAll( "(?i)refresh", "&#x72;&#x65;&#x66;&#x72;&#x65;&#x73;&#x68;" );
        param = param.replaceAll( "(?i)void", "VO-ID" );
        param = param.replaceAll( "(?i)onpaste", "ON-PASTE" );
        param = param.replaceAll( "(?i)onresize", "ON-RESIZE" );
        param = param.replaceAll( "(?i)onstart", "ON-START" );
        param = param.replaceAll( "(?i)onfocusin", "ON-FOCUSin" );
        param = param.replaceAll( "(?i)onmousewheel", "ON-MOUSEwheel" );
        param = param.replaceAll( "(?i)ondataavailable", "ON-DATAAVAILABLE" );
        param = param.replaceAll( "(?i)onafteripudate", "ON-AFTERipudate" );
        param = param.replaceAll( "(?i)onmousedown", "ON-MOUSEdown" );
        param = param.replaceAll( "(?i)onbeforeactivate", "ON-BEFOREactivate" );
        param = param.replaceAll( "(?i)onbeforecopy", "ON-BEFOREcopy" );
        param = param.replaceAll( "(?i)onbeforedeactivate", "ON-BEFOREdeactivate" );
        param = param.replaceAll( "(?i)ondatasetchaged", "ON-DATASETchaged" );
        param = param.replaceAll( "(?i)onnbeforeprint", "ON-BEFOREprint" );
        param = param.replaceAll( "(?i)onbeforepaste", "ON-BEFOREpaste" );
        param = param.replaceAll( "(?i)onbeforeeditfocus", "ON-BEFOREeditfocus" );
        param = param.replaceAll( "(?i)onbeforeuload", "ON-BEFOREuload" );
        param = param.replaceAll( "(?i)onbeforeupdate", "ON-BEFOREupdate" );
        param = param.replaceAll( "(?i)onpropertychange", "ON-PROPERTYCHANGE" );
        param = param.replaceAll( "(?i)ondatasetcomplete", "ON-DATASETcomplete" );
        param = param.replaceAll( "(?i)oncellchange", "ON-CELLCHANGE" );
        param = param.replaceAll( "(?i)onlayoutcomplete", "ON-LAYOUTCOMPLETE" );
        param = param.replaceAll( "(?i)onselectionchange", "ON-SELECTiON-CHANGE" );
        param = param.replaceAll( "(?i)onrowsinserted", "ON-ROWsinserted" );
        param = param.replaceAll( "(?i)oncontrolselected", "ON-CON-TROLSELECTed" );
        param = param.replaceAll( "(?i)onreadystatechange", "ON-READYSTATECHANGE" );
        param = param.replaceAll( "(?i)onactive", "ON-ACTIVE" );
        param = param.replaceAll( "(?i)oncut", "ON-CUT" );
        param = param.replaceAll( "(?i)onbeforecut", "ON-BEFOREcut" );
        param = param.replaceAll( "(?i)ondbclick", "ON_DBCLICK" );
        param = param.replaceAll( "(?i)ondeactivate", "ON-DEACTIVATE" );
        param = param.replaceAll( "(?i)ondrag", "ON-DRAG" );
        param = param.replaceAll( "(?i)ondragend", "ON-DRAGend" );
        param = param.replaceAll( "(?i)ondragenter", "ON-DRAGenter" );
        param = param.replaceAll( "(?i)ondragleave", "ON-DRAGleave" );
        param = param.replaceAll( "(?i)ondragover", "ON-DRAGover" );
        param = param.replaceAll( "(?i)ondragstart", "ON-DRAGstart" );
        param = param.replaceAll( "(?i)ondrop", "ON-DROP" );
        param = param.replaceAll( "(?i)onfinish", "ON-FINISH" );
        param = param.replaceAll( "(?i)vbscript", "VB-SCRIPT" );
        param = param.replaceAll( "(?i)onrowsdelete", "ON-ROWsdelete" );
        param = param.replaceAll( "(?i)onmouseleave", "ON-MOUSEleave" );
        param = param.replaceAll( "(?i)innerHTML", "innerHTML" );
        param = param.replaceAll( "(?i)onfocusout", "ON-FOCUSout" );
        param = param.replaceAll( "(?i)onbounce", "ON-BOUNCE" );
        param = param.replaceAll( "(?i)onmouseenter", "ON-MOUSEenter" );
        param = param.replaceAll( "(?i)onsubmit", "ON-SUBMIT" );
        param = param.replaceAll( "(?i)onmouseend", "ON-MOUSEend" );
        param = param.replaceAll( "(?i)onresizestart", "ON-RESIZEstart" );
        param = param.replaceAll( "(?i)onunload", "ON-UNLOAD" );
        param = param.replaceAll( "(?i)onselectstart", "ON-SELECTstart" );
        param = param.replaceAll( "(?i)onreset", "ON-RESET" );
        param = param.replaceAll( "(?i)onmove", "ON-MOVE" );
        param = param.replaceAll( "(?i)onstop", "ON-STOP" );
        param = param.replaceAll( "(?i)onrowexit", "ON-ROWexit" );
        param = param.replaceAll( "(?i)onerrorupdate", "ON-ERRORupdate" );
        param = param.replaceAll( "(?i)onfilterchage", "ON-FILTERchange" );
        param = param.replaceAll( "(?i)onlosecapture", "ON-LOSECAPTURE" );
        param = param.replaceAll( "<!--", "!==" );
        param = param.replaceAll( "-->", "==" );
        param = param.replaceAll( "<", "&lt;" );
        param = param.replaceAll( ">", "&gt;" );
        param = param.replaceAll( "%00", " " );
        param = param.replaceAll( "%20", " " );
        param = param.replaceAll( "%3d", " " );
        param = param.replaceAll( "\'", "′" );
        param = param.replaceAll( "%", "％" );
        param = param.replaceAll( "..\\\\", " " );
        param = param.replaceAll( "%2F", " " );
        
        param = param.replaceAll( "(?i)javascript", "JAVA-SCRIPT" );
        param = param.replaceAll( "(?i)prompt", "PRO-MPT" );
        
        return param;
    }
    
    public static String certXSSCheck( String src ) {
        
    	src = src.replaceAll( "<", "&lt;" ).replaceAll( ">", "&gt;" );
        
        src = src.replaceAll( "\\*", " " );
        src = src.replaceAll( "\\?", " " );
        src = src.replaceAll( "\\[", " " );
        src = src.replaceAll( "\\{", " " );
        src = src.replaceAll( "\\(", " " );
        src = src.replaceAll( "\\)", " " );
        src = src.replaceAll( "\\^", " " );
        src = src.replaceAll( "\\$", " " );
        src = src.replaceAll( "'", " " );
        src = src.replaceAll( "@", " " );
        src = src.replaceAll( "%", " " );
        src = src.replaceAll( ";", "；" );
        src = src.replaceAll( ":", "：" );
        src = src.replaceAll( "-", "￣" );
        src = src.replaceAll( "#", " " );
        src = src.replaceAll( "--", " " );
        src = src.replaceAll( "-", " " );
        src = src.replaceAll( ",", " " );
        
        // 아래 들어가면 제대로 디코딩 안됨
        //            src = src.replaceAll( "\\+", " " );
        //            src = src.replaceAll( "/", " " );
        //            src = src.replaceAll( "=", " " );
        
        return src;
    }
    
    
    public static void cleanEditor( Map<String, Object> resultMap, String key, boolean isForm ) throws Exception {
        
       // cleanEditor( resultMap, key, isForm, false );
        
    }
    
    public static String cleanEditor( Object src, boolean isForm, boolean isEvent ) throws Exception {
        
        return cleanEditor( (String)src, isForm, isEvent );
        
    }
    
    public static String cleanEditor( Object src, boolean isForm ) throws Exception {
        
        return cleanEditor( src, isForm, false );
        
    }
       
}