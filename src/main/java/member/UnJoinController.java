package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

@WebServlet("/memberUnjoin.do")
public class UnJoinController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String inputId= (req.getParameter("inputId"));
		
		System.out.println("회원탈퇴중..."+req.getParameter("inputId"));
		MemberDAO dao = new MemberDAO();
		int result = dao.member_unjoin(inputId);
		
		if(result==1) {
			HttpSession session = req.getSession();
			session.removeAttribute("inputId");
			session.removeAttribute("inputPass");
			session.invalidate();
			JSFunction.alertLocation(resp, "탈퇴완료","./"); 
		}
		else { 
			JSFunction.alertBack(resp, "탈퇴 오류");
		}
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
    	
	}
}
