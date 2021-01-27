package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class materialDAO {
	private DataSource dataSource = null;
			
	public materialDAO(DataSource dataSource) {
		this.dataSource = dataSource;
	}	
	
	public ArrayList<materialTO> materialList(materialTO mto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		ArrayList<materialTO> lists = new ArrayList<materialTO>();
		
		try {
			conn = dataSource.getConnection();
			String sql = "select name, amount from material where rcseq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mto.getRcseq());
							
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				materialTO to = new materialTO();
				to.setName(rs.getString("name"));
				to.setAmount(rs.getString("amount"));
				lists.add(to);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try{rs.close();}catch(SQLException e) {}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
			if(conn!=null)try{conn.close();}catch(SQLException e) {}
		}	
		return lists;
	}
	
	public int mtWriteOk(ArrayList<materialTO> mtList){
		Connection conn = null;
		PreparedStatement pstmt = null;
					
		int count = 0;
		System.out.println("재료작성대기");
		try {
			conn = dataSource.getConnection();
			String sql = "insert into material values(0, ?, ?, ?,?)";

			for(materialTO mto : mtList) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, mto.getRcseq());	
				pstmt.setString(2, mto.getName());
				pstmt.setString(3, mto.getAmount());
				pstmt.setString(4, mto.getId());
				
				int flag = pstmt.executeUpdate();
				if(flag==1) {
					count++;
					System.out.println("재료작성완료");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
			if(conn!=null)try{conn.close();}catch(SQLException e) {}
		}	
		return count;
	}
}
