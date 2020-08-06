package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.database.DBConnection;
import dto.ReserveDTO;

public class ReserveDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	
	public ReserveDAO() throws Exception, SQLException {
		conn = DBConnection.getConnection();
	}
	
	//예약한 고객정보와 예약정보 전부 다 가져오는 메소드
	public ArrayList<ReserveDTO> select(){
		ArrayList<ReserveDTO> list = new ArrayList<ReserveDTO>();
		
		try{
			
			String sql = "SELECT tbl_member.*, tbl_stay.*, tbl_reserve.* FROM tbl_reserve\r\n" + 
					"INNER JOIN tbl_member on tbl_reserve.rsv_memidx = tbl_member.mem_idx\r\n" + 
					"INNER JOIN tbl_stay on tbl_reserve.rsv_code = tbl_stay.stay_code ORDER BY tbl_reserve.rsv_date DESC";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				ReserveDTO dto = new ReserveDTO();
				
				dto.setMemIdx(rs.getInt("mem_idx"));
				dto.setMemName(rs.getString("mem_name")); 
				dto.setMemPhone(rs.getString("mem_phone"));
				dto.setMemEmail(rs.getString("mem_email"));

				dto.setStayCode(rs.getString("stay_code"));
				dto.setStayType(rs.getString("stay_type"));
				dto.setStayName(rs.getString("stay_name"));
				dto.setStayPrice(rs.getInt("stay_price"));
				dto.setStayRoomType(rs.getString("stay_roomType"));
				
				dto.setRsvIdx(rs.getInt("rsv_idx"));
				dto.setRsvDate(rs.getDate("rsv_date"));
				dto.setStayCheckin(rs.getDate("rsv_checkin"));
				dto.setStayCheckout(rs.getDate("rsv_checkout"));
				dto.setRsvAddprice(rs.getInt("rsv_addPrice"));
				dto.setRsvAddreason(rs.getString("rsv_addReason"));
				dto.setRsvTotalprice(rs.getInt("rsv_totalPrice"));
				dto.setStayAdult(rs.getInt("rsv_adult"));
				dto.setStayChild(rs.getInt("rsv_child"));			
				dto.setRsvCondition(rs.getString("rsv_condition"));
				dto.setRsvCancelFee(rs.getInt("rsv_cancelFee"));
				dto.setRsvCancelReason(rs.getString("rsv_cancelReason"));
				dto.setRsvRefund(rs.getInt("rsv_refund"));
								
				list.add(dto);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			dbclose();
		}
		return list;
	}

	//회원,상품,예약의 모든 레코드 검색(Select)하는 메서드 → (검색단어가 들어왔을때는 where를 이용하여 검색해준다.)
	public ArrayList<ReserveDTO> select(String keyWord){
	       
        ArrayList<ReserveDTO> list = new ArrayList<ReserveDTO>();
       
        try{
           
            String sql = "SELECT tbl_member.*, tbl_stay.*, tbl_reserve.* FROM tbl_reserve\r\n" + 
					"INNER JOIN tbl_member on tbl_reserve.rsv_memidx = tbl_member.mem_idx\r\n" + 
					"INNER JOIN tbl_stay on tbl_reserve.rsv_code = tbl_stay.stay_code";
			
			if(keyWord != null && !keyWord.equals("") ){
                sql += " WHERE mem_name LIKE '%"+keyWord.trim()+"%' or mem_phone LIKE '%"+keyWord.trim()+"%' ORDER BY tbl_reserve.rsv_date DESC";
            }else{	//모든 레코드 검색
                sql += " ORDER BY tbl_reserve.rsv_date DESC";
            }

            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery(sql);
           
            while(rs.next()){
            	ReserveDTO dto = new ReserveDTO();
               
            	dto.setMemIdx(rs.getInt("mem_idx"));
				dto.setMemName(rs.getString("mem_name")); 
				dto.setMemPhone(rs.getString("mem_phone"));
				dto.setMemEmail(rs.getString("mem_email"));

				dto.setStayCode(rs.getString("stay_code"));
				dto.setStayType(rs.getString("stay_type"));
				dto.setStayName(rs.getString("stay_name"));
				dto.setStayPrice(rs.getInt("stay_price"));
				dto.setStayRoomType(rs.getString("stay_roomType"));
				
				dto.setRsvIdx(rs.getInt("rsv_idx"));
				dto.setRsvDate(rs.getDate("rsv_date"));
				dto.setStayCheckin(rs.getDate("rsv_checkin"));
				dto.setStayCheckout(rs.getDate("rsv_checkout"));
				dto.setRsvAddprice(rs.getInt("rsv_addPrice"));
				dto.setRsvAddreason(rs.getString("rsv_addReason"));
				dto.setRsvTotalprice(rs.getInt("rsv_totalPrice"));
				dto.setStayAdult(rs.getInt("rsv_adult"));
				dto.setStayChild(rs.getInt("rsv_child"));			
				dto.setRsvCondition(rs.getString("rsv_condition"));
				dto.setRsvCancelFee(rs.getInt("rsv_cancelFee"));
				dto.setRsvCancelReason(rs.getString("rsv_cancelReason"));
				dto.setRsvRefund(rs.getInt("rsv_refund"));
								
				list.add(dto);
			}
        }catch(Exception e){          
            System.out.println(e+"=> getDateSearch fail");        
        }finally{          
            dbclose();
        }      
        return list;
    }  
	
	//예약자 정보 저장 버튼
	public int booker_update(ReserveDTO dto){
		
		int result = 0;

		try{
			String sql = "UPDATE tbl_reserve A INNER JOIN tbl_member B ON A.rsv_memidx = B.mem_idx SET A.rsv_checkin=?, B.mem_name=?, B.mem_email=?, B.mem_phone=?"
					+ "where A.rsv_idx=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setDate(1,dto.getStayCheckin());
			pstmt.setString(2, dto.getMemName());
			pstmt.setString(3, dto.getMemEmail());
			pstmt.setString(4,dto.getMemPhone());
			pstmt.setInt(5, dto.getRsvIdx());

			result = pstmt.executeUpdate();	
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			dbclose();
		}

		return result;
	}


	//예약 정보 저장 버튼
	public int info_update(ReserveDTO dto){
		
		int result = 0;

		try{
			String sql = "UPDATE tbl_reserve A INNER JOIN tbl_stay B ON A.rsv_code = B.stay_code set A.rsv_date=?, A.rsv_checkin=?, A.rsv_checkout=?,"
					+ "A.rsv_adult=?, A.rsv_child=?, B.stay_price=?, A.rsv_addPrice=?, A.rsv_addReason=?, A.rsv_totalPrice=? where A.rsv_idx=?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setDate(1, dto.getRsvDate());
			pstmt.setDate(2, dto.getStayCheckin());
			pstmt.setDate(3, dto.getStayCheckout());
			pstmt.setInt(4, dto.getStayAdult());
			pstmt.setInt(5, dto.getStayChild());
			pstmt.setInt(6, dto.getStayPrice());
			pstmt.setInt(7, dto.getRsvAddprice());
			pstmt.setString(8, dto.getRsvAddreason());
			pstmt.setInt(9, dto.getRsvTotalprice());
			pstmt.setInt(10, dto.getRsvIdx());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			dbclose();
		}

		return result;
	}
	
	//취소 정보 저장 버튼
	public int cancel_insert(ReserveDTO dto){

		int result = 0;

		try{
			String sql = "update tbl_reserve set rsv_cancelFee=?, rsv_cancelReason=?, rsv_refund=? where rsv_idx=?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getRsvCancelFee());
			pstmt.setString(2, dto.getRsvCancelReason());
			pstmt.setInt(3,dto.getRsvRefund());
			pstmt.setInt(4, dto.getRsvIdx());
			
			result = pstmt.executeUpdate();	
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			dbclose();
		}

		return result;
	}
	
	//예약상태 저장 버튼
	public int condition_up(ReserveDTO dto){

		int result = 0;

		try{
			String sql = "update tbl_reserve set rsv_condition=? where rsv_idx=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getRsvCondition());
			pstmt.setInt(2, dto.getRsvIdx());
			
			result = pstmt.executeUpdate();	
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			dbclose();
		}

		return result;
	}
	
	//DB닫는 메소드
	public void dbclose(){
		try {
			if(rs != null){	rs.close(); } //Resultset close
			if(pstmt != null){ pstmt.close(); }	//prepareStatement close
			if(conn != null){ conn.close(); }	//Connection close
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
