package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class stepDAO {
	private DataSource dataSource = null;
	
	public stepDAO(DataSource dataSource) {
		// TODO Auto-generated constructor stub
		this.dataSource = dataSource;
	}
	
	public ArrayList<stepTO> steplist(stepTO sto){
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	   
	      ArrayList<stepTO> lists = new ArrayList<stepTO>();
	      
	      try {
	         conn = dataSource.getConnection();
	         String sql = "select rcseq, storder, filename, content from step where rcseq = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, sto.getRcseq());
	                  
	         rs = pstmt.executeQuery();
	               
	         while(rs.next()){
	            stepTO to = new stepTO();	            
	            to.setRcseq(rs.getInt("rcseq"));
	            to.setStorder(Integer.parseInt(rs.getString("storder")));
	            to.setFilename(rs.getString("filename"));
	            to.setContent(rs.getString("content") == null ? "" : rs.getString("content").replaceAll("\n", "<br>"));	   
	            	            
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

	public int stWriteOk(ArrayList<stepTO> stList) {
		
			Connection conn = null;
			PreparedStatement pstmt = null;
						
			int count = 0;
			System.out.println("스탭작성대기");
			try {
				conn = dataSource.getConnection();
				String sql = "insert into step values(0, ?, ?, ?, ?,?)";

				for(stepTO sto : stList) {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, sto.getRcseq());	
					pstmt.setInt(2, sto.getStorder());
					pstmt.setString(3, sto.getFilename());
					pstmt.setString(4, sto.getContent());
					pstmt.setString(5, sto.getId());
					int flag = pstmt.executeUpdate();
					if(flag==1) {
						count++;
						System.out.println("step작성완료");
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
