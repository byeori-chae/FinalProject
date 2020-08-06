package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.StayDTO;

public class StayDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private ArrayList<StayDTO> listOfStays = new ArrayList<StayDTO>();
	private ArrayList<StayDTO> listOfCart = new ArrayList<StayDTO>();
	
	private static StayDAO instance = new StayDAO();
	
	//湲곕낯硫붿냼�뱶
	public StayDAO() {
		try {
			getCon();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			String sql = "SELECT stay_code, stay_type, stay_name, stay_place, stay_address, stay_roomType, "
						+ "stay_price, stay_max, stay_fileName, stay_fileRoom, stay_fileInfo FROM tbl_stay";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				StayDTO dto = new StayDTO();
				dto.setStayCode(rs.getString(1));
				dto.setStayType(rs.getString(2));
				dto.setStayName(rs.getString(3));
				dto.setStayPlace(rs.getString(4));
				dto.setStayAddress(rs.getString(5));
				dto.setStayRoomType(rs.getString(6));
				dto.setStayPrice(rs.getInt(7));
				dto.setStayMax(rs.getInt(8));
				dto.setStayFileName(rs.getString(9));
				dto.setStayFileRoom(rs.getString(10));
				dto.setStayFileInfo(rs.getString(11));								
				listOfCart.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbclose();
		}
		
		try {
			String sql2 = "SELECT temp_rsvcode, temp_rsvDate, temp_rsvCheckin, temp_rsvCheckout, temp_rsvAdult, temp_rsvChild, "
						+ "FROM tbl_temp";
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				StayDTO dto = new StayDTO();
			
				dto.setTempCode(rs.getString(1));
				dto.setTempDate(rs.getDate(2));				
				dto.setTempCheckin(rs.getDate(3));
				dto.setTempCheckout(rs.getDate(4));
				dto.setTempAdult(rs.getInt(5));
				dto.setTempChild(rs.getInt(6));
				listOfStays.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbclose();
		}
	}
	
	//DB�뿰寃� 硫붿냼�뱶
	public void getCon() throws Exception, SQLException{
		String url = "jdbc:mysql://localhost:3306/jejudb";
		String user = "root";
		String password = "12345";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
	}

	//�븯�굹�쓽 �닕�냼 �젙蹂대�� 由ы꽩�븯�뒗 硫붿냼�뱶
	public StayDTO getRoom(String code) throws SQLException, Exception {
		
		StayDTO dto = null;
		getCon();
		
		try {
			String sql = "SELECT stay_name,stay_type,stay_address,stay_fileName,stay_fileRoom,"
							+ "stay_price,stay_roomType,stay_type,stay_fileInfo FROM tbl_stay where stay_code = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new StayDTO();
				dto.setStayName(rs.getString(1));
				dto.setStayType(rs.getString(2));				
				dto.setStayAddress(rs.getString(3));
				dto.setStayFileName(rs.getString(4));
				dto.setStayFileRoom(rs.getString(5));
				dto.setStayPrice(rs.getInt(6));
				dto.setStayRoomType(rs.getString(7));
				dto.setStayType(rs.getString(8));
				dto.setStayFileInfo(rs.getString(9));
				dto.setStayCode(code);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbclose();
		}	
		return dto;	
	}
	
	//�닕�냼�쓽 媛앹떎 紐⑸줉�쓣 由ы꽩�븯�뒗 硫붿냼�뱶
	public ArrayList<StayDTO> getRoomList(String stayName) throws SQLException, Exception {

		ArrayList<StayDTO> listOfStays = new ArrayList<StayDTO>();
		getCon();

		try {
			String sql = "SELECT stay_name,stay_type,stay_address,stay_fileName,stay_fileRoom,"
					+ "stay_price,stay_roomType,stay_max FROM tbl_stay WHERE stay_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stayName);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				StayDTO dto = new StayDTO();
				dto.setStayName(rs.getString(1));
				dto.setStayType(rs.getString(2));				
				dto.setStayAddress(rs.getString(3));
				dto.setStayFileName(rs.getString(4));
				dto.setStayFileRoom(rs.getString(5));
				dto.setStayPrice(rs.getInt(6));
				dto.setStayRoomType(rs.getString(7));
				dto.setStayMax(rs.getInt(8));
				listOfStays.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbclose();
		}	
		return listOfStays;	
	}
	
	//�쟾泥� �닕諛뺤젙蹂� 媛��졇�삤�뒗 硫붿냼�뱶
	public ArrayList<StayDTO> getAllStays() throws SQLException, Exception{
		ArrayList<StayDTO> listOfStays = new ArrayList<StayDTO>();
		StayDTO dto = null;
		getCon();
		try {
			String sql = "SELECT stay_code, stay_type, stay_name, stay_place, stay_address, stay_roomType, "
						+ "stay_price, stay_max, stay_fileName, stay_fileRoom, stay_fileInfo FROM tbl_stay where stay_fileRoom like '%_1'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				dto = new StayDTO();
				dto.setStayCode(rs.getString(1));
				dto.setStayType(rs.getString(2));
				dto.setStayName(rs.getString(3));
				dto.setStayPlace(rs.getString(4));
				dto.setStayAddress(rs.getString(5));
				dto.setStayRoomType(rs.getString(6));
				dto.setStayPrice(rs.getInt(7));
				dto.setStayMax(rs.getInt(8));
				dto.setStayFileName(rs.getString(9));
				dto.setStayFileRoom(rs.getString(10));
				dto.setStayFileInfo(rs.getString(11));								
				listOfStays.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbclose();
		}	
		return listOfStays;	
	}
	
	//�닕�냼�씠由� 寃��깋 硫붿냼�뱶
		public ArrayList<StayDTO> getSearch(String keyField) throws SQLException, Exception {
			ArrayList<StayDTO> listOfStays = new ArrayList<StayDTO>();
			StayDTO dto = null;
			String sql = null;
			getCon();
			try {
				if(keyField!=null && !keyField.equals("")) {
					sql = "SELECT stay_code, stay_type, stay_name, stay_place, stay_address, stay_roomType, "
							+ "stay_price, stay_max, stay_fileName, stay_fileRoom, stay_fileInfo"
							+ " from tbl_stay where stay_name LIKE '%"+keyField+"%' and stay_fileRoom like '%_1'";
					
				}else {
					sql = "SELECT stay_code, stay_type, stay_name, stay_place, stay_address, stay_roomType, "
							+ "stay_price, stay_max, stay_fileName, stay_fileRoom, stay_fileInfo FROM tbl_stay where stay_fileRoom like '%_1'";
				}
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while(rs.next()) {
					dto = new StayDTO();
					dto.setStayCode(rs.getString(1));
					dto.setStayType(rs.getString(2));
					dto.setStayName(rs.getString(3));
					dto.setStayPlace(rs.getString(4));
					dto.setStayAddress(rs.getString(5));
					dto.setStayRoomType(rs.getString(6));
					dto.setStayPrice(rs.getInt(7));
					dto.setStayMax(rs.getInt(8));
					dto.setStayFileName(rs.getString(9));
					dto.setStayFileRoom(rs.getString(10));
					dto.setStayFileInfo(rs.getString(11));	
					
					listOfStays.add(dto);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				dbclose();
			}	
			return listOfStays;	
		}
		
		//�옣諛붽뎄�땲 �엫�떆�뀒�씠釉� �궫�엯
		public int insertCart(String code, Date rsvDate, Date rsvCheckin, Date rsvCheckout, int rsvAdult,int rsvChild, int rsvDays) throws SQLException, Exception {					
			String sql = null;
			int result = 0;
			getCon();		
			try {				
				sql = "INSERT INTO tbl_temp(temp_rsvcode,temp_rsvDate,temp_rsvCheckin,temp_rsvCheckout,temp_rsvAdult,temp_rsvChild,temp_rsvDays) "
						+ "VALUES(?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);				
				pstmt.setString(1, code);
				pstmt.setDate(2, rsvDate);
				pstmt.setDate(3, rsvCheckin);
				pstmt.setDate(4, rsvCheckout);
				pstmt.setInt(5, rsvAdult);
				pstmt.setInt(6, rsvChild);
				pstmt.setInt(7, rsvDays);		
				result = pstmt.executeUpdate();
			} catch (SQLException e) {				
				e.printStackTrace();
			}finally{
				dbclose();
			}	
			return result;		
		}
		public int updateCart(int total, String code) throws SQLException, Exception {					
			
			ArrayList<StayDTO> listOfStays = new ArrayList<StayDTO>();
			String sql = null;
			int result = 0;
			getCon();
			try {				
				StayDTO dto = new StayDTO();
//				dto.setQuantity(quantity);
				dto.setTempTotal(total);
				listOfStays.add(dto);

				sql = "UPDATE tbl_temp SET temp_total=? WHERE temp_rsvcode=?";
				pstmt = conn.prepareStatement(sql);				
//				pstmt.setInt(1, quantity);
				pstmt.setInt(1, total);
				pstmt.setString(2, code);
				result = pstmt.executeUpdate();

			} catch (SQLException e) {				
				e.printStackTrace();
			}finally{
				dbclose();
			}	
			return result;		
		}
		//�옣諛붽뎄�땲 �삁�빟�젙蹂� �뼸�뼱�삤湲�
		public ArrayList<StayDTO> getCart() throws SQLException, Exception{
			ArrayList<StayDTO> listOfStays = new ArrayList<StayDTO>();
			StayDTO dto = null;
			getCon();
			
			try {
				String sql = "SELECT T.temp_rsvcode, T.temp_rsvDate, T.temp_rsvCheckin, T.temp_rsvCheckout, T.temp_rsvAdult, T.temp_rsvChild, "
								+ "S.stay_code, S.stay_type, S.stay_name, S.stay_place, S.stay_address, S.stay_roomType, S.stay_price, S.stay_max, T.temp_rsvDays" 
								+ " FROM tbl_temp T, tbl_stay S WHERE T.temp_rsvcode = S.stay_code";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while(rs.next()) {
					dto = new StayDTO();				
					dto.setTempCode(rs.getString(1));
					dto.setTempDate(rs.getDate(2));
					dto.setTempCheckin(rs.getDate(3));
					dto.setTempCheckout(rs.getDate(4));
					dto.setTempAdult(rs.getInt(5));
					dto.setTempChild(rs.getInt(6));					
					dto.setStayCode(rs.getString(7));
					dto.setStayType(rs.getString(8));
					dto.setStayName(rs.getString(9));
					dto.setStayPlace(rs.getString(10));
					dto.setStayAddress(rs.getString(11));
					dto.setStayRoomType(rs.getString(12));
					dto.setStayPrice(rs.getInt(13));
					dto.setStayMax(rs.getInt(14));
					dto.setTempDays(rs.getInt(15));
					
					listOfStays.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				dbclose();
			}	
			return listOfStays;	
		}
		//�엯�젰�젙蹂�
		public ArrayList<StayDTO> getAllTemp() throws SQLException, Exception{
			ArrayList<StayDTO> listOfStays = new ArrayList<StayDTO>();
			StayDTO dto = null;
			getCon();

			try {
				String sql = "SELECT T.temp_rsvcode, T.temp_rsvDate, T.temp_rsvCheckin, T.temp_rsvCheckout, temp_rsvDays, T.temp_rsvAdult, T.temp_rsvChild, T.temp_total,"
						  + "S.stay_code, S.stay_type, S.stay_name, S.stay_place, S.stay_address, S.stay_roomType, S.stay_price, S.stay_max "
						 + " FROM tbl_temp T, tbl_stay S WHERE T.temp_rsvcode = S.stay_code";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {

					dto = new StayDTO();				
					dto.setTempCode(rs.getString(1));
					dto.setTempDate(rs.getDate(2));
					dto.setTempCheckin(rs.getDate(3));
					dto.setTempCheckout(rs.getDate(4));
					dto.setTempDays(rs.getInt(5));
					dto.setTempAdult(rs.getInt(6));
					dto.setTempChild(rs.getInt(7));	
					dto.setTempTotal(rs.getInt(8));
					dto.setStayCode(rs.getString(9));
					dto.setStayType(rs.getString(10));
					dto.setStayName(rs.getString(11));
					dto.setStayPlace(rs.getString(12));
					dto.setStayAddress(rs.getString(13));
					dto.setStayRoomType(rs.getString(14));
					dto.setStayPrice(rs.getInt(15));
					dto.setStayMax(rs.getInt(16));

					listOfStays.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				dbclose();
			}	
			return listOfStays;	
		}
		//�옣諛붽뎄�땲 �젙蹂� �뼸�뼱�삤湲�
		public ArrayList<StayDTO> getReserveList() throws SQLException, Exception {

			ArrayList<StayDTO> listOfStays = new ArrayList<StayDTO>();
			getCon();

			try {
				String sql =  "SELECT T.temp_rsvcode, T.temp_rsvDate, T.temp_rsvCheckin, T.temp_rsvCheckout, T.temp_rsvAdult, T.temp_rsvChild, "
						+ "S.stay_code, S.stay_type, S.stay_name, S.stay_place, S.stay_address, S.stay_roomType, S.stay_price, S.stay_max" 
						+ " FROM tbl_temp T, tbl_stay S WHERE T.temp_rsvcode = S.stay_code";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while(rs.next()) {
					StayDTO dto = new StayDTO();
					dto.setStayName(rs.getString(1));
					dto.setStayType(rs.getString(2));				
					dto.setStayAddress(rs.getString(3));
					dto.setStayFileName(rs.getString(4));
					dto.setStayFileRoom(rs.getString(5));
					dto.setStayPrice(rs.getInt(6));
					dto.setStayRoomType(rs.getString(7));
					dto.setStayMax(rs.getInt(8));
					listOfStays.add(dto);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				dbclose();
			}	
			return listOfStays;	
		}
		
		public ArrayList<StayDTO> reserveConfirm(String memId) throws SQLException, Exception {

			ArrayList<StayDTO> listOfStays = new ArrayList<StayDTO>();
			getCon();

			try {
				String sql = "SELECT tbl_member.*, tbl_stay.*, \r\n" + 
						"tbl_reserve.rsv_code, rsv_idx, rsv_date, rsv_checkin, rsv_checkout, rsv_adult, "
						+ "rsv_child, rsv_totalPrice, rsv_condition FROM tbl_reserve\r\n" + 
						"INNER JOIN tbl_member on tbl_reserve.rsv_memidx = tbl_member.mem_idx \r\n" + 
						"INNER JOIN tbl_stay on tbl_reserve.rsv_code = tbl_stay.stay_code WHERE tbl_member.mem_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memId);
				rs = pstmt.executeQuery();

				while(rs.next()) {
					StayDTO dto = new StayDTO();
					dto.setMemIdx(rs.getInt(1));
					dto.setMemId(rs.getString(2));
					dto.setStayName(rs.getString(10));
					dto.setStayRoomType(rs.getString(13));
					dto.setRsvCode(rs.getString(19));
					dto.setRsvIdx(rs.getInt(20));
					dto.setRsvDate(rs.getDate(21));
					dto.setRsvCheckin(rs.getDate(22));
					dto.setRsvCheckout(rs.getDate(23));
					dto.setRsvAdult(rs.getInt(24));
					dto.setRsvChild(rs.getInt(25));
					dto.setRsvTotalprice(rs.getInt(26));					
					dto.setRsvCondition(rs.getString(27));

					listOfStays.add(dto);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				dbclose();
			}	
			return listOfStays;	
		}
		
		//怨좉컼�젙蹂� �뼸�뼱�삤湲�
		public ArrayList<StayDTO> getMemeberList(String id) throws SQLException, Exception {

			ArrayList<StayDTO> listOfStays = new ArrayList<StayDTO>();
			getCon();

			try {
				String sql =  "SELECT mem_idx,mem_id,mem_pw,mem_name,mem_birth,mem_phone,mem_email "
								+ "FROM tbl_member WHERE mem_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				while(rs.next()) {
					StayDTO dto = new StayDTO();
					dto.setMemIdx(rs.getInt(1));
					dto.setMemId(rs.getString(2));
					dto.setMemPwd(rs.getString(3));
					dto.setMemName(rs.getString(4));
					dto.setMemBirth(rs.getString(5));
					dto.setMemPhone(rs.getString(6));
					dto.setMemEmail(rs.getString(7));
					listOfStays.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				dbclose();
			}	
			return listOfStays;	
		}
		//�엫�떆�뀒�씠釉� �쟾泥� �궘�젣
		public int deleteAllCart() throws SQLException, Exception {					
			String sql = null;
			int result = 0;
			getCon();
			try {				
				sql = "truncate tbl_temp";
				pstmt = conn.prepareStatement(sql);				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {				
				e.printStackTrace();
			}finally{
				dbclose();
			}	
			return result;		
		}
		public int deleteOneCart(String code) throws SQLException, Exception {					

			String sql = null;
			int result = 0;
			getCon();
			try {				
				sql = "DELETE FROM tbl_temp WHERE temp_rsvcode=?";
				pstmt = conn.prepareStatement(sql);	
				pstmt.setString(1, code);
				result = pstmt.executeUpdate();

			} catch (SQLException e) {				
				e.printStackTrace();
			}finally{
				dbclose();
			}	
			return result;		
		}
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
	
	public StayDTO getCartByCode (String stayCode) {
		StayDTO cartByCode = null;
		
		for(int i=0; i<listOfCart.size(); i++) {
			StayDTO staydto = listOfCart.get(i);
			if(staydto != null && staydto.getTempCode() != null && staydto.getTempCode().equals(stayCode)) {
				cartByCode = staydto;
				break;
			}
		}
		return cartByCode;
	}
	
	public boolean confirmId(String id) throws SQLException, Exception {
		boolean result = false;
		getCon();

		try {
			String sql =  "SELECT mem_id FROM tbl_member WHERE mem_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				result=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbclose();
		}	
		return result;	
	}
	
	public static StayDAO getInstance() {
		return instance;
	}
		

	
	private void dbclose() {
		try {
			if(rs != null){	rs.close(); } //Resultset close
			if(pstmt != null){ pstmt.close(); }	//prepareStatement close
			if(conn != null){ conn.close(); }	//Connection close
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
}
