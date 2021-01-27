package model1;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class reviewDAO {
   private DataSource dataSource = null;
   
   public reviewDAO(DataSource dataSource) {
      // TODO Auto-generated constructor stub
      this.dataSource = dataSource;
   }
   
   public int reviewOK(reviewTO to){
      Connection conn = null;
      PreparedStatement pstmt = null;      
      ResultSet rs = null;
      
      int count = 0;      
      int rvSeq = 0;
      
      try {
         conn = dataSource.getConnection();
         String sql = "insert into review values(0,?,?,now(),?,?,?)";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, to.getRcseq());
         pstmt.setString(2, to.getRvwriter());         
         pstmt.setInt(3, to.getStar());
         pstmt.setString(4, to.getRvcontent());           
         pstmt.setString(5, to.getRvfilename());           
         pstmt.executeUpdate();  
         pstmt.close();
         System.out.println();    
         sql = "select count(*) count from review where rcseq = ?";      
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, to.getRcseq());
         
         rs = pstmt.executeQuery();
                           
         if(rs.next()){
            
            count = rs.getInt("count");
                     
         }  
         
         pstmt.close();
         
         sql = "update recipe set rev = ? where rcseq = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, count);
         pstmt.setString(2, to.getRcseq());
         pstmt.executeUpdate();
         
         sql = "update review set star = star + ? where rcseq = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, to.getStar());
         pstmt.setString(2, to.getRcseq());
         pstmt.executeUpdate();
         
         pstmt.close();
         rs.close();
         
         sql = "select rvseq from review where rvwriter like ? and  rvcontent like ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, to.getRvwriter());
         pstmt.setString(2, to.getRvcontent());
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
        	 rvSeq = rs.getInt("rvseq");
         }
         
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {         
    	  if(rs != null) try {rs.close();} catch(SQLException e) {}
         if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
         if(conn!=null)try{conn.close();}catch(SQLException e) {}
         
      }   
      return rvSeq;
   }   
   
   //리뷰목록
   public ArrayList<reviewTO> reviewData(reviewTO rvto){
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
         
      ArrayList<reviewTO> lists = new ArrayList<reviewTO>();
      
      try {
         conn = this.dataSource.getConnection(); 
         
         String sql = "select rvseq,  m.id, rvwdate, star, rvcontent, rev, rvfilename from review r inner join member m on r.rvwriter = m.id inner join recipe rc on r.rcseq = rc.rcseq where rc.rcseq = ? order by rvwdate desc";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, rvto.getRcseq());
                     
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            reviewTO to = new reviewTO();
            to.setRvseq(rs.getString("rvseq"));
			 to.setNickname(rs.getString("id"));
            to.setRvwriter("rvwriter");
            to.setRvwdate(rs.getString("rvwdate"));            
            to.setRvcontent(rs.getString("rvcontent") == null ? "" : rs.getString("rvcontent").replaceAll("\n", "<br>"));
            to.setStar(rs.getInt("star"));            
            to.setRev(rs.getString("rev"));
            System.out.println("rvwriter_test : " + to.getRvwriter());
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
   
 
   public ArrayList<reviewTO> divisionReviewData(){
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
          
       ArrayList<reviewTO> lists = new ArrayList<reviewTO>();
       
       try {
          conn = this.dataSource.getConnection(); 
          
          String sql = "select rcseq, nickname, rvwriter,  rvwdate, star, rvcontent, rvfilename from review r inner join member m on r.rvwriter = m.id";
          pstmt = conn.prepareStatement(sql);
                      
          rs = pstmt.executeQuery();
          
          while(rs.next()) {
             reviewTO to = new reviewTO();
             to.setRcseq(rs.getString("rcseq"));
			 to.setNickname(rs.getString("nickname")); 
			 to.setRvwriter(rs.getString("rvwriter"));
             to.setRvwdate(rs.getString("rvwdate"));
             to.setRvcontent(rs.getString("rvcontent") == null ? "" : rs.getString("rvcontent").replaceAll("\n", "<br>"));
             to.setStar(rs.getInt("star"));            
             to.setRvfilename(rs.getString("rvfilename"));
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
   
   public int setRevImgFileName(String rvSeq, String saveFileName){
	      Connection conn = null;
	      PreparedStatement pstmt = null;      
	      ResultSet rs = null;
	      
	      int flag = 0;
	    	      
	      try {
	         conn = dataSource.getConnection();
	         String sql = "update review set rvfilename = ? where rvseq like ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, saveFileName);
	         pstmt.setString(2, rvSeq);
	                     
	         flag = pstmt.executeUpdate();  
	                  
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {         
	    	 if(rs != null) try {rs.close();} catch(SQLException e) {}
	         if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
	         if(conn!=null)try{conn.close();}catch(SQLException e) {}
	         
	      }   
	      return flag;
	   }   
   
   public ArrayList<reviewTO> reviewList(){
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	         
	      ArrayList<reviewTO> lists = new ArrayList<reviewTO>();
	      
	      try {
	         conn = this.dataSource.getConnection(); 
	         
	         String sql = "select rvseq, rcseq, nickname, rvwriter, rvwdate, star, rvcontent from review";
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            reviewTO to = new reviewTO();
	            to.setRvseq(rs.getString("rvseq"));
	            to.setRcseq(rs.getString("rcseq"));
				/* to.setNickname(rs.getString("nickname")); */
	            to.setRvwriter(rs.getString("rvwriter"));
	            to.setRvwdate(rs.getString("rvwdate"));
	            to.setStar(rs.getInt("star"));   
	            to.setRvcontent(rs.getString("rvcontent"));
	                    
	            
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
		//관리자 - 리뷰삭제
		public int reviewDeleteOK(reviewTO to) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      
	      int flag = 1;
	      
	      try {
	         conn = this.dataSource.getConnection();
	         
	         String sql = "delete from review where rvseq=? and rcseq=?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, to.getRvseq());
	         pstmt.setString(2, to.getRcseq());
	                  
	         if(pstmt.executeUpdate() == 1) {
	            flag = 0;
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         System.out.println("[reviewdelete에러] : " + e.getMessage());
	      }finally{
	           if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
	           if(conn != null) try{conn.close();} catch(SQLException e) {}
	      }
	      
	      return flag;      
	   }
		//관리자 - 리뷰 수정
		public int reviewModifyOK(reviewTO to) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      
	      int flag = 1;
	      
	      try {
	         conn = this.dataSource.getConnection();
	         
	         String sql = "update review set rvcontent=? where rvseq=?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, to.getRvcontent());
	         pstmt.setString(2, to.getRvseq());

	                  
	         if(pstmt.executeUpdate() == 1) {
	            flag = 0;
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         System.out.println("[review 수정 에러] : " + e.getMessage());
	      }finally{
	           if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
	           if(conn != null) try{conn.close();} catch(SQLException e) {}
	      }
	      
	      return flag;      
	   }
		
		public int getRevCount() {
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      
		      int count = 0;
		      
		      try {
		         conn = this.dataSource.getConnection();
		         
		         String sql = "select count(*) count from review";
		         pstmt = conn.prepareStatement(sql);
		         rs = pstmt.executeQuery();
		         
		         if(rs.next()) {
		        	 count = rs.getInt("count");
		         }
		         
		         
		      } catch (SQLException e) {
		    
		         System.out.println("[reviewcount에러] : " + e.getMessage());
		      }finally{
		          if(rs != null) try{rs.close();} catch(SQLException e) {}
		    	  if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
		          if(conn != null) try{conn.close();} catch(SQLException e) {}
		      }
		      return count;      
		   }

		public ArrayList<reviewTO> getRevList(int skip) {
			 Connection conn = null;
		     PreparedStatement pstmt = null;
		     ResultSet rs = null;
		      
		     ArrayList<reviewTO> revList = new ArrayList<reviewTO>();
		      
		     try {
		      
			 conn = this.dataSource.getConnection(); 
	         
	         String sql = "select rvseq, nickname, rvwdate, star, rvcontent, rev, rvfilename, rc.rcseq rcseq from review r inner join member m on r.rvwriter = m.id inner join recipe rc on r.rcseq = rc.rcseq order by rvwdate desc limit ?, 8";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, skip);
	                     
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            reviewTO to = new reviewTO();
	            to.setRcseq(rs.getString("rcseq"));
	            to.setRvseq(rs.getString("rvseq"));
				to.setNickname(rs.getString("nickname")); 
	            to.setRvwdate(rs.getString("rvwdate"));            
	            to.setRvcontent(rs.getString("rvcontent") == null ? "" : rs.getString("rvcontent").replaceAll("\n", "<br>"));
	            to.setStar(rs.getInt("star"));            
	            to.setRev(rs.getString("rev"));
	            to.setRvfilename(rs.getString("rvfilename"));
	            
	            revList.add(to);
	         }
	         } catch (SQLException e) {
		    
		         System.out.println("[review목록에러] : " + e.getMessage());
		      }finally{
		          if(rs != null) try{rs.close();} catch(SQLException e) {}
		    	  if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
		          if(conn != null) try{conn.close();} catch(SQLException e) {}
		      }
			
			
			return revList;
		}
   
}