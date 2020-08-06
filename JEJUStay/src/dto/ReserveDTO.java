package dto;

import java.io.Serializable;
import java.sql.Date;

//���� 
public class ReserveDTO implements Serializable{

	private static final long serialVersionUID = -4274700572038677000L;

	private int memIdx;				// ȸ�� ��ȣ
	private String memId;			// ȸ�� ���̵�
	private String memPwd;			// ȸ�� ��й�ȣ
	private String memName;			// ȸ�� �̸�
	private String memPhone;		// ȸ�� ����ó
	private String memBirth;		// ȸ�� ����
	private String memEmail;		// ȸ�� �̸���
	
	private String stayCode;		// ��ǰ�ڵ�
	private Date stayCheckin;		// üũ�� 
	private Date stayCheckout;		// üũ�ƿ�
	private String stayRoomType;	// ����Ÿ��
	private String stayType;		// ��������
	private String stayName;		// �����ǰ�� 
	private int stayPrice;			// ��� 
	private int stayAdult;			// �ο�(����)
	private int stayChild;			// �ο�(�Ҿ�)
	
	private int rsvIdx;				// �����ȣ			// ���� �� 
	private Date rsvDate;			// �������� 
	private int rsvAddprice;		// �߰���� 
	private String rsvAddreason;	// �߰����߻� ���� 
	private int rsvTotalprice;		// �� ��� 
	private String rsvCondition;	// �������
	
	private int rsvCancelFee;		// ��� ������
	private String rsvCancelReason;	// ��� ����
	private int rsvRefund;			// ȯ�ұݾ�
	
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