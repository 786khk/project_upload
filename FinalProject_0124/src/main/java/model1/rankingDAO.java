package model1;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class rankingDAO {
   private DataSource dataSource = null;
        
   
   public rankingDAO(DataSource dataSource) {
      this.dataSource = dataSource;
   }   
   
public ArrayList<rankingTO> rankinglistHit(int skip){
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
   
      ArrayList<rankingTO> list = new ArrayList<rankingTO>();
      
      try {
         conn = dataSource.getConnection();
         String sql = "select r.rcseq, m.nickname, r.subject, m.picture, r.rfilename, r.url, r.wdate, r.hit, r.rev from recipe r inner join member m on r.rcwriter = m.id order by hit desc limit ?, 8";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, skip);         
         
         rs = pstmt.executeQuery();
               
         while(rs.next()){
            rankingTO to = new rankingTO();
            to.setRcseq(rs.getString("rcseq"));
            to.setNickname(rs.getString("nickname"));
            to.setSubject(rs.getString("subject"));
            to.setPicture(rs.getString("picture"));
            to.setrfilename(rs.getString("rfilename"));
            to.setWdate(rs.getString("wdate"));
            to.setHit(rs.getString("hit"));
            to.setRev(rs.getString("rev"));            
            to.setUrl(rs.getString("url"));
            
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

public ArrayList<rankingTO> rankinglistStar(int skip){
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
 
    
    ArrayList<rankingTO> list = new ArrayList<rankingTO>();
    
    try {
       conn = dataSource.getConnection();
       String sql = "select r.rcseq, m.nickname, r.subject, m.picture, r.rfilename, r.url, r.wdate, r.hit, r.rev  from recipe r inner join member m on r.rcwriter = m.id order by r.hit desc limit ?";
       pstmt = conn.prepareStatement(sql);
       pstmt.setInt(1, skip);
                
       rs = pstmt.executeQuery();
             
       while(rs.next()){
          rankingTO to = new rankingTO();
          to.setRcseq(rs.getString("rcseq"));
          to.setNickname(rs.getString("nickname"));
          to.setSubject(rs.getString("subject"));
          to.setPicture(rs.getString("picture"));
          to.setrfilename(rs.getString("rfilename"));
          to.setWdate(rs.getString("wdate"));
          to.setHit(rs.getString("hit"));
          to.setRev(rs.getString("rev"));            
          to.setUrl(rs.getString("url"));
         // to.setAverstar(rs.getInt("star"));

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

public rankingTO rankinglistr(rankingTO to){
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    int skip = 0;
    
    ArrayList<rankingTO> list = new ArrayList<rankingTO>();
    
    try {
       conn = dataSource.getConnection();
       String sql = "select r.rcseq, m.nickname, r.subject, m.picture, r.rfilename, r.url, r.wdate, r.hit, r.rev from recipe r inner join member m on r.rcwriter = m.id order by r.hit desc limit ?, 8";
       pstmt = conn.prepareStatement(sql);
       pstmt.setInt(1, skip);
                
       rs = pstmt.executeQuery();
             
       while(rs.next()){
        //  rankingTO to = new rankingTO();
          to.setRcseq(rs.getString("rcseq"));
          to.setNickname(rs.getString("nickname"));
          to.setSubject(rs.getString("subject"));
          to.setPicture(rs.getString("picture"));
          to.setrfilename(rs.getString("rfilename"));
          to.setWdate(rs.getString("wdate"));
          to.setHit(rs.getString("hit"));
          to.setRev(rs.getString("rev"));            
          to.setUrl(rs.getString("url"));
         // to.setAverstar(rs.getInt("star"));

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
    return to;
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

public ArrayList<rankingTO> rankingfileSide() {
	// TODO Auto-generated method stub
	 Connection conn = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null;
  
     ArrayList<rankingTO> list = new ArrayList<rankingTO>();
     
     try {
        conn = dataSource.getConnection();
        String sql = "select rfilename from recipe order by hit desc limit 5";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
              
        while(rs.next()){
           rankingTO to = new rankingTO();
           to.setrfilename(rs.getString("rfilename"));
           to.setRcseq(rs.getString("rcseq"));
           list.add(to);
        }
     } catch (SQLException e) {
        // TODO Auto-generated catch block
    	 System.out.println("rankingfile ERR" + e.getMessage());
        e.printStackTrace();
     }finally {
        if(rs!=null)try{rs.close();}catch(SQLException e) {}
        if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
        if(conn!=null)try{conn.close();}catch(SQLException e) {}
     }   
     return list;
}




public ArrayList<rankingTO> rankinglistSide() {
	// TODO Auto-generated method stub
	 Connection conn = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null;
  
     ArrayList<rankingTO> list = new ArrayList<rankingTO>();
     
     try {
        conn = dataSource.getConnection();
        String sql = "select rcseq, subject, rfilename from recipe order by hit desc limit 5";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
              
        while(rs.next()){
        	rankingTO to = new rankingTO();
           to.setRcseq(rs.getString("rcseq"));
           to.setSubject(rs.getString("subject"));
           to.setrfilename(rs.getString("rfilename"));
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



public ArrayList<rankingTO> recipetop3(){
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
		
	ArrayList<rankingTO> lists = new ArrayList<rankingTO>();
	
	try {
		conn = this.dataSource.getConnection(); 
		
		String sql = "select rcseq, subject,  rfilename from recipe order by hit desc limit 3 ";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			rankingTO rto = new rankingTO();
			rto.setRcseq(rs.getString("rcseq"));
			rto.setSubject(rs.getString("subject"));
			rto.setrfilename(rs.getString("rfilename"));
			//rto.setHit(rs.getString("hit"));
			
			lists.add(rto);
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


}