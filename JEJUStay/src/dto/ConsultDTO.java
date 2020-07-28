package dto;

import java.sql.Timestamp;

public class ConsultDTO {

	
	private String cstName;		// 작성자 
	private String cstContent;	// 작성내용
	private int cstNo;			// 작성순번
	private Timestamp cstDate;	// 작성일
	private int rsvIdx;
	
	public ConsultDTO() {
		super();
	}

	public String getCstName() {
		return cstName;
	}

	public void setCstName(String cstName) {
		this.cstName = cstName;
	}

	public String getCstContent() {
		return cstContent;
	}

	public void setCstContent(String cstContent) {
		this.cstContent = cstContent;
	}

	public int getCstNo() {
		return cstNo;
	}

	public void setCstNo(int cstNo) {
		this.cstNo = cstNo;
	}

	public Timestamp getCstDate() {
		return cstDate;
	}

	public void setCstDate(Timestamp cstDate) {
		this.cstDate = cstDate;
	}

	public int getRsvIdx() {
		return rsvIdx;
	}

	public void setRsvIdx(int rsvIdx) {
		this.rsvIdx = rsvIdx;
	}

}


