package kr.co.SAMGUN.util;

public class ConstantUtil {
	
	private static String BOARD_DIV = "10";
	private static String BOARD_DIV2 = "20";
	private static String PAGE_NO = "10";
	private static String PAGE_SIZE = "10";
	private static int BOARD_MAX_LENGTH = 3; //÷������ �ִ� ����
	private static int BOARD_MIN_LENGTH = 1; //÷������ �ּ� ����
	private static String MOTHER_TONGUE = "10"; // ����
	private static String ENGLISH = "20"; // ����
	private static String  MATH = "30"; // ����
	
	public static String getBOARD_DIV() {
		return BOARD_DIV;
	}
	public void setBOARD_DIV(String bOARD_DIV) {
		BOARD_DIV = bOARD_DIV;
	}
	public static String getBOARD_DIV2() {
		return BOARD_DIV2;
	}
	public void setBOARD_DIV2(String bOARD_DIV2) {
		BOARD_DIV2 = bOARD_DIV2;
	}
	public static String getPAGE_NO() {
		return PAGE_NO;
	}
	public void setPAGE_NO(String pAGE_NO) {
		PAGE_NO = pAGE_NO;
	}
	public static String getPAGE_SIZE() {
		return PAGE_SIZE;
	}
	public void setPAGE_SIZE(String pAGE_SIZE) {
		PAGE_SIZE = pAGE_SIZE;
	}
	public static int getBOARD_MAX_LENGTH() {
		return BOARD_MAX_LENGTH;
	}
	public void setBOARD_MAX_LENGTH(int bOARD_MAX_LENGTH) {
		BOARD_MAX_LENGTH = bOARD_MAX_LENGTH;
	}
	public static int getBOARD_MIN_LENGTH() {
		return BOARD_MIN_LENGTH;
	}
	public void setBOARD_MIN_LENGTH(int bOARD_MIN_LENGTH) {
		BOARD_MIN_LENGTH = bOARD_MIN_LENGTH;
	}
	public static String getMOTHER_TONGUE() {
		return MOTHER_TONGUE;
	}
	public void setMOTHER_TONGUE(String mOTHER_TONGUE) {
		MOTHER_TONGUE = mOTHER_TONGUE;
	}
	public static String getENGLISH() {
		return ENGLISH;
	}
	public void setENGLISH(String eNGLISH) {
		ENGLISH = eNGLISH;
	}
	public static String getMATH() {
		return MATH;
	}
	public void setMATH(String mATH) {
		MATH = mATH;
	}
	
}
