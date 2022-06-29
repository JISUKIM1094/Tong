package tongBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/noticeView.do")
//사용자- 공지사항 내용 출력
public class NoticeViewController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 서블릿의 수명주기 메서드 중 사용자의 요청을 전송방식에 따라 doGet, doPost로 분기해주는 역할
			//이므로 방식에 상관없이 요청 처리도 가능하다.
		Tong_noticeDAO dao = new Tong_noticeDAO(); //커넥트풀을 통해 DB연결
		String num =req.getParameter("num"); // 일련번호 파라미터로 획득
		dao.updateVistiCount(num); //조회수 증가
		Tong_noticeDTO dto = dao.selectView(num); //게시물 내용 조회
		String fileName= dto.getSfile();
		req.setAttribute("fileName", fileName);
		System.err.println(num+" 파일이름: "+fileName+ dto.getOfile());
				
		if (fileName !=null) {
			String ext= fileName.substring(fileName.lastIndexOf(".")+1); 
				//파일명에서 확장자 앞 .(닷)의 인덱스를 통해 '.확장자'획득
				//+1로 . 빼고 확장자만 획득
			req.setAttribute("ext", ext);
			
			/* 쌤꺼
				String filetype= "";
				if(ext.equals("jsp") ||ext.equals("png") ||ext.equals("gif"))
					filetype= "img";
				else if(ext.equals("mp3")) filetype="music";
				req.setAttribute("filetype", filetype);
				*/
		}
		
		dao.close();
		
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>")); //내용 줄바꿈태그 처리 
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("./noticeView.jsp").forward(req, resp);
		
		}	
	
	
}