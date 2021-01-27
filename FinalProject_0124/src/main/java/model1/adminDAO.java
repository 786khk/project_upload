package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class adminDAO {
	private DataSource dataSource = null;
			
	public adminDAO(DataSource dataSource) {
		this.dataSource = dataSource;
	}	
	
	//관리자 - 회원리스트
		public ArrayList<adminTO> memberList(){
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    
		    ArrayList<adminTO> lists = new ArrayList<adminTO>();
		    
		    try {
		       conn=this.dataSource.getConnection();
		       
		       String sql="select id, password, nickname, email, gender, phone, introduce  from member;";
		       pstmt = conn.prepareStatement(sql);
		       rs = pstmt.executeQuery();
		       
		       
		       while(rs.next()) {
		          adminTO to = new adminTO();
		          to.setId(rs.getString("id"));
		          to.setPassword(rs.getString("password"));
		          to.setNickname(rs.getString("nickname"));
		          to.setEmail(rs.getString("email"));
		          to.setGender(rs.getString("gender"));
		          to.setPhone(rs.getString("phone"));
		          to.setIntroduce(rs.getString("introduce"));
		          
		          lists.add(to);
		       }
		    } catch (SQLException e) {
		       // TODO Auto-generated catch block
		       System.out.println("[boardList 에러] : "+e.getMessage());
		    }
		    return lists;
		 }
	
	//관리자 - 회원수정
		public int memberModifyOk(adminTO to) {
			Connection conn = null;
			PreparedStatement pstmt = null;
		
			//int flag = 0;
			int flag = 2; // 에러처리
			   // seq/password
			
			 try {
				conn = dataSource.getConnection();
				 String sql = "update member set password=?, nickname=?, email=?, phone=?, introduce=? where id like ?";
				 pstmt = conn.prepareStatement(sql);
				 pstmt.setString(1, to.getPassword());
				 pstmt.setString(2, to.getNickname());
				 pstmt.setString(3, to.getEmail());
				 pstmt.setString(4, to.getPhone());
				 pstmt.setString(5, to.getIntroduce());
				 pstmt.setString(6, to.getId());
				 
				 //flag = pstmt.executeUpdate();
				 if(pstmt.executeUpdate() == 0){
			         flag = 1;
			      }else if(pstmt.executeUpdate() == 1){
			         flag = 0;
			      }
	
				 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
			      if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
			      if(conn!=null)try{conn.close();}catch(SQLException e) {}
			}
			
			return flag;
		}
	

//관리자 - 회원 삭제
		public int memberDeleteOK(adminTO to) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      
	      int flag = 1;
	      
	      try {
	    	  conn = this.dataSource.getConnection();
	    	  //리뷰삭제
	    	  String sql = "delete from review where rvwriter =?";
				pstmt = conn.prepareStatement( sql );
				pstmt.setString(1, to.getRcwriter());
				System.out.println("aa1:"+to.getId());		
				flag = pstmt.executeUpdate();
				pstmt.close();
				
				// 재료 삭제
	 			sql = "delete from material where id=?";
	 			pstmt = conn.prepareStatement( sql );
	 			pstmt.setString(1, to.getId());
	 			flag = pstmt.executeUpdate();
	 			pstmt.close();
	 			
	 			// 과정삭제
	 			sql = "delete from step where id =?";
	 			pstmt = conn.prepareStatement( sql );
	 			pstmt.setString(1, to.getId());
	 			flag = pstmt.executeUpdate();
	 			pstmt.close();
	 			
				//레시피삭제
				sql =  "delete from recipe where rcwriter=? ";
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setString(1, to.getRcwriter());
		       
		        flag = pstmt.executeUpdate();
		    	System.out.println("aa2:"+to.getId());
		    	System.out.println(flag);
		        pstmt.close();
			    //회원정보
				sql =  "delete from member where id=? and password=?";
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setString(1, to.getId());
		        pstmt.setString(2, to.getPassword());
		        System.out.println("aa3:"+to.getId());
		        System.out.println("aa3:"+to.getPassword());
			         if(pstmt.executeUpdate() == 1) {
			            flag = 0;
			         
			       
			         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         System.out.println("[memberdelete에러] : " + e.getMessage());
	      }finally{
	           if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
	           if(conn != null) try{conn.close();} catch(SQLException e) {}
	      }
	      
	      return flag;      
	   }
		 //관리자 시작
		 	//관리자 - 레시피 리스트
		 public ArrayList<adminTO> recipelist(){
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		
		 ArrayList<adminTO> list = new ArrayList<adminTO>();
		
		 try {
		 	conn = dataSource.getConnection();
		 	String sql = "select rcseq, rcwriter, subject, introduce, url, tip, category1, category2, wdate, hit, rev from recipe";
		 	pstmt = conn.prepareStatement(sql);
		 					
		 	rs = pstmt.executeQuery();
		 			
		 	while(rs.next()){
		 		adminTO to = new adminTO();
		 		to.setRcseq(rs.getString("rcseq"));
		 		to.setRcwriter(rs.getString("rcwriter"));
		 		to.setSubject(rs.getString("subject"));
		 		to.setIntroduce(rs.getString("introduce"));
		 		to.setUrl(rs.getString("url"));
		 		to.setTip(rs.getString("tip"));
		 		to.setCategory1(rs.getString("category1"));
		 		to.setCategory2(rs.getString("category2"));
		 		to.setWdate(rs.getString("wdate"));
		 		to.setHit(rs.getString("hit"));
		 		to.setRev(rs.getString("rev"));
		 		list.add(to);
		 	}
		 } catch (SQLException e) {
		 	// TODO Auto-generated catch block
		 	e.printStackTrace();
		 }finally {
		 	if(rs!=null)try{rs.close();}catch(SQLException e) {}
		 	if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
		 	if(conn!=null)try{conn.close();}catch(SQLException e) {}
		 }	
		 return list;
		 }
		
		 	//관리자 - 레시피 수정
		 public int recipeModifyOK(adminTO to) {
		   Connection conn = null;
		   PreparedStatement pstmt = null;
		   
		   int flag = 1;
		   
		   try {
		      conn = this.dataSource.getConnection();
		      
		      String sql = "update recipe set subject=?, introduce=?, url=?, tip=? where rcseq=?";
		      pstmt = conn.prepareStatement(sql);
		      pstmt.setString(1, to.getSubject());
		      pstmt.setString(2, to.getIntroduce());
		      pstmt.setString(3, to.getUrl());
		      pstmt.setString(4, to.getTip());
		      pstmt.setString(5, to.getRcseq());
		
		      if(pstmt.executeUpdate() == 1) {
		         flag = 0;
		      }
		 		System.out.println("revew :" +flag);
		   } catch (SQLException e) {
		      // TODO Auto-generated catch block
		      System.out.println("[레시피 수정 에러] : " + e.getMessage());
		   }finally{
		        if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
		        if(conn != null) try{conn.close();} catch(SQLException e) {}
		   }
		   
		   return flag;      
		 }
		 //관리자 - 레시피삭제
		 public int recipeDeleteOK(adminTO to) {
		       Connection conn = null;
		       PreparedStatement pstmt = null;
		       
		       int flag = 1;
		       
		       try {
		     	  conn = this.dataSource.getConnection();
		     	  //리뷰삭제
		     	  String sql = "delete from review where rcseq=?";
		 			pstmt = conn.prepareStatement( sql );
		 			pstmt.setString(1, to.getRcseq());
		 			flag = pstmt.executeUpdate();
		 			
		 			pstmt.close();
		 			
		 			
		 			// 재료 삭제
		 			sql = "delete from material where rcseq=?";
		 			pstmt = conn.prepareStatement( sql );
		 			pstmt.setString(1, to.getRcseq());
		 			flag = pstmt.executeUpdate();
		 			pstmt.close();
		 			
		 			// 과정삭제
		 			sql = "delete from step where rcseq=?";
		 			pstmt = conn.prepareStatement( sql );
		 			pstmt.setString(1, to.getRcseq());
		 			flag = pstmt.executeUpdate();
		 			pstmt.close();
		 			
		 			
		 			//레시피삭제
		 			sql =  "delete from recipe where rcseq=?";
		 	        pstmt = conn.prepareStatement(sql);
		 	       // pstmt.setString(1, to.getSubject());
		 	        pstmt.setString(1, to.getRcseq());
		 	        //flag = pstmt.executeUpdate();
		 	        
		 	        flag = 0;//다시 flag 초기화
		 	        flag = pstmt.executeUpdate();
		 	        if(flag > 0) {//위에 flag를 삭제한 결과가 존재할 때 
		 	        	flag = 0;
		 		    }
		 		        
		       } catch (SQLException e) {
		          // TODO Auto-generated catch block
		          System.out.println("[레시피deleteDAO에러] : " + e.getMessage());
		       }finally{
		            if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
		            if(conn != null) try{conn.close();} catch(SQLException e) {}
		       }
		       
		       return flag;      
		    }
		
		 //관리자 끝
		 
		//관리자
		 //리뷰리스트
		  public ArrayList<adminTO> reviewList(){
		     Connection conn = null;
		     PreparedStatement pstmt = null;
		     ResultSet rs = null;
		        
		     ArrayList<adminTO> lists = new ArrayList<adminTO>();
		     
		     try {
		        conn = this.dataSource.getConnection(); 
		        
		        String sql = "select rvseq, rcseq,  rvwriter, rvwdate, star, rvcontent from review";
		        pstmt = conn.prepareStatement(sql);
		        rs = pstmt.executeQuery();
		        
		        while(rs.next()) {
		           adminTO to = new adminTO();
		           to.setRvseq(rs.getString("rvseq"));
		           to.setRcseq(rs.getString("rcseq"));
		         //  to.setNickname(rs.getString("nickname"));
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
			public int reviewDeleteOK(adminTO to) {
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
			public int reviewModifyOK(adminTO to) {
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
		        System.out.println("[reviewdelete에러] : " + e.getMessage());
		     }finally{
		          if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
		          if(conn != null) try{conn.close();} catch(SQLException e) {}
		     }
		     
		     return flag;      
		  }
			   //관리자 끝
			
			
 

}
