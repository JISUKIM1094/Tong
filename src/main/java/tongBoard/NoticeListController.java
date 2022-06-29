package tongBoard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.JSFunction;
//@WebServlet("/admin/noticeLits.do")
//관리자- 공지사항 관리
public class NoticeListController extends HttpServlet{
	@Override
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Tong_noticeDAO dao = new Tong_noticeDAO();
		Map<String, Object> map= new HashMap<String, Object>(); //파라미터 및 view로 전달 할 데이터를 저장하기 위해 Map컬렉션 생성
		 
		
		
		
		/*
		ServletContext application = getServletContext();//jsp가 아닌 서블릿이기 때문에 내장객체를 얻어온다. 
		//web.xml에 초기화 되어있는 컨텍스트 파라미터를 얻어온다.
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE")); // 한페이지 당 출력할 게시물의 개수
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK")); // 한 블럭 당 출력 할 페이지 번호 개수
		
		int pageNum=1; //목록에 첫 진입 시 페이지 넘버 1로 초기화
		//특정 페이지로 진입 한 경우 파라미터를 받아서 구간을 계산하여 얻어옴
		String pageTemp= req.getParameter("pageNum"); // 파라미터로 넘어오는 pageNum의 값을 얻어와서
		if(pageTemp!=null && !pageTemp.equals("")) 
			pageNum = Integer.parseInt(pageTemp); //정수로 변환 후 현재페이지 번호로 지정
		
		int start= (pageNum-1) * pageSize +1;
		int end= pageNum * pageSize;
		//계산된 구간 값을 Model(DB)로 전달하기 위해 Map에 저장.
		map.put("start",start);
		map.put("end",end);
		*/
		
		List<Tong_noticeDTO> boardLists = dao.selectList(map);
		dao.close();
		
		req.setAttribute("boardLists",boardLists);
		req.setAttribute("map", map);
		req.getRequestDispatcher("./ad_noticeList.jsp").forward(req, resp); 	
		
		}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		Tong_noticeDAO dao = new Tong_noticeDAO();
		int result=0;
		
		if(req.getParameter("mode").equals("del")) {
		 	String num= (req.getParameter("num"));
			result = dao.voteDelete(num);
			
			System.out.println("삭제중..."+req.getParameter("num"));
			if(result==1) JSFunction.alertLocation(resp, "삭제완료","./boardList.do"); 
			else	JSFunction.alertBack(resp, " 삭제오류");
		}
		*/
	}
}