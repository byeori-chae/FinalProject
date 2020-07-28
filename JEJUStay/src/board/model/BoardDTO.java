package board.model;

public class BoardDTO {

	private int brdNum;			// 게시글 순번 
	private String brdName;		// 작성자 이름
	private String brdIdx;		// 회원번호
	private String brdTitle;	// 글 제목 
	private String brdContent;	// 글 내용 
	private int brdHit;			// 조회수 
	private String brdDate;		// 작성날짜 
	private int brdRef;			// 답변글 그룹 
	private int brdLev;			// 답변글 레벨 
	private int brdSeq;			// 답변글 순서	
	
	public BoardDTO() {
		
	}

	public int getBrdNum() {
		return brdNum;
	}

	public void setBrdNum(int brdNum) {
		this.brdNum = brdNum;
	}

	public String getBrdName() {
		return brdName;
	}

	public void setBrdName(String brdName) {
		this.brdName = brdName;
	}

	public String getBrdIdx() {
		return brdIdx;
	}

	public void setBrdIdx(String brdIdx) {
		this.brdIdx = brdIdx;
	}

	public String getBrdTitle() {
		return brdTitle;
	}

	public void setBrdTitle(String brdTitle) {
		this.brdTitle = brdTitle;
	}

	public String getBrdContent() {
		return brdContent;
	}

	public void setBrdContent(String brdContent) {
		this.brdContent = brdContent;
	}

	public int getBrdHit() {
		return brdHit;
	}

	public void setBrdHit(int brdHit) {
		this.brdHit = brdHit;
	}

	public String getBrdDate() {
		return brdDate;
	}

	public void setBrdDate(String brdDate) {
		this.brdDate = brdDate;
	}

	public int getBrdRef() {
		return brdRef;
	}

	public void setBrdRef(int brdRef) {
		this.brdRef = brdRef;
	}

	public int getBrdLev() {
		return brdLev;
	}

	public void setBrdLev(int brdLev) {
		this.brdLev = brdLev;
	}

	public int getBrdSeq() {
		return brdSeq;
	}

	public void setBrdSeq(int brdSeq) {
		this.brdSeq = brdSeq;
	}
	
	
}
