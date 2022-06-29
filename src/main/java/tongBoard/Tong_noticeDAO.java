package tongBoard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class Tong_noticeDAO extends DBConnPool{ //DB연결은 DBCP(커넥션풀) 을 사용한다.
	public Tong_noticeDAO() {
		super(); //부모클래스의 기본생성자 호출을 통해 DB연결
	}
	
	// num, title, content, inputId, postdate, visitcount, ofile, sfile
	

	
	
	
	public List<Tong_noticeDTO> selectList(Map<String, Object> map) {
		List<Tong_noticeDTO> board = new Vector<Tong_noticeDTO>();
		
		String query = "SELECT * FROM tong_noticeboard ";
		/*
		ORDER BY num DESC";
		String query = "SELECT * FROM ( "
    			+ "    SELECT Tb.*, ROWNUM rNum FROM ( "
	                + "        SELECT * FROM tong_noticeboard ";
	    query += "      	ORDER BY num ASC "
	           + "     ) Tb "
	           + " ) ";
		*/
		try {
			stmt = con.createStatement();
			rs= stmt.executeQuery(query); 
			while (rs.next()) {
				Tong_noticeDTO dto = new Tong_noticeDTO();
				dto.setNum(rs.getString(1));
                dto.setTitle(rs.getString(2));
                dto.setContent(rs.getString(3));
                dto.setInputId(rs.getString(4));
                dto.setPostdate(rs.getDate(5));
                dto.setVisitcount(rs.getInt(6));
                dto.setOfile(rs.getString(7));
                dto.setSfile(rs.getString(8));
	            
	            board.add(dto);
	        }            
			System.out.println("공지 조회완료");
		}catch (Exception e) {
	        System.out.println("공지 조회중 예외 발생");
			e.printStackTrace();
		}
		return board; 
	}
	
	
	public int selectCount(Map<String, Object> map) { // 검색을 위해 매개변수는 Map컬렉션으로 선언했다.
		// String: 셀렉트 타입에 있는 제목/내용 중에 선택 된 하나. searchField
		// Object: 검색어. searchWord 
			
		int totalCnt =0;
		String query = "SELECT COUNT(*) FROM tong_noticeboard ";
		if(map.get("searchWord") !=null) {//검색어 있을 경우 조건부로 WHERE절 추가 
			query +=" WHERE "+map.get("searchField")+" "+" LIKE '"+map.get("searchWord")+"%'";
		}
		try { 
			stmt = con.createStatement(); //정적쿼리문이므로 정적객체로 실행
			rs= stmt.executeQuery(query);
			//count(*)를 통한 쿼리문은 항상 null값이 없으므로 (0~정수) if문이 필요없다.
			
			rs.next(); //결과를 한 행 읽어온다.
			totalCnt = rs.getInt(1);
			
		}catch (Exception e) {
			System.out.println("공지사항 수 구하는 중 예외발생!");
			e.printStackTrace();
		}
		return totalCnt;
	}
	
	public List<Tong_noticeDTO> selectListPage(Map<String, Object> map) {
		List<Tong_noticeDTO> board = new Vector<Tong_noticeDTO>();
		
		
		String query = "SELECT * FROM ( "
    			+ "    SELECT Tb.*, ROWNUM rNum FROM ( "
	                + "        SELECT * FROM tong_noticeboard ";
	    if (map.get("searchWord") != null) {
	        query += " WHERE " + map.get("searchField")
	               + " LIKE '%" + map.get("searchWord") + "%' ";
	    }        
	    query += "      	ORDER BY num DESC "
	           + "     ) Tb "
	           + " ) "
	           + " WHERE rNum BETWEEN ? AND ?";
		try {
			
			psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            rs = psmt.executeQuery();
	            
			while (rs.next()) {
				Tong_noticeDTO dto = new Tong_noticeDTO();
                dto.setNum(rs.getString(1));
                dto.setTitle(rs.getString(2));
                dto.setContent(rs.getString(3));
                dto.setInputId(rs.getString(4));
                dto.setPostdate(rs.getDate(5));
                dto.setVisitcount(rs.getInt(6));
                dto.setOfile(rs.getString(7));
                dto.setSfile(rs.getString(8));
                
                board.add(dto);
            }            
			System.out.println("공지사항 조회완료");
		}catch (Exception e) {
            System.out.println("공지사항 조회중 예외 발생");
			e.printStackTrace();
		}
		return board; 
	}
	

	
// 글 클릭했을 때 내용 보기	
	public Tong_noticeDTO selectView(String num) { //매개변수로 전달 된 일련번호 idx를 통해 하나의 레코드 조회
		Tong_noticeDTO dto = new Tong_noticeDTO(); 
		String query = "SELECT * FROM tong_noticeboard WHERE num=?";
		try {
			//쿼리 실행을 위한 객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs= psmt.executeQuery();
			//조회된 레코드가 있을 때 DTO객체에 각 컬럼 값 지정
			if(rs.next()) { 
				dto.setNum(rs.getString(1));
                dto.setTitle(rs.getString(2));
                dto.setContent(rs.getString(3));
                dto.setInputId(rs.getString(4));
                dto.setPostdate(rs.getDate(5));
                dto.setVisitcount(rs.getInt(6));
                dto.setOfile(rs.getString(7));
                dto.setSfile(rs.getString(8));
			}
		}catch(Exception e){
			System.out.println("공지 상세보기 중 예외발생");
			e.printStackTrace();
		}
		return dto;//조회 된 레코드 DTO객체로 반환
	}	
	
// 조회수증가
	public void updateVistiCount(String num) {// 주어진 일련번호 idx에 해당하는 게시물의 조회수를 1증가 시킨다.
		String query="UPDATE tong_noticeboard SET visitcount = visitcount+1 WHERE num=?";
		
		try{
			psmt = con.prepareStatement(query);
			psmt.setString(1,num);
			psmt.executeQuery();
			
		}catch (Exception e) {
			System.out.println("조회수 증가 중 예외발생");
			e.printStackTrace();
		}
	}
	
	
// 글쓰기	
	public int insertWrite(Tong_noticeDTO dto) {
		int result =0;
		try{
			String query =
					"INSERT INTO tong_noticeboard (num, title, content, inputId, ofile, sfile) "
					+ " VALUES ( seq_notice_num.nextval, ?, ?, ?, ? ,? )";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getInputId());
			psmt.setString(4, dto.getOfile()); //원본파일명
			psmt.setString(5, dto.getSfile()); //서버에 저장할 파일명
			result = psmt.executeUpdate(); 
		}catch (Exception e) {
			System.out.println("공지사항 입력 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
//글 삭	
	public int deletePost(String num) {
		int result=0;
		try {
			String query=" DELETE FROM tong_noticeboard WHERE num=? ";
			psmt=con.prepareStatement(query);
			psmt.setString(1,num);
			result=psmt.executeUpdate();
			if (result==1) System.out.println("공지 삭제 완료");
			else 
				System.out.println("공지 삭제 중 예외발생");
		} catch (Exception e) {
			System.out.println("공지 삭제 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}

	// 게시물 수정
		 public int updatetWrite(Tong_noticeDTO dto) {
			int result =0;
			try{
				String query =" UPDATE tong_noticeboard SET title=? ,content=? ,ofile=? , sfile=? WHERE num=? ";
				psmt = con.prepareStatement(query);
				psmt.setString(1, dto.getTitle());
				psmt.setString(2, dto.getContent());
				psmt.setString(3, dto.getOfile()); //원본파일명
				psmt.setString(4, dto.getSfile()); //서버에 저장할 파일명
				psmt.setString(5, dto.getNum()); 
				result = psmt.executeUpdate();
				System.err.println("공지 수정 완료");
			}catch (Exception e) {
				System.out.println("공지 수정 중 예외발생");
				e.printStackTrace();
			}
			return result;
		}
}

	
	
	/*
	
	
	
	
// 파일 다운로드 수 증가
	public void downCountPlus(String idx) {
		String sql="UPDATE mvcboard SET downcount = downcount+1 WHERE idx=?";
		
		try{
			psmt = con.prepareStatement(sql);
			psmt.setString(1,idx);
			psmt.executeQuery();
			
		}catch (Exception e) {
			System.out.println("다운로드 카운트 수 증가 중 예외발생");
			e.printStackTrace();
		}
	}
	
//수정, 삭제 할 때 비번검증	
	public boolean confirmPassword(String pass, String idx) {
		boolean isCorr = true;
		try {
			String sql=" SELECT COUNT(*) FROM mvcboard WHERE pass=? AND idx=?";
			psmt=con.prepareStatement(sql);
			psmt.setString(1,pass);
			psmt.setString(2,idx);
			rs=psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) isCorr=false;
		} catch (Exception e) {
			isCorr=false;
			e.printStackTrace();
		}
		return isCorr;
	}
	

	

	
	*/
