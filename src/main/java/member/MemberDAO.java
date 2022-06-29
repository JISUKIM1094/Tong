package member;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpSession;

import common.DBConnPool;
//모델2 방식의 자료실형 게시판에서 사용 할 DAO클래스 생성
import tongBoard.Tong_voteDTO;

public class MemberDAO extends DBConnPool{  
	public MemberDAO() {
		super();  
	}
/*
	public int selectCount(Map<String, Object> map) { 
		// String: 셀렉트 타입에 있는 제목/내용 중에 선택 된 하나. searchField
		// Object: 검색어. searchWord 
			
		int totalCnt =0;
		String query = "SELECT COUNT(*) FROM tong_member ";
		if(map.get("searchWord") !=null) {//검색어 있을 경우 조건부로 WHERE절 추가 
			query +=" WHERE "+map.get("searchField")+" "+" LIKE '"+map.get("searchWord")+"%'";
		}
		
		try { 
			stmt = con.createStatement(); //정적쿼리문이므로 정적객체로 실행
			rs= stmt.executeQuery(query);
			//count(*)를 통한 쿼리문은 항상 null값이 없으므로 (0~정수) if문이 필요없다.
			
			rs.next(); //결과를 한 행 읽어온다.
			totalCnt = rs.getInt(1);
			System.out.println("회원 수 구하기 완료");
		}catch (Exception e) {
			System.out.println("회원 수 구하는 중 예외발생!");
			e.printStackTrace();
		}
		return totalCnt;
	}
*/
	
	
	
	
	public List<MemberDTO> memberList(Map<String, Object> map) {
		List<MemberDTO> board = new Vector<MemberDTO>();
		
		String query = "SELECT * FROM tong_member "; 
		try {
			stmt = con.createStatement();
			rs= stmt.executeQuery(query); 
			// 추출 된 결과에 따라 갯수만큼 반복.
			while (rs.next()) {
            	MemberDTO dto = new MemberDTO();
                dto.setInputId(rs.getString(1));
                dto.setEmail(rs.getString(2));
                dto.setPass(rs.getString(3));
                dto.setPostdate(rs.getDate(4));
                dto.setFirstName(rs.getString(5));
                dto.setLastName(rs.getString(6));
                dto.setGender(rs.getString(7));
                dto.setAge(rs.getString(8));
                dto.setAdminId(rs.getString(9));
                
                board.add(dto);
            }            
			System.out.println("회원 조회완료");
		}catch (Exception e) {
            System.out.println("회원 조회중 예외 발생");
			e.printStackTrace();
		}
		return board; 
	}
	
	
	
	public boolean member_login(String inputId, String pass) {
		boolean isCorr = true;
		try {
			String sql=" SELECT COUNT(*) FROM tong_member WHERE inputId=? AND pass=? ";
			psmt=con.prepareStatement(sql);
			psmt.setString(1,inputId);
			psmt.setString(2,pass);
			rs=psmt.executeQuery();
			rs.next();
			System.out.println("회원 로그인 중...");
			if(rs.getInt(1)==0) isCorr=false;
		} catch (Exception e) {
			isCorr=false;
			e.printStackTrace();
			System.out.println("로그인 예외");
		}
		return isCorr;
	}
	public boolean admin_login(String inputId, String pass, String admin) {
		boolean isCorr = true;
		try {
			String sql=" SELECT COUNT(*) FROM tong_member WHERE inputId=? AND pass=? AND adminId=? ";
			psmt=con.prepareStatement(sql);
			psmt.setString(1,inputId);
			psmt.setString(2,pass);
			psmt.setString(3,admin);
			rs=psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) isCorr=false;
			System.out.println("관리자 로그인 중...");
		} catch (Exception e) {
			isCorr=false;
			e.printStackTrace();
			System.out.println("로그인 예외");

		}
		return isCorr;
	}
	
	public String admin_chk(String inputId) {
		String isAd="0";
		try {
			System.out.println("관리자 확인 중");
			String sql=" SELECT COUNT(*) FROM tong_member WHERE inputId=? AND adminId=0 ";
			//관리자 권한을 가진 id인가?
			psmt=con.prepareStatement(sql);
			psmt.setString(1,inputId);
			rs=psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) isAd= null;

		} catch (Exception e) {
			isAd =null;
			e.printStackTrace();
			System.out.println("관리자 확인 예외");
		}
		return isAd;
	}
	
	public int member_join(MemberDTO dto) {
		int result =0;
		try{
			String query =
			"INSERT INTO tong_member (inputId, email, pass, first_name, last_name, gender, age)"
			+ " VALUES (?, ?, ?, ?, ?, ?, ?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getInputId());
			psmt.setString(2, dto.getEmail());
			psmt.setString(3, dto.getPass());
			psmt.setString(4, dto.getFirstName());
			psmt.setString(5, dto.getLastName());
			psmt.setString(6, dto.getGender());
			psmt.setString(7, dto.getAge());
			
			result = psmt.executeUpdate(); 
			
		}catch (Exception e) {
			System.out.println("회원가입 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}	
	
	public int member_unjoin(String inputId) {
		int result =0;

		String query=" DELETE FROM tong_member WHERE inputId=? ";
		
		try{
			psmt = con.prepareStatement(query);
			psmt.setString(1,inputId);
			result = psmt.executeUpdate(); 
			System.out.println(result+"회원정보 삭제");
			
		}catch (Exception e) {
			System.out.println("회원정보 삭제 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
	
// 회원정보 검색
	public MemberDTO member_info(String inputId) {
    	MemberDTO dto = new MemberDTO();

		String query = " SELECT * FROM tong_member WHERE inputId=? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, inputId);
			rs= psmt.executeQuery();
			
			if(rs.next()) {
				dto.setInputId(rs.getString(1));
                dto.setEmail(rs.getString(2));
                dto.setPass(rs.getString(3));
                dto.setPostdate(rs.getDate(4));
                dto.setFirstName(rs.getString(5));
                dto.setLastName(rs.getString(6));
                dto.setGender(rs.getString(7));
                dto.setAge(rs.getString(8));
                dto.setAdminId(rs.getString(9));
            }            
			System.out.println("회원 수정중 ");
		}catch (Exception e) {
            System.out.println("회원 수정중 예외 발생");
			e.printStackTrace();
		}
		return dto; 
	}
	
	
// 회원정보 수정 
	public int member_update(MemberDTO dto ) {
		int result =0;
		
		String query=" UPDATE tong_member SET "
				+ " email = ?, pass = ?, "
				+ "	first_name=? , last_name=? , gender=?, age=? "
				+ "    WHERE inputId = ? ";
		
		try{
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getEmail());
			psmt.setString(2, dto.getPass());
			psmt.setString(7, dto.getInputId());
			psmt.setString(3, dto.getFirstName());
			psmt.setString(4, dto.getLastName());
			psmt.setString(5, dto.getGender());
			psmt.setString(6, dto.getAge());
			
			result = psmt.executeUpdate(); 
			System.out.println(result+"회원정보 수정");
			
		}catch (Exception e) {
			System.out.println("회원정보 수정 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
	//ID 중복확인
	public int checkId(String inputId) {
		String sql = "SELECT COUNT(*) FROM tong_member WHERE inputId=? ";
		int idCheck=0;
		
		try {
			psmt= con.prepareStatement(sql);
			psmt.setString(1, inputId);
			rs= psmt.executeQuery();
			rs.next(); 
			System.out.println("id중복 검사중..");
			if(rs.getInt(1)==0) idCheck =1;//생성가능
			else idCheck =0; 
				
		}catch (Exception e) {
			e.printStackTrace();
			System.err.println("id체크 오류");
		}
		return idCheck;
	}
	
	
	
	/*
	
//수정, 삭제 할 때 비번검증	
	
	
//게시물 삭제	
	public int deletePost(String idx) {
		int result=0;
		try {
			String query=" DELETE FROM mvcboard WHERE idx=? ";
			psmt=con.prepareStatement(query);
			psmt.setString(1,idx);
			result=psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
// 게시물 수정
	 public int updatePost(MVCBoardDTO dto) {
		int result =0;
		try{
			String query =" UPDATE mvcboard SET name=? ,title=? ,content=? ,ofile=? , sfile=? WHERE idx=? and pass=? ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile()); //원본파일명
			psmt.setString(5, dto.getSfile()); //서버에 저장할 파일명
			psmt.setString(6, dto.getIdx()); // idx받아올것
			psmt.setString(7, dto.getPass()); //비회원제 게시판이므로 수정, 삭제를 위한 인증에 사용됨
			result = psmt.executeUpdate(); 
		}catch (Exception e) {
			System.out.println("게시물 수정 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	*/
}