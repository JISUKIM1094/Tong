package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.JSFunction;

@WebServlet("/memberJoin.do")
public class JoinController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("EUC-KR");
		String inputId= req.getParameter("inputId");
		PrintWriter out = resp.getWriter();
		System.out.println("입력ID: "+inputId);
		
		MemberDAO dao = new MemberDAO();
		int idCheck = dao.checkId(inputId);
		if(idCheck==0) System.out.println("이미 존재하는 아이디입니다.");
		else System.out.println("사용 가능한 아이디 입니다.");
		out.write(idCheck+""); //ajax의 result. String으로 값을 내보내기위해 +""를 해준다. 
		
    	dao.close();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String inputId= req.getParameter("inputId");
		
		System.out.println("회원가입중..."+inputId);
		
    	MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();

    	dto.setInputId(req.getParameter("inputId"));
		dto.setEmail(req.getParameter("inputEmail"));
		dto.setPass(req.getParameter("inputPassword"));
		
    	int result = dao.member_join(dto);
    	dao.close();
    	
		if(result==1) 
			JSFunction.alertLocation(resp, "회원가입 완료! 로그인하세요", "./memberLogin.jsp");
    	else {
    		JSFunction.alertBack(resp, "회원가입 안됨");
    	}
    	
	}
}
