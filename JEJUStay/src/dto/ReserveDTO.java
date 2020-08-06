package dto;

import java.io.Serializable;
import java.sql.Date;

//예약 
public class ReserveDTO implements Serializable{

	private static final long serialVersionUID = -4274700572038677000L;

	private int memIdx;				// 회원 번호
	private String memId;			// 회원 아이디
	private String memPwd;			// 회원 비밀번호
	private String memName;			// 회원 이름
	private String memPhone;		// 회원 연락처
	private String memBirth;		// 회원 생일
	private String memEmail;		// 회원 이메일
	
	private String stayCode;		// 상품코드
	private Date stayCheckin;		// 체크인 
	private Date stayCheckout;		// 체크아웃
	private String stayRoomType;	// 객실타입
	private String stayType;		// 숙소유형
	private String stayName;		// 예약상품명 
	private int stayPrice;			// 요금 
	private int stayAdult;			// 인원(성인)
	private int stayChild;			// 인원(소아)
	
	private int rsvIdx;				// 예약번호			// 객실 수 
	private Date rsvDate;			// 예약일자 
	private int rsvAddprice;		// 추가비용 
	private String rsvAddreason;	// 추가비용발생 사유 
	private int rsvTotalprice;		// 총 요금 
	private String rsvCondition;	// 예약상태
	
	private int rsvCancelFee;		// 취소 수수료
	private String rsvCancelReason;	// 취소 사유
	private int rsvRefund;			// 환불금액
	
	public ReserveDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getMemIdx() {
		return memIdx;
	}
	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getStayCode() {
		return stayCode;
	}
	public void setStayCode(String stayCode) {
		this.stayCode = stayCode;
	}
	public Date getStayCheckin() {
		return stayCheckin;
	}
	public void setStayCheckin(Date stayCheckin) {
		this.stayCheckin = stayCheckin;
	}
	public Date getStayCheckout() {
		return stayCheckout;
	}
	public void setStayCheckout(Date stayCheckout) {
		this.stayCheckout = stayCheckout;
	}
	public String getStayType() {
		return stayType;
	}
	public void setStayType(String stayType) {
		this.stayType = stayType;
	}
	public String getStayName() {
		return stayName;
	}
	public void setStayName(String stayName) {
		this.stayName = stayName;
	}
	public int getStayPrice() {
		return stayPrice;
	}
	public void setStayPrice(int stayPrice) {
		this.stayPrice = stayPrice;
	}
	public int getStayAdult() {
		return stayAdult;
	}
	public void setStayAdult(int stayAdult) {
		this.stayAdult = stayAdult;
	}
	public int getStayChild() {
		return stayChild;
	}
	public void setStayChild(int stayChild) {
		this.stayChild = stayChild;
	}
	public int getRsvIdx() {
		return rsvIdx;
	}
	public void setRsvIdx(int rsvIdx) {
		this.rsvIdx = rsvIdx;
	}
	
	public Date getRsvDate() {
		return rsvDate;
	}
	public void setRsvDate(Date rsvDate) {
		this.rsvDate = rsvDate;
	}
	public int getRsvAddprice() {
		return rsvAddprice;
	}
	public void setRsvAddprice(int rsvAddprice) {
		this.rsvAddprice = rsvAddprice;
	}
	public String getRsvAddreason() {
		return rsvAddreason;
	}
	public void setRsvAddreason(String rsvAddreason) {
		this.rsvAddreason = rsvAddreason;
	}
	public int getRsvTotalprice() {
		return rsvTotalprice;
	}
	public void setRsvTotalprice(int rsvTotalprice) {
		this.rsvTotalprice = rsvTotalprice;
	}

	public int getRsvCancelFee() {
		return rsvCancelFee;
	}
	public void setRsvCancelFee(int rsvCancelFee) {
		this.rsvCancelFee = rsvCancelFee;
	}
	public String getRsvCancelReason() {
		return rsvCancelReason;
	}
	public void setRsvCancelReason(String rsvCancelReason) {
		this.rsvCancelReason = rsvCancelReason;
	}
	public int getRsvRefund() {
		return rsvRefund;
	}
	public void setRsvRefund(int rsvRefund) {
		this.rsvRefund = rsvRefund;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/**
	 * @return the rsvCondition
	 */
	public String getRsvCondition() {
		return rsvCondition;
	}

	/**
	 * @param rsvCondition the rsvCondition to set
	 */
	public void setRsvCondition(String rsvCondition) {
		this.rsvCondition = rsvCondition;
	}

	/**
	 * @return the stayRoomType
	 */
	public String getStayRoomType() {
		return stayRoomType;
	}

	/**
	 * @param stayRoomType the stayRoomType to set
	 */
	public void setStayRoomType(String stayRoomType) {
		this.stayRoomType = stayRoomType;
	}
	

	
}