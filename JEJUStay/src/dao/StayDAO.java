package dao;

import java.util.ArrayList;

import dto.StayDTO;

public class StayDAO {
	
	private ArrayList<StayDTO> listOfStays = new ArrayList<StayDTO>();
	private static StayDAO instance = new StayDAO(); //싱글톤
	
	//listOfStays에 저장된 모든 숙소 목록을 가져오는 메소드
	public ArrayList<StayDTO> getAllStays() {
		return listOfStays;
	}
	
	//listOfStays에 저장된 모든 숙소 목록에서 숙박코드와 일치하는 상품을 가져오는 메소드
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
