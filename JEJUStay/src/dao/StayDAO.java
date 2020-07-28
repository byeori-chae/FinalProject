package dao;

import java.util.ArrayList;

import dto.StayDTO;

public class StayDAO {
	
	private ArrayList<StayDTO> listOfStays = new ArrayList<StayDTO>();
	private static StayDAO instance = new StayDAO(); //�̱���
	
	//listOfStays�� ����� ��� ���� ����� �������� �޼ҵ�
	public ArrayList<StayDTO> getAllStays() {
		return listOfStays;
	}
	
	//listOfStays�� ����� ��� ���� ��Ͽ��� �����ڵ�� ��ġ�ϴ� ��ǰ�� �������� �޼ҵ�
	public StayDTO getStayByCode (String stayCode) {
		StayDTO stayByCode = null;
		
		for(int i=0; i<listOfStays.size(); i++) {
			StayDTO staydto = listOfStays.get(i);
			if(staydto != null && staydto.getStayCode() != null && staydto.getStayCode().equals(stayCode)) {
				stayByCode = staydto;
				break;
			}
		}
		return stayByCode;
	}

	public static StayDAO getInstance() {
		return instance;
	}
	
}
