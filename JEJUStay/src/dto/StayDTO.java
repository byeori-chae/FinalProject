package dto;

import java.io.Serializable;
import java.sql.Date;

public class StayDTO implements Serializable{

	private static final long serialVersionUID = -4274700572038677000L;

	private int memIdx;				// 회원번호
	private String memId;			// 아이디
	private String memPwd;			// 비밀번호
	private String memName;			// 이름
	private String memPhone;		// 연락처
	private String memBirth;		// 생일
	private String memEmail;		// 이메일
	
	private String stayCode;		//상품코드
	private String stayType;		//숙박유형
	private String stayName;		//상품명
	private String stayPlace;		//숙박위치
	private String stayAddress; 	//주소
	private String stayRoomType;	//객실종류
	private int stayPrice;			//요금
	private int stayMax;			//최대인원
	private String stayFileName;	//메인파일
	private String stayFileRoom;	//객실파일
	private String stayFileInfo;	//소개파일
	private int quantity;			//장바구니 갯수
	
	private int rsvIdx;				// 예약번호
	private int rsvRoom;			// 객실 수
	private Date rsvDate;			// 예약일자 
	private Date rsvCheckin;		// 체크인 날짜
	private Date rsvCheckout;		// 체크아웃 날짜
	private int rsvAddprice;		// 추가비용
	private String rsvAddreason;	// 추가비용 사유
	private int rsvTotalprice;		// 총 요금
	private int rsvAdult;			// 인원(성인)
	private int rsvChild;			// 인원(소아)
	private String rsvConsulting;	// 상담내용
	private String rsvCondition;	// 예약상태
	private String rsvCode; 		// 숙박코드
	
	private String rsvCancelRule;	//취소규정
	private int rsvCancelFee;		//취소비용
	private String rsvCancelReason;	//취소사유
	
	private String tempCode; 	//숙박코드
	private Date tempDate; 		//예약접수일
	private Date tempCheckin; 	//체크인
	private Date tempCheckout; 	//체크아웃
	private int tempDays; 		//기간
	private int tempAdult; 		//인원(성인)
	private int tempChild; 		//인원(소아)
	private int tempTotal;		//합계
	private int tempSum;		//총금액
	
	public StayDTO() {
		super();
	}
	
//	public StayDTO(String rsvDate,String rsvCheckin, String rsvCheckout,int rsvAdult,int rsvChild) {
//		this.rsvDate = rsvDate;
//		this.rsvCheckin = rsvCheckin;
//		this.rsvCheckout = rsvCheckout;
//		this.rsvAdult = rsvAdult;
//		this.rsvChild = rsvChild; 
//	}
//	
//	
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
	public String getStayPlace() {
		return stayPlace;
	}
	public void setStayPlace(String stayPlace) {
		this.stayPlace = stayPlace;
	}
	public String getStayAddress() {
		return stayAddress;
	}
	public void setStayAddress(String stayAddress) {
		this.stayAddress = stayAddress;
	}
	public String getStayRoomType() {
		return stayRoomType;
	}
	public void setStayRoomType(String stayRoomType) {
		this.stayRoomType = stayRoomType;
	}
	public int getStayPrice() {
		return stayPrice;
	}
	public void setStayPrice(int stayPrice) {
		this.stayPrice = stayPrice;
	}
	public int getStayMax() {
		return stayMax;
	}
	public void setStayMax(int stayMax) {
		this.stayMax = stayMax;
	}
	public String getStayFileName() {
		return stayFileName;
	}
	public void setStayFileName(String stayFileName) {
		this.stayFileName = stayFileName;
	}
	public String getStayFileRoom() {
		return stayFileRoom;
	}
	public void setStayFileRoom(String stayFileRoom) {
		this.stayFileRoom = stayFileRoom;
	}
	public String getStayFileInfo() {
		return stayFileInfo;
	}
	public void setStayFileInfo(String stayFileInfo) {
		this.stayFileInfo = stayFileInfo;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	//
	public int getRsvIdx() {
		return rsvIdx;
	}

	public void setRsvIdx(int rsvIdx) {
		this.rsvIdx = rsvIdx;
	}

	public int getRsvRoom() {
		return rsvRoom;
	}

	public void setRsvRoom(int rsvRoom) {
		this.rsvRoom = rsvRoom;
	}

	public Date getRsvDate() {
		return rsvDate;
	}

	public void setRsvDate(Date rsvDate) {
		this.rsvDate = rsvDate;
	}

	public Date getRsvCheckin() {
		return rsvCheckin;
	}

	public void setRsvCheckin(Date rsvCheckin) {
		this.rsvCheckin = rsvCheckin;
	}

	public Date getRsvCheckout() {
		return rsvCheckout;
	}

	public void setRsvCheckout(Date rsvCheckout) {
		this.rsvCheckout = rsvCheckout;
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

	public int getRsvAdult() {
		return rsvAdult;
	}

	public void setRsvAdult(int rsvAdult) {
		this.rsvAdult = rsvAdult;
	}

	public int getRsvChild() {
		return rsvChild;
	}

	public void setRsvChild(int rsvChild) {
		this.rsvChild = rsvChild;
	}

	public String getRsvConsulting() {
		return rsvConsulting;
	}

	public void setRsvConsulting(String rsvConsulting) {
		this.rsvConsulting = rsvConsulting;
	}

	public String getRsvCondition() {
		return rsvCondition;
	}

	public void setRsvCondition(String rsvCondition) {
		this.rsvCondition = rsvCondition;
	}
	
	public String getRsvCode() {
		return rsvCode;
	}

	public void setRsvCode(String rsvCode) {
		this.rsvCode = rsvCode;
	}

	
	public String getRsvCancelRule() {
		return rsvCancelRule;
	}

	public void setRsvCancelRule(String rsvCancelRule) {
		this.rsvCancelRule = rsvCancelRule;
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
	
	//임시변수
	public String getTempCode() {
		return tempCode;
	}

	public void setTempCode(String tempCode) {
		this.tempCode = tempCode;
	}

	public Date getTempDate() {
		return tempDate;
	}

	public void setTempDate(Date tempDate) {
		this.tempDate = tempDate;
	}

	public Date getTempCheckin() {
		return tempCheckin;
	}

	public void setTempCheckin(Date tempCheckin) {
		this.tempCheckin = tempCheckin;
	}

	public Date getTempCheckout() {
		return tempCheckout;
	}

	public void setTempCheckout(Date tempCheckout) {
		this.tempCheckout = tempCheckout;
	}
	
	public int getTempDays() {
		return tempDays;
	}

	public void setTempDays(int tempDays) {
		this.tempDays = tempDays;
	}

	public int getTempAdult() {
		return tempAdult;
	}

	public void setTempAdult(int tempAdult) {
		this.tempAdult = tempAdult;
	}

	public int getTempChild() {
		return tempChild;
	}

	public void setTempChild(int tempChild) {
		this.tempChild = tempChild;
	}

	public int getTempTotal() {
		return tempTotal;
	}

	public void setTempTotal(int tempTotal) {
		this.tempTotal = tempTotal;
	}

	public int getTempSum() {
		return tempSum;
	}

	public void setTempSum(int tempSum) {
		this.tempSum = tempSum;
	}
	
	
	
	
}
