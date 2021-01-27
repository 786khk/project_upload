package model1;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class divisionViewDAO {
   
	private DataSource dataSource = null;
   
	public divisionViewDAO(DataSource dataSource) {
		// TODO Auto-generated constructor stub
		this.dataSource = dataSource;
	}

	public int getAllRecipeCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int count = 0;

		try {
			conn = this.dataSource.getConnection();

			String sql = "select count(*) count from recipe";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt("count");
			}

		} catch (SQLException e) {

			System.out.println("[getAllRecipeCount에러] : " + e.getMessage());
		} finally {
			if (rs != null) try {rs.close();} catch (SQLException e) {}
			if (pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if (conn != null) try {conn.close();} catch (SQLException e) {}
		}
		return count;
	}

		public ArrayList<reviewTO> getAllRecipeList(int skip) {
			 Connection conn = null;
		     PreparedStatement pstmt = null;
		     ResultSet rs = null;
		      
		     ArrayList<reviewTO> revList = new ArrayList<reviewTO>();
		      
		     try {
		      
			 conn = this.dataSource.getConnection(); 
	         
	         String sql = "select * from recipe order by wdate desc limit ?, 8";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, skip);
	                     
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            reviewTO to = new reviewTO();
	            to.setRvseq(rs.getString("rcseq"));
				/* to.setNickname(rs.getString("nickname")); */
	            to.setRvwdate(rs.getString("rvwdate"));            
	            to.setRvcontent(rs.getString("rvcontent") == null ? "" : rs.getString("rvcontent").replaceAll("\n", "<br>"));
	            to.setStar(rs.getInt("star"));            
	            to.setRev(rs.getString("rev"));
	            to.setRvfilename(rs.getString("rvfilename"));
	            
	            revList.add(to);
	         }
	         } catch (SQLException e) {
		    
		         System.out.println("[getAllRecipeList에러] : " + e.getMessage());
		      }finally{
		          if(rs != null) try{rs.close();} catch(SQLException e) {}
		    	  if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
		          if(conn != null) try{conn.close();} catch(SQLException e) {}
		      }
			
			
			return revList;
		}
   
}