package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.JSFunction;


@WebServlet("/memberUpdate.do") 
public class MemberUpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String inputId= req.getParameter("inputId");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.member_info(inputId);
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("memberUpdate.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		System.out.println("회원 정보 수정중...");
		
		System.out.println( "id: "+ req.getParameter("inputId") +
				"mail: "+ req.getParameter("inputEmail") +
				"pass: "+ req.getParameter("inputPassword")+ 
				"pass: "+ req.getParameter("origin_pass") );
		
		
    	MemberDTO dto = new MemberDTO();
    	dto.setInputId(req.getParameter("inputId"));
		dto.setEmail(req.getParameter("inputEmail"));
		dto.setFirstName(req.getParameter("inputFirstName"));
		dto.setLastName(req.getParameter("inputLastName"));
		dto.setGender(req.getParameter("inputGender"));
		dto.setAge(req.getParameter("inputAge"));
		
		
		if(req.getParameter("inputPassword") != "")
			dto.setPass(req.getParameter("inputPassword"));
		else 
			dto.setPass(req.getParameter("origin_pass"));

		MemberDAO dao = new MemberDAO();
    	int result = dao.member_update(dto);
    	
		if(result==1) {
			JSFunction.alertLocation(resp,"회원 정보 수정으로 로그아웃 됩니다.", "./logout.do");
		}
		else JSFunction.alertBack(resp, "수정 안됨");
    	
	}
	
}
