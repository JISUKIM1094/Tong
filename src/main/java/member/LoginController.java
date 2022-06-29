package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String inputId= req.getParameter("inputId");
		String inputPass= req.getParameter("inputPass");
		String admin= req.getParameter("admin");
		System.out.printf(inputId, inputPass);
		
		
		
		MemberDAO dao = new MemberDAO();
		boolean login = false ;
		boolean	ad_login = false ;
		
		if(admin==null) {
			System.out.println("회원페이지 로그인 admin: "+admin);
			login = dao.member_login(inputId, inputPass); //회원 로그인
		}
		else {
			System.out.println("관리자 페이지 로그인 admin: "+admin);
			ad_login = dao.admin_login(inputId, inputPass, admin); //관리자 로그인
		}
		
		
		admin= dao.admin_chk(inputId);
		dao.close();
		
		
		System.out.println(admin);
		HttpSession session = req.getSession();
		session.setAttribute("admin", admin);
		
		
		if(login) { //멤버로그인 성공
			session.setAttribute("inputId", inputId);
			session.setAttribute("pass", inputPass);
			
			JSFunction.alertLocation(resp, "로그인 되었습니다.","./main.jsp");
			
		}else if (ad_login){ //관리자로그인 성공
			session.setAttribute("inputId", inputId);
			session.setAttribute("pass", inputPass);
			
			JSFunction.alertLocation(resp, "관리자 로그인 되었습니다.","./admin/main.jsp");
		}
		else JSFunction.alertBack(resp, "로그인 실패");
	}
}


