package model1;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class viewDAO {
   private DataSource dataSource = null;
        
   
   public viewDAO(DataSource dataSource) {
      this.dataSource = dataSource;
   }   
   
public ArrayList<viewTO> viewlist(int skip){
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
   
      
      ArrayList<viewTO> list = new ArrayList<viewTO>();
      
      try {
         conn = dataSource.getConnection();
         String sql = "select r.rcseq, m.nickname, r.subject, m.picture, r.rfilename, r.wdate, r.hit, r.rev from recipe r inner join member m on r.rcwriter = m.id order by rcseq desc limit ?, 8";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, skip);
                  
         rs = pstmt.executeQuery();
               
         while(rs.next()){
            viewTO to = new viewTO();
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

public divisionViewTO viewlist_detail(String cat1, String cat2){
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "";
    int sqlCase = 0;
    if(!cat1.equals("") && cat2.equals("")) {
    	sql = "select r.rcseq, m.nickname, r.subject, m.picture, r.rfilename, r.wdate, r.hit, r.rev from recipe r inner join member m on r.rcwriter = m.id where category1=? order by wdate desc";
    	sqlCase = 1;
    }else if (cat1.equals("") && !cat2.equals("")) {
    	sql = "select r.rcseq, m.nickname, r.subject, m.picture, r.rfilename, r.wdate, r.hit, r.rev from recipe r inner join member m on r.rcwriter = m.id where category2=? order by wdate desc";
    	sqlCase = 2;
    }else if(!cat1.equals("") && !cat2.equals("")){
    	sql = "select r.rcseq, m.nickname, r.subject, m.picture, r.rfilename, r.wdate, r.hit, r.rev from recipe r inner join member m on r.rcwriter = m.id where category1=? and category2=? order by wdate desc";
    	sqlCase = 3;
    }
    
    divisionViewTO dvto = new divisionViewTO();
    ArrayList<viewTO> list = new ArrayList<viewTO>();
    int count = 0;
    try {
       conn = dataSource.getConnection();       
       pstmt = conn.prepareStatement(sql);
       
       if(sqlCase == 1) {
    	   pstmt.setString(1, cat1);
       }else if(sqlCase == 2) {
    	   pstmt.setString(1, cat2);
       }else if(sqlCase ==3) {
    	   pstmt.setString(1, cat1);
    	   pstmt.setString(2, cat2);
       }       
                
       rs = pstmt.executeQuery();
             
       while(rs.next()){
          viewTO to = new viewTO();
          to.setRcseq(rs.getString("rcseq"));
          to.setNickname(rs.getString("nickname"));
          to.setSubject(rs.getString("subject"));
          to.setPicture(rs.getString("picture"));
          to.setrfilename(rs.getString("rfilename"));
          to.setWdate(rs.getString("wdate"));
          to.setHit(rs.getString("hit"));
          to.setRev(rs.getString("rev"));            
          
          list.add(to);
          count++;
       }
       
       dvto.setCount(count);
       dvto.setDvList(list);
    } catch (SQLException e) {
       // TODO Auto-generated catch block
       e.printStackTrace();
    }finally {
       if(rs!=null)try{rs.close();}catch(SQLException e) {}
       if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
       if(conn!=null)try{conn.close();}catch(SQLException e) {}
    }   
    return dvto;
 }


public int getTotalRecord() {
	// TODO Auto-generated method stub
	Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
	int totalRecord = 0;
	
	try {
        conn = dataSource.getConnection();
        String sql = "select count(*) count from recipe";
        pstmt = conn.prepareStatement(sql);
                 
        rs = pstmt.executeQuery();
        
       if(rs.next()) {
    	   totalRecord = rs.getInt("count");
       }
                           
       
     } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
     }finally {
        if(rs!=null)try{rs.close();}catch(SQLException e) {}
        if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
        if(conn!=null)try{conn.close();}catch(SQLException e) {}
     }  
	
	return totalRecord;
}

}