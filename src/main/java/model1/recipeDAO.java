package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.sql.DataSource;

public class recipeDAO {
	private DataSource dataSource = null;
			
	public recipeDAO(DataSource dataSource) {
		this.dataSource = dataSource;
	}	
	
	public int recipeWriteOk(recipeTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("레시피작성대기");
		int rcseq = 0;
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "insert into recipe values (0, ?, ?, ?, ?, ?, ?,?,?, now(),0,0,?)";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString(1, to.getRcwriter());
			pstmt.setString(2, to.getSubject());
			pstmt.setString(3, to.getIntroduce());
			pstmt.setString(4, to.getrfilename());
			pstmt.setString(5, to.getUrl());
			pstmt.setString(6, to.getTip());
			pstmt.setString(7, to.getCategory1());
			pstmt.setString(8, to.getCategory2());
			pstmt.setString(9, " ");
			int result = pstmt.executeUpdate();
			System.out.println("recipe작성완료");
			pstmt.close();
			
			if( result == 1 ) {
				sql = "select rcseq from recipe where rcwriter like ? and subject like ? and category1 like ? and category2 like ?";
				pstmt = conn.prepareStatement( sql );
				pstmt.setString(1, to.getRcwriter());
				pstmt.setString(2, to.getSubject());
				pstmt.setString(3, to.getCategory1());
				pstmt.setString(4, to.getCategory2());
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					rcseq = rs.getInt("rcseq");
				}
				System.out.println("작성완료");
			}
		} catch( SQLException e ) {
			System.out.println( "[recip 작성에러] : " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch(SQLException e) {}
			if( conn != null ) try { conn.close(); } catch(SQLException e) {}
		}
		return rcseq;
	}
	
	
	// 메인페이지 카운트
	
public recipeTO mainCount(recipeTO to) {
	 Connection conn = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null;
	String hit = "";
	String rcseq = "";
	//ArrayList<recipeTO> lists = new ArrayList<recipeTO>();
     try {
         conn = this.dataSource.getConnection(); 
                  
         String sql = "select count(rcseq), sum(hit) from recipe";
         pstmt = conn.prepareStatement(sql);
                     
         rs = pstmt.executeQuery();
                  
          if(rs.next()) {                 
             rcseq= rs.getString("count");
             hit = rs.getString("sum");
           }
          
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         if(rs!=null)try{rs.close();}catch(SQLException e) {}
         if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
         if(conn!=null)try{conn.close();}catch(SQLException e) {}
      }   
      return to;
   }

	
//	public ArrayList<recipeTO> recipelist(){
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//	
//		ArrayList<recipeTO> list = new ArrayList<recipeTO>();
//		
//		try {
//			conn = dataSource.getConnection();
//			String sql = "select rcseq, rcwriter, subject, introduce, rfilename, url, tip, category1, category2, wdate, hit, rev from recipe";
//			pstmt = conn.prepareStatement(sql);
//							
//			rs = pstmt.executeQuery();
//					
//			while(rs.next()){
//				recipeTO to = new recipeTO();
//				to.setRcseq(rs.getString("rcseq"));
//				to.setRcwriter(rs.getString("rcwriter"));
//				to.setSubject(rs.getString("subject"));
//				to.setIntroduce(rs.getString("introduce"));
//				to.setrfilename(rs.getString("rfilename"));
//				to.setUrl(rs.getString("url"));
//				to.setTip(rs.getString("tip"));
//				to.setCategory1(rs.getString("category1"));
//				to.setCategory2(rs.getString("category2"));
//				to.setWdate(rs.getString("wdate"));
//				to.setHit(rs.getString("hit"));
//				to.setRev(rs.getString("rev"));
//				list.add(to);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			if(rs!=null)try{rs.close();}catch(SQLException e) {}
//			if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
//			if(conn!=null)try{conn.close();}catch(SQLException e) {}
//		}	
//		return list;
//	}
//	public int recipeModifyOK(recipeTO to) {
//	      Connection conn = null;
//	      PreparedStatement pstmt = null;
//	      
//	      int flag = 1;
//	      
//	      try {
//	         conn = this.dataSource.getConnection();
//	         
//	         String sql = "update recipe set subject=?, introduce=?, rfilename=?, url=?, tip=? where rcseq=?";
//	         pstmt = conn.prepareStatement(sql);
//	         pstmt.setString(1, to.getSubject());
//	         pstmt.setString(2, to.getIntroduce());
//	         pstmt.setString(3, to.getrfilename());
//	         pstmt.setString(4, to.getUrl());
//	         pstmt.setString(5, to.getTip());
//	         pstmt.setString(6, to.getRcseq());
//
//	         if(pstmt.executeUpdate() == 1) {
//	            flag = 0;
//	         }
//	      } catch (SQLException e) {
//	         // TODO Auto-generated catch block
//	         System.out.println("[레시피 수정 에러] : " + e.getMessage());
//	      }finally{
//	           if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
//	           if(conn != null) try{conn.close();} catch(SQLException e) {}
//	      }
//	      
//	      return flag;      
//	   }
//		//관리자 - 리뷰삭제
//		public int recipeDeleteOK(recipeTO to) {
//		      Connection conn = null;
//		      PreparedStatement pstmt = null;
//		      
//		      int flag = 1;
//		      
//		      try {
//		         conn = this.dataSource.getConnection();
//		         
//		         String sql = "delete from recipe where rcseq=? and subject=?";
//		         pstmt = conn.prepareStatement(sql);
//		         pstmt.setString(1, to.getRcseq());
//		         pstmt.setString(2, to.getSubject());
//		                  
//		         if(pstmt.executeUpdate() == 1) {
//		            flag = 0;
//		         }
//		      } catch (SQLException e) {
//		         // TODO Auto-generated catch block
//		         System.out.println("[레시피delete에러] : " + e.getMessage());
//		      }finally{
//		           if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
//		           if(conn != null) try{conn.close();} catch(SQLException e) {}
//		      }
//		      
//		      return flag;      
//		   }

		public HashMap<String, String> getFileName(ArrayList<String> rcList) {
			// TODO Auto-generated method stub
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		
			HashMap<String, String> Filelist = new HashMap<String, String>();
			
			try {
				conn = dataSource.getConnection();
				String sql = "select rcseq, rfilename from recipe where rcseq = ?";
				
				for(int i = 0; i < rcList.size() ; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, rcList.get(i));				
								
				rs = pstmt.executeQuery();
						
				if(rs.next()){
					Filelist.put(rs.getString("rcseq"),rs.getString("rfilename"));
				}
				
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				if(rs!=null)try{rs.close();}catch(SQLException e) {}
				if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
				if(conn!=null)try{conn.close();}catch(SQLException e) {}
			}	
						
			return Filelist;
		}

		public void setRfileName(int rcseq) {
			// TODO Auto-generated method stub
			  Connection conn = null;
		      PreparedStatement pstmt = null;
		     		      
		      String rfilename = rcseq + "_thumb_1.jpg";
		      
		      try {
		         conn = this.dataSource.getConnection();
		         
		         String sql = "update recipe set rfilename= ? where rcseq=?";
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, rfilename);
		         pstmt.setInt(2, rcseq);
		                  
		         pstmt.executeUpdate();
		         
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         System.out.println("[setRfileName에러] : " + e.getMessage());
		      }finally{
		           if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
		           if(conn != null) try{conn.close();} catch(SQLException e) {}
		      }
		}
}
