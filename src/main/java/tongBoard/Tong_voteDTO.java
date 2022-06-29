package tongBoard;

public class Tong_voteDTO{
//--num, title, content1, content1_cnt, content2, content2_cnt, inputId, postdate
	private String num;
	private String title;
	private String content1;
	private int content1_cnt;
	private String content2;
	private int content2_cnt;
	private String inputId;
	private java.sql.Date postdate;
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public int getContent1_cnt() {
		return content1_cnt;
	}
	public void setContent1_cnt(int content1_cnt) {
		this.content1_cnt = content1_cnt;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public int getContent2_cnt() {
		return content2_cnt;
	}
	public void setContent2_cnt(int content2_cnt) {
		this.content2_cnt = content2_cnt;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	public String getInputId() {
		return inputId;
	}
	public void setInputId(String inputId) {
		this.inputId = inputId;
	}

	
	
	
}