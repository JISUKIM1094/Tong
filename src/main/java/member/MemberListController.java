package member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// @WebServlet("/admin/memberList.do")
public class MemberListController extends HttpServlet { //게시판 목록 요청 처리를 위한 서블릿 클래스
	//목록의 경우 메뉴를 클릭한 후 이동하므로 get방식으로 요청하게 된다.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO(); //커넥션 풀을 이용한 DB연결을 위해 DAO객체 생성
			
		Map<String, Object> map= new HashMap<String, Object>(); //파라미터 및 view로 전달 할 데이터를 저장하기 위해 Map컬렉션 생성	
		 
		List<MemberDTO> boardLists = dao.memberList(map); //현재 페이지에 출력 할 게시물을 얻어옴
		dao.close();//커넥션풀에 자원반납
		//view로 전달 할 객체 request영역에 저장
		req.setAttribute("boardLists",boardLists);
		req.setAttribute("map", map);
		req.getRequestDispatcher("./memberList.jsp").forward(req, resp); //view로 포워드
	}
}
