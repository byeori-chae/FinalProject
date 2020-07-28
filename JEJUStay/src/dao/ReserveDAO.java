package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.DBConnection;
import dto.ReserveDTO;

public class ReserveDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	
	public ReserveDAO() throws Exception, SQLException {
		conn = DBConnection.getConnection();
	}
	
	public ArrayList<ReserveDTO> select(){
		ArrayList<ReserveDTO> list = new ArrayList<ReserveDTO>();

		try{
			String sql = "SELECT tbl_member.*, tbl_stay.*, tbl_reserve.rsv_code, rsv_idx, rsv_date, rsv_room, rsv_addPrice, rsv_checkin, rsv_checkout,\r\n" + 
					"rsv_adult, rsv_child, rsv_addReason, rsv_totalPrice, rsv_cancelFee, rsv_cancelReason, rsv_refund, rsv_condition\r\n" + 
					"FROM tbl_reserve\r\n" + 
					"INNER JOIN tbl_member on tbl_reserve.rsv_memidx = tbl_member.mem_idx\r\n" + 
					"INNER JOIN tbl_stay on tbl_reserve.rsv_code = tbl_stay.stay_code";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()){ //next 메소드로 커서를 다음으로 옮겨서 처리
				ReserveDTO dto = new ReserveDTO();
				
				dto.setMemIdx(rs.getInt("mem_idx"));
				dto.setMemName(rs.getString("mem_name")); 
				dto.setMemPhone(rs.getString("mem_phone"));
				dto.setMemEmail(rs.getString("mem_email"));

				dto.setStayCode(rs.getString("stay_code"));
				dto.setStayType(rs.getString("stay_type"));
				dto.setStayName(rs.getString("stay_name"));
				dto.setStayPrice(rs.getInt("stay_price"));

				
				dto.setRsvIdx(rs.getInt("rsv_idx"));
				dto.setRsvDate(rs.getDate("rsv_date"));
				dto.setStayCheckin(rs.getDate("rsv_checkin"));
				dto.setStayCheckout(rs.getDate("rsv_checkout"));
				dto.setRsvRoom(rs.getInt("rsv_room"));
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


	//예약자 정보 저장
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


	//예약 정보 저장
	public int info_update(ReserveDTO dto){
		
		int result = 0;

		try{
			String sql = "UPDATE tbl_reserve A INNER JOIN tbl_stay B ON A.rsv_code = B.stay_code set A.rsv_date=?, A.rsv_checkin=?, A.rsv_checkout=?,"
					+ "A.rsv_adult=?, A.rsv_child=?, A.rsv_room=?, B.stay_price=?, A.rsv_addPrice=?, A.rsv_addReason=?, A.rsv_totalPrice=? where A.rsv_idx=?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setDate(1, dto.getRsvDate());
			pstmt.setDate(2, dto.getStayCheckin());
			pstmt.setDate(3, dto.getStayCheckout());
			pstmt.setInt(4, dto.getStayAdult());
			pstmt.setInt(5, dto.getStayChild());
			pstmt.setInt(6,dto.getRsvRoom());
			pstmt.setInt(7, dto.getStayPrice());
			pstmt.setInt(8, dto.getRsvAddprice());
			pstmt.setString(9, dto.getRsvAddreason());
			pstmt.setInt(10, dto.getRsvTotalprice());
			pstmt.setInt(11, dto.getRsvIdx());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			dbclose();
		}

		return result;
	}
	
	//취소 정보 저장
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
	
	//이름, 연락처로 검색
	public ArrayList<ReserveDTO> getMemberlist(String keyWord){
	       
        ArrayList<ReserveDTO> list = new ArrayList<ReserveDTO>();
       
        try{//실행
           
            String sql ="SELECT tbl_member.*, tbl_stay.*, tbl_reserve.rsv_code, rsv_idx, rsv_date, rsv_room, rsv_addPrice, rsv_checkin, rsv_checkout,\r\n" + 
					"rsv_adult, rsv_child, rsv_addReason, rsv_totalPrice, rsv_cancelFee, rsv_cancelReason, rsv_refund, rsv_condition\r\n" + 
					"FROM tbl_reserve\r\n" + 
					"INNER JOIN tbl_member on tbl_reserve.rsv_memidx = tbl_member.mem_idx\r\n" + 
					"INNER JOIN tbl_stay on tbl_reserve.rsv_code = tbl_stay.stay_code";
           
            if(keyWord != null && !keyWord.equals("") ){
                sql +="WHERE mem_name LIKE '%"+keyWord.trim()+"%' order by mem_name";
            }else{//모든 레코드 검색
                sql +="order by mem_name";
            }
            System.out.println("sql = " + sql);
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery(sql);
           
            while(rs.next()){
            	ReserveDTO dto = new ReserveDTO();
               
            	dto.setStayCheckin(rs.getDate(1));
            	dto.setMemName(rs.getString(2));
            	dto.setRsvIdx(rs.getInt(3));
            	dto.setStayName(rs.getString(4));
            	dto.setStayPrice(rs.getInt(5));
            	dto.setRsvCondition(rs.getString(6));
               
                list.add(dto);
            }
        }catch(Exception e){          
            System.out.println(e+"=> getMemberlist fail");        
        }finally{          
            dbclose();
        }      
        return list;
    }  


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
