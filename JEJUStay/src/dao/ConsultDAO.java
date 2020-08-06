package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.database.DBConnection;
import dto.ConsultDTO;

public class ConsultDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ConsultDAO() throws Exception, SQLException{
		conn = DBConnection.getConnection();
	}

	//consult 占쏙옙占싱븝옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙 占싶쇽옙 list占쏙옙占승뤄옙 占쏙옙환
	public ArrayList<ConsultDTO> select(int rsvIdx) throws SQLException{
		
		
		ArrayList<ConsultDTO> list = new ArrayList<ConsultDTO>();
		
		
		try{
			String sql = "SELECT cst_no, cst_name, cst_content, cst_date, cst_idx FROM tbl_consult where cst_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rsvIdx);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ConsultDTO dto = new ConsultDTO();
				
				dto.setCstNo(rs.getInt("cst_no"));
				dto.setCstName(rs.getString("cst_name"));
				dto.setCstContent(rs.getString("cst_content"));
				dto.setCstDate(rs.getTimestamp("cst_date"));
				dto.setRsvIdx(rs.getInt("cst_idx"));
				
				list.add(dto);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			dbclose();
		}
		
		return list;
	}

	//占쏙옙占쏙옙占싣� 占쏙옙 insert 호占쏙옙占쌔쇽옙 DB占쏙옙 占쌉뤄옙
	public int insert(ConsultDTO dto) throws SQLException{
		int result = 0;

		try{
			String sql = "INSERT INTO tbl_consult(cst_no, cst_name, cst_content, cst_date, cst_idx) values (null, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getCstName());
			pstmt.setString(2, dto.getCstContent());
			pstmt.setTimestamp(3, dto.getCstDate());
			pstmt.setInt(4, dto.getRsvIdx());

			result = pstmt.executeUpdate();	
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			dbclose();
		}

		return result;
	}


	//占쏙옙占쏙옙占쏙옙튼 占쏙옙 占쏙옙陞삼옙占� 占쏙옙占쏙옙占쏙옙
	public int delete(ConsultDTO dto) throws SQLException {
		int result = 0;

		try{
			String sql = "DELETE from tbl_consult WHERE cst_no = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getCstNo());
			result = pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			dbclose();
		}

		return result;
	}

	public void dbclose(){
		try {
			if(rs != null){	rs.close(); }	//Resultset close
			if(pstmt != null){ pstmt.close(); }	//prepareStatement close
			if(conn != null){ conn.close(); }	//Connection close
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
