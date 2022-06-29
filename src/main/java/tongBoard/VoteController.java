package tongBoard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;
@WebServlet("/vote.do")
//사용자- 투표진행
public class VoteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String select= req.getParameter("select");
		String num = req.getParameter("num");
		System.out.println(" 게시물: "+ num+" 투표: "+select);
		Tong_voteDAO dao = new Tong_voteDAO();
		dao.voteProcess(select,num);
		
		
		/*
		 * Map<String, Object> map= new HashMap<String, Object>(); //파라미터 및 view로 전달 할
		 * 데이터를 저장하기 위해 Map컬렉션 생성 List<Tong_voteDTO> boardLists =
		 */			
		Tong_voteDTO dto = new Tong_voteDTO();

		dto = dao.voteResult(num); //현재 페이지에 출력 할 게시물을 얻어옴
		dao.close();
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("./voteRs.jsp").forward(req, resp); //view로 포워드

		System.out.println("투표완료");
	}
}