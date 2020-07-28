package dto;

import java.io.Serializable;
import java.sql.Date;

public class StayDTO implements Serializable{

	private static final long serialVersionUID = -4274700572038677000L;

	private String stayCode;		//��ǰ�ڵ�
	private Date stayCheckin;		// üũ�� 
	private Date stayCheckout;		// üũ�ƿ�
	private String stayType;		//��������
	private String stayName;		//��ǰ�̸�
	private String stayPlace;		//������ġ
	private String stayAddress; 	//�����ּ�
	private String stayRoomType;	//����Ÿ��
	private int stayPrice;			//�ݾ�
	private int stayAdult;			// �ο�(����)
	private int stayChild;			// �ο�(�Ҿ�)
	private int stayMax;			//���� �ִ��ο�
	private String stayFileName;	//���� �̹�������
	private String stayFileRoom;	//���� �̹�������
	private String stayFileInfo;	//ȣ�� �Ұ� �̹�������
	private int quantity;			//��ٱ��Ͽ� ���� ����
	
	
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
