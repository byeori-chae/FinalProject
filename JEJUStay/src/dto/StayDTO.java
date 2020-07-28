package dto;

import java.io.Serializable;
import java.sql.Date;

public class StayDTO implements Serializable{

	private static final long serialVersionUID = -4274700572038677000L;

	private String stayCode;		//상품코드
	private Date stayCheckin;		// 체크인 
	private Date stayCheckout;		// 체크아웃
	private String stayType;		//숙소유형
	private String stayName;		//상품이름
	private String stayPlace;		//숙소위치
	private String stayAddress; 	//숙소주소
	private String stayRoomType;	//객실타입
	private int stayPrice;			//금액
	private int stayAdult;			// 인원(성인)
	private int stayChild;			// 인원(소아)
	private int stayMax;			//숙박 최대인원
	private String stayFileName;	//숙소 이미지파일
	private String stayFileRoom;	//객실 이미지파일
	private String stayFileInfo;	//호텔 소개 이미지파일
	private int quantity;			//장바구니에 담은 개수
	
	
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	/**
	 * @return the stayCheckin
	 */
	public Date getStayCheckin() {
		return stayCheckin;
	}
	/**
	 * @param stayCheckin the stayCheckin to set
	 */
	public void setStayCheckin(Date stayCheckin) {
		this.stayCheckin = stayCheckin;
	}
	/**
	 * @return the stayCheckout
	 */
	public Date getStayCheckout() {
		return stayCheckout;
	}
	/**
	 * @param stayCheckout the stayCheckout to set
	 */
	public void setStayCheckout(Date stayCheckout) {
		this.stayCheckout = stayCheckout;
	}
	/**
	 * @return the stayAdult
	 */
	public int getStayAdult() {
		return stayAdult;
	}
	/**
	 * @param stayAdult the stayAdult to set
	 */
	public void setStayAdult(int stayAdult) {
		this.stayAdult = stayAdult;
	}
	/**
	 * @return the stayChild
	 */
	public int getStayChild() {
		return stayChild;
	}
	/**
	 * @param stayChild the stayChild to set
	 */
	public void setStayChild(int stayChild) {
		this.stayChild = stayChild;
	}
	
	
}
