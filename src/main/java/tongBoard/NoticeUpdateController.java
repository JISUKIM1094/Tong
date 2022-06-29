package tongBoard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;
//@WebServlet("/admin/noticeUpdate.do")
//관리자- 공지사항 수정삭제
public class NoticeUpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Tong_noticeDAO dao = new Tong_noticeDAO();
		String mode= req.getParameter("mode");
		String num= (req.getParameter("num"));
		System.out.println("공지사항 "+mode+num);
		System.out.println("ID: "+req.getParameter("inputId"));
		if(req.getParameter("inputId").equals(req.getParameter("session_inputId"))) { //본인인증
			if(mode!=null) { //삭제
				int result=0;
				System.out.println("삭제중..."+num);
				result = dao.deletePost(num);
				
				if(result==1)
					JSFunction.alertLocation(resp, "삭제완료","./noticeList.do"); 
				else	JSFunction.alertBack(resp, " 삭제오류");
			}
		
			else { //공지사항 수정 입력창
				System.out.println("수정중..."+num);
				Tong_noticeDTO dto = dao.selectView(num);
				req.setAttribute("dto", dto);
				req.getRequestDispatcher("./ad_noticeUpdate.jsp").forward(req, resp);
				}
		}
		else	JSFunction.alertBack(resp, " 작성자가 아닙니다."); 
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		String saveDirectory= req.getServletContext().getRealPath("/Uploads"); 
		ServletContext application = getServletContext();
		int maxPostSize= Integer.parseInt(application.getInitParameter("maxPostSize")); 
		
		MultipartRequest mr= FileUtil.uploadFile(req,saveDirectory,maxPostSize);
		if(mr ==null) { 
			JSFunction.alertLocation(resp, "첨부파일이 제한용량을 초과합니다.", "./noticeUpdate.do"); 
			return; 
		}

		
		String num = mr.getParameter("num");
		String prevOfile = mr.getParameter("prevOfile");
		String prevSfile = mr.getParameter("prevSfile");
		
		
		Tong_noticeDTO dto = new Tong_noticeDTO();
		dto.setNum(mr.getParameter("num"));
		dto.setTitle(mr.getParameter("title"));
		dto.setContent(mr.getParameter("content"));
		
		
		HttpSession session = req.getSession();
		String inputId= (String)session.getAttribute("inputId");
		
		
		String fileName= mr.getFilesystemName("ofile");
		
		
		if(fileName!=null) { 
    		String now= new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date()); 
    		String ext= fileName.substring(fileName.lastIndexOf("."));
    		String newFileName= now+ext;
    		File oldfile= new File(saveDirectory+ File.separator + fileName);
    		File newfile= new File(saveDirectory+ File.separator + newFileName);
    		oldfile.renameTo(newfile);  
    		
    		dto.setOfile(fileName);
    		dto.setSfile(newFileName);
    	}
		
		
		//첨부파일을 삭제 할 경우
		
		if(mr.getParameter("fileDel")!=null) {//두개 이상이면 getP~Val~ 사용해야됨`!!
			//System.out.println("fileDel="+fileDel);
			dto.setOfile(null);
			dto.setSfile(null);
		//	FileUtil.deleteFile(req, "/Uploads", prevSfile);
		}
		else {
			
		
			//첨부된 파일이 있는경우 파일명 변경하여 DTO에 저장한다.
			if(fileName!=null) { 
	    		String now= new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date()); //현재날짜,시간(초의 밀리세컨즈 까지 이용) 으로 파일이름 생성
	    		String ext= fileName.substring(fileName.lastIndexOf(".")); //파일명에서 확장자 앞 .(닷)의 인덱스를 통해 확장자획득
	    		String newFileName= now+ext; //파일이름과 확장자를 합하여 파일명 생성
	    		//서버에 저장 된 파일명을 새로운 파일명으로 변경한다.
	    		File oldfile= new File(saveDirectory+ File.separator + fileName); //서버의 물리적 경로 + 파일구분자("/" or "\") + 기본 파일명
	    		File newfile= new File(saveDirectory+ File.separator + newFileName); //
	    		oldfile.renameTo(newfile);  
	    		
	    		dto.setOfile(fileName);
	    		dto.setSfile(newFileName);
	    		
	    		FileUtil.deleteFile(req, "/Uploads", prevSfile);
	    	}
			else {
				dto.setOfile(prevOfile);
				dto.setSfile(prevSfile);
			}
		}
			
		Tong_noticeDAO dao = new Tong_noticeDAO();
    	int result = dao.updatetWrite(dto);
    	
    	dao.close();
		
			
		System.out.println("공지사항 수정중..."+req.getParameter("mode"));
		if(result==1) 
			JSFunction.alertLocation(resp,"공지수정 완료", "./noticeList.do");
    	else 
    		JSFunction.alertBack(resp, "수정 실패");
	}
}