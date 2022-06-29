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
//@WebServlet("/admin/voteList.do")
//관리자- 투표항목 관리
public class VoteListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Tong_voteDAO dao = new Tong_voteDAO();
		
		System.out.println("관리자에서 투표 항목 목록출력"+req.getParameter("mode"));
		Map<String, Object> map= new HashMap<String, Object>(); 	
		List<Tong_voteDTO> boardLists = dao.voteList(map);
		
		req.setAttribute("boardLists",boardLists);
		req.setAttribute("map", map);
		
		req.getRequestDispatcher("./ad_vote.jsp").forward(req, resp); 
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Tong_voteDAO dao = new Tong_voteDAO();
		Tong_voteDTO dto = new Tong_voteDTO();
		int result=0;
		
		if(req.getParameter("mode").equals("del")) {
		 	String num= (req.getParameter("num"));
			result = dao.voteDelete(num);
			
			System.out.println("삭제중..."+req.getParameter("num"));
			if(result==1) JSFunction.alertLocation(resp, "삭제완료","./voteList.do"); 
			else	JSFunction.alertBack(resp, " 삭제오류");
		}
		else if(req.getParameter("mode").equals("add")) {
			dto.setTitle(req.getParameter("title"));
			dto.setContent1(req.getParameter("content1"));
			dto.setContent2(req.getParameter("content2"));
			dto.setInputId(req.getParameter("inputId"));
			result = dao.voteAdd(dto);
			
			System.out.println("투표 항목 추가중..."+req.getParameter("inputId"));
			if(result==1) 
				JSFunction.alertLocation(resp,"투표 항목 리스트에 추가", "./voteList.do");
	    	else 
	    		JSFunction.alertBack(resp, "투표항목 리스트에 추가 실패");
			}
		
    	
		
	
	}
}