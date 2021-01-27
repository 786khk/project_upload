package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class mypagePublicDAO {
	 private DataSource dataSource = null;
	 
	 public mypagePublicDAO(DataSource dataSource) {
		// TODO Auto-generated constructor stub
		 this.dataSource = dataSource;		 
	}
	 
	public ArrayList<mypagePublicTO> mypagePublicList(mypagePublicTO mpto){
		Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	   
	      ArrayList<mypagePublicTO> list = new ArrayList<mypagePublicTO>();
	      
	      try {
	         conn = dataSource.getConnection();
	         String sql = "select r.rcseq, m.nickname, r.subject, m.picture, r.rfilename, r.wdate, r.hit, r.rev from recipe r inner join member m on r.rcwriter = m.id where id = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, mpto.getId());
	                  
	         rs = pstmt.executeQuery();
	               
	         while(rs.next()){
	        	 mypagePublicTO to = new mypagePublicTO();
	            to.setRcseq(rs.getString("rcseq"));
	            to.setNickname(rs.getString("nickname"));
	            to.setSubject(rs.getString("subject"));
	            to.setPicture(rs.getString("picture"));
	            to.setrfilename(rs.getString("rfilename"));
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
	
	public String mypageScrapseq(mypagePublicTO mpto){
		Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      String scrapseq = "";
	      try {
	         conn = dataSource.getConnection();
	         String sql = "select scrapseq from member where id = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, mpto.getId());
	                  
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	        	 scrapseq  = rs.getString("scrapseq");
	         }
	               
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         if(rs!=null)try{rs.close();}catch(SQLException e) {}
	         if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
	         if(conn!=null)try{conn.close();}catch(SQLException e) {}
	      }   
	      return scrapseq;
	}
	
	public ArrayList<mypagePublicTO> mypageScrapList(mypagePublicTO mpto){
		Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	   
	      ArrayList<mypagePublicTO> list = new ArrayList<mypagePublicTO>();
	      
	      try {
	         conn = dataSource.getConnection();
	         String sql = "select r.rcseq, m.nickname, r.subject, m.picture, r.rfilename, r.wdate, r.hit, r.rev from recipe r inner join member m on r.rcwriter = m.id where rcseq = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, mpto.getRcseq());
	                  
	         rs = pstmt.executeQuery();
	               
	         while(rs.next()){
	        	 mypagePublicTO to = new mypagePublicTO();
	            to.setRcseq(rs.getString("rcseq"));
	            to.setNickname(rs.getString("nickname"));
	            to.setSubject(rs.getString("subject"));
	            to.setPicture(rs.getString("picture"));
	            to.setrfilename(rs.getString("rfilename"));
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
}
