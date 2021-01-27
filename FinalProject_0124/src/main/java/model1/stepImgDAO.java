package model1;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class stepImgDAO {
	
	public boolean recipeUpload(int rcseq, String strStepNum, MultipartHttpServletRequest multi) {

		boolean isSuccess = false;
		//파일 업로드 경로
		//String uploadThumbPath = "/var/lib/tomcat9/webapps/FinalProject/picture/"+rcseq+"/Thumb/";
		//String uploadThumbPath = "\"D:/workspace/FinalProject_1031_0900/src/main/webapp/picture/" + rcseq + "/Thumb/";
		String uploadThumbPath = "D:/workspace2/FinalProject_0124/src/main/webapp/picture/" + rcseq + "/Thumb/";
				
		File thumbDir = new File(uploadThumbPath);

		if (!thumbDir.isDirectory()) {
			thumbDir.mkdirs();
		}
		
		 String uploadStepPath ="D:/workspace2/FinalProject_0124/src/main/webapp/picture/"+rcseq+ "/Step/";
		
		// String uploadStepPath ="D:/workspace/FinalProject_1031_0900/src/main/webapp/picture/"+rcseq+ "/Step/";
		//String uploadStepPath = "/var/lib/tomcat9/webapps/FinalProject/picture/"+rcseq+"/Step/";
		
		File stepDir = new File(uploadStepPath);

		if (!stepDir.isDirectory()) {
			stepDir.mkdirs();
		}
		
		String uploadWorkPath ="D:/workspace2/FinalProject_0124/src/main/webapp/picture/"+rcseq+ "/Work/";
		//String uploadThumbPath = "\"D:/workspace/FinalProject_1031_0900/src/main/webapp/picture/"+rcseq+ "/Work/";
		 //String uploadWorkPath ="/var/lib/tomcat9/webapps/FinalProject/picture/" + rcseq + "/Work/";
		 
		
		File workDir = new File(uploadWorkPath);

		if (!workDir.isDirectory()) {
			workDir.mkdirs();
		}
		
		int stepNum = Integer.parseInt(strStepNum);
		
		int count = 1;		
		
		Iterator<String> iter = multi.getFileNames();	
		
		String upPath="";
		String gubun="";
		int order = 0;
		
		int sorder = -1;
		int worder = -1;
		int torder = 0;
		
		while(iter.hasNext()) {
			String uploadFileName = iter.next();
						
			if(count<=1) {
				torder++;
				order = torder;
				upPath = uploadThumbPath;
				gubun = "_thumb_";
				
			}else if(count >= 2 && count <= stepNum) {
				sorder++;
				order = sorder;
				upPath = uploadStepPath;
				gubun = "_step_";
			}else {
				worder++;
				order=worder;
				upPath = uploadWorkPath;
				gubun = "_work_";
			}
					
			MultipartFile mFile = multi.getFile(uploadFileName);
			String originalFileName = mFile.getOriginalFilename();
			String saveFileName = "";						
				
			if(!originalFileName.equals("") && originalFileName !=null ) {
			
			int pos = originalFileName.lastIndexOf(".");
			String ext = originalFileName.substring( pos );
			System.out.println("확장자 테스트 : " + ext);
			saveFileName = rcseq + gubun + order + ext;
			
			try {
				mFile.transferTo(new File(upPath + saveFileName));
				isSuccess = true;				
			} catch (IllegalStateException e) {
				e.printStackTrace();
				isSuccess = false;
			} catch (IOException e) {
				e.printStackTrace();
				isSuccess = false;
			}
			
			count++;
			
			}
			
		} // while end
		return isSuccess;
	} // fileUpload end
	
	
	
	/*
	 * public boolean thumbUpload(MultipartHttpServletRequest multi) {
	 * 
	 * boolean isSuccess = false;
	 * 
	 * String uploadPath =
	 * "C:/ajax/ajax-workspace/FinalProject_1020/src/main/webapp/picture/thumb/";
	 * 
	 * File dir = new File(uploadPath);
	 * 
	 * if (!dir.isDirectory()) { dir.mkdirs(); }
	 * 
	 * Iterator<String> iter = multi.getFileNames(); while(iter.hasNext()) { String
	 * uploadFileName = iter.next();
	 * 
	 * MultipartFile mFile = multi.getFile(uploadFileName); String originalFileName
	 * = mFile.getOriginalFilename(); String saveFileName = originalFileName;
	 * 
	 * if(saveFileName != null && !saveFileName.equals("")) { if(new File(uploadPath
	 * + saveFileName).exists()) { saveFileName = saveFileName + "_" +
	 * System.currentTimeMillis(); }
	 * 
	 * try { mFile.transferTo(new File(uploadPath + saveFileName)); isSuccess =
	 * true; } catch (IllegalStateException e) { e.printStackTrace(); isSuccess =
	 * false; } catch (IOException e) { e.printStackTrace(); isSuccess = false; } }
	 * // if end } // while end return isSuccess; } // fileUpload end
	 */
}
