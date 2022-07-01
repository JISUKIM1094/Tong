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
@WebServlet("/comment.do")
//사용자-댓글작성
public class VoteCommController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//댓글 보여주기
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Tong_commDAO dao = new Tong_commDAO();
		Tong_commDTO dto = new Tong_commDTO();
		int result=0;
		
		if(req.getParameter("mode").equals("del")) {
		 	String num= (req.getParameter("num"));
			result = dao.commDelete(num);
			
			System.out.println("삭제중..."+req.getParameter("flag"));
			if(result==1) JSFunction.alertLocation(resp, "삭제완료","./comm.do"); 
			else	JSFunction.alertBack(resp, " 삭제오류");
		}
		else if(req.getParameter("mode").equals("add")) {
			dto.setInputId(req.getParameter("inputId"));
			dto.setComments(req.getParameter("comments"));
			dto.setFlag(req.getParameter("flag"));
			result = dao.commAdd(dto);
			
			System.out.println("댓글작성중..."+req.getParameter("flag"));
			if(result==1) 
				JSFunction.alertLocation(resp,"댓 추가", "./comment.do");
	    	else 
	    		JSFunction.alertBack(resp, "댓 추가 실패");
			}
		
    	
		
	
	}
}