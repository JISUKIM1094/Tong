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

import utils.JSFunction;
@WebServlet("/voteBoard.do")
//사용자- 투표 목록 출력
public class VoteBoardController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Tong_voteDAO dao = new Tong_voteDAO();
		Map<String, Object> map= new HashMap<String, Object>(); //파라미터 및 view로 전달 할 데이터를 저장하기 위해 Map컬렉션 생성	
		
		List<Tong_voteDTO> boardLists = dao.voteList(map);
		dao.close();
		
		req.setAttribute("boardLists",boardLists);
		req.setAttribute("map", map);
		
		req.getRequestDispatcher("./vote.jsp").forward(req, resp); 
	}
	
}