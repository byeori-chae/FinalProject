package board.model;

public class BoardDTO {

	private int brdNum;			// �Խñ� ���� 
	private String brdName;		// �ۼ��� �̸�
	private String brdIdx;		// ȸ����ȣ
	private String brdTitle;	// �� ���� 
	private String brdContent;	// �� ���� 
	private int brdHit;			// ��ȸ�� 
	private String brdDate;		// �ۼ���¥ 
	private int brdRef;			// �亯�� �׷� 
	private int brdLev;			// �亯�� ���� 
	private int brdSeq;			// �亯�� ����	
	
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
