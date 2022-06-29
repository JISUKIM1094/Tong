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

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

//관리자- 공지사항 내용 출력  /admin/noticeWrite.do
public class NoticeWriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("./ad_noticeWrite.jsp").forward(req, resp);
	}
	@Override
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String saveDirectory= req.getServletContext().getRealPath("/Uploads"); 
		ServletContext application = getServletContext();
		int maxPostSize= Integer.parseInt(application.getInitParameter("maxPostSize")); 
		
		MultipartRequest mr= FileUtil.uploadFile(req,saveDirectory,maxPostSize);
		if(mr ==null) { 
			JSFunction.alertLocation(resp, "첨부파일이 제한용량을 초과합니다.", "../mvcboard/write.do"); 
			return; 
		}
		
		Tong_noticeDTO dto = new Tong_noticeDTO();
		dto.setTitle(mr.getParameter("title"));
		dto.setContent(mr.getParameter("content"));
		dto.setInputId(mr.getParameter("inputId"));
		
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
		
		Tong_noticeDAO dao = new Tong_noticeDAO();
    	int result = dao.insertWrite(dto);
    	
//    	int iResult =0;
//    	for(int i=1;i<=100;i++){
//    		dto.setTitle(mr.getParameter("title")+"-"+i);
//    		iResult = dao.insertWrite(dto);
//    	}
    	
    	dao.close();
    	
    	if(result==1) resp.sendRedirect("./noticeList.do");
    	else {
    		resp.sendRedirect("./ad_noticeWrite.jsp");
    		System.out.println("공지 업로드 실패");
    	}
	}
	
}