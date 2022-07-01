package tongBoard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import member.MemberDTO;

public class Tong_commDAO extends DBConnPool{ //DB연결은 DBCP(커넥션풀) 을 사용한다.
	public Tong_commDAO() {
		super(); //부모클래스의 기본생성자 호출을 통해 DB연결
	}
	
	// num, title, content1, content1_cnt, content2, content2_cnt, inputId, postdate

	// 댓글 조회 vote.jsp
	public List<Tong_commDTO> commList(Map<String, Object> map) {
		List<Tong_commDTO> board = new Vector<Tong_commDTO>();
		
		
		String query = " SELECT * FROM tong_commentboard ORDER BY postdate DESC ";
		try {
			stmt = con.createStatement();
			rs= stmt.executeQuery(query); 
			while (rs.next()) {
				Tong_commDTO dto = new Tong_commDTO();
                dto.setNum(rs.getString(1));
                dto.setInputId(rs.getString(7));
                dto.setPostdate(rs.getDate(8));
                
                board.add(dto);
            }            
			System.out.println("댓글 조회완료");
		}catch (Exception e) {
            System.out.println("댓글 조회중 예외 발생");
			e.printStackTrace();
		}
		return board; 
	}

	
	// 댓글 추가	
	public int commAdd(Tong_commDTO dto) {
		int result =0;
		try{
			String query =
			" INSERT INTO tong_commentboard (num, comments, inputId, flag) "
			+ " VALUES (seq_comm_num.nextval, ?, ?, ?) ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getComments());
			psmt.setString(2, dto.getInputId());
//투표항목의 num
			psmt.setString(3, dto.getFlag());
			
			result = psmt.executeUpdate(); 
		}catch (Exception e) {
			System.out.println("댓글 작성 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
	//댓글 삭제	
			public int commDelete(String num) {
				int result=0;
				try {
					String query=" DELETE FROM tong_voteboard WHERE num=? ";
					psmt=con.prepareStatement(query);
					psmt.setString(1,num);
					result=psmt.executeUpdate();
					if(result==1)System.out.println("삭제완료");
					else System.err.println("삭제 할 컨텐츠 없음");
					
				} catch (Exception e) {
					System.out.println("투표항목 삭제 중 예외발생");
					e.printStackTrace();
				}
				return result;
			}
			
		
	
	
	
	
	
	
/*
	
	
	
	
	
	//튜표수 증가 vote.jsp -> vote.do
	public void voteProcess(String select, String num) {
		String query="  UPDATE tong_voteboard SET   ";
		if (select.equals("1"))
			query += " content1_cnt = (content1_cnt+1) WHERE num=? ";
		else 
			query += " content2_cnt = (content2_cnt+1) WHERE num=? ";
		try{
			psmt = con.prepareStatement(query);
			psmt.setString(1,num);
			System.out.println(query);
			psmt.executeQuery();
			//????????????업데이트해야되는데 걍 익스큐트쿼리로 업뎃이됨..?
			System.err.println(select+"투표수 증가 완료");
			
		}catch (Exception e) {
			System.out.println("투표수 증가 중 예외발생");
			e.printStackTrace();
		}
	}
	
	//해당 항목 투표수 반환 voteRs.jsp
	public Tong_voteDTO voteResult(String num) {
		Tong_voteDTO dto = new Tong_voteDTO();
		String query = " SELECT * FROM tong_voteboard WHERE num=? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs= psmt.executeQuery();
			
			while (rs.next()) {
                dto.setNum(rs.getString(1));
                dto.setTitle(rs.getString(2));
                dto.setContent1(rs.getString(3));
                dto.setContent1_cnt(rs.getInt(4));
                dto.setContent2(rs.getString(5));
                dto.setContent2_cnt(rs.getInt(6));
                dto.setInputId(rs.getString(7));
                dto.setPostdate(rs.getDate(8));
            }            
			System.out.println("투표수 조회완료");
		}catch (Exception e) {
            System.out.println("투표수 조회중 예외 발생");
			e.printStackTrace();
		}
		return dto; 
	}
	


	
	
//8. 페이징처리
	public List<tong_boardDTO> selectListPage(Map<String, Object> map) {
		List<tong_boardDTO> board = new Vector<tong_boardDTO>();
        
        String query = "SELECT * FROM ( "
        			+ "    SELECT Tb.*, ROWNUM rNum FROM ( "
                    + "        SELECT * FROM mvcboard ";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField")
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }        
        query += "      	ORDER BY idx DESC "
               + "     ) Tb "
               + " ) "
               + " WHERE rNum BETWEEN ? AND ?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            rs = psmt.executeQuery();
            while (rs.next()) {
                tong_boardDTO dto = new tong_boardDTO();
                dto.setIdx(rs.getString(1));
                dto.setName(rs.getString(2));
                dto.setTitle(rs.getString(3));
                dto.setContent(rs.getString(4));
                dto.setPostdate(rs.getDate(5));
                dto.setOfile(rs.getString(6));
                dto.setSfile(rs.getString(7));
                dto.setDowncount(rs.getInt(8));
                dto.setPass(rs.getString(9));
                dto.setVisitcount(rs.getInt(10));
                board.add(dto);
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        return board;
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
	
// 게시물 수정
	 public int updatePost(tong_boardDTO dto) {
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