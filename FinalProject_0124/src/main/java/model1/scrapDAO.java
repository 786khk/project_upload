package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;

public class scrapDAO {
   private DataSource dataSource = null;
   
   public scrapDAO(DataSource dataSource) {
      // TODO Auto-generated constructor stub
      this.dataSource = dataSource;
   }
   
   public int scrapPlus(scrapTO sto){
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      int flag = 0;
      String scrapseq = "";
      try {
         conn = this.dataSource.getConnection(); 
                  
         String sql = "select scrapseq from member where id = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, sto.getId());
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            scrapseq = rs.getString("scrapseq");
            System.out.println("scrapseq : " + rs.getString("scrapseq"));
         }         
         
         if(scrapseq != null) {
            scrapseq = scrapseq + "," + sto.getRcseq();            
         }else {
            scrapseq = sto.getRcseq();
            
         }
         
         pstmt.close();
         
         sql = "update member set scrapseq = ? where id = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, scrapseq);
         pstmt.setString(2, sto.getId());
                                    
         int result = pstmt.executeUpdate();
         
         pstmt.close();
         
         if(result == 1) {
        	 
            sql = "update recipe set scrap = scrap + 1 where rcseq = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, sto.getRcseq());
                        
            flag = pstmt.executeUpdate();
            
         }else {
            flag = 2;
         }
          
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         if(rs!=null)try{rs.close();}catch(SQLException e) {}
         if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
         if(conn!=null)try{conn.close();}catch(SQLException e) {}
      }   
      return flag;
   }
   
   public String getScrapCount(scrapTO sto){
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
         
      String scrap = "";
      try {
         conn = this.dataSource.getConnection(); 
                  
         String sql = "select scrap from recipe where rcseq = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, sto.getRcseq());
                     
         rs = pstmt.executeQuery();
                  
          if(rs.next()) {                 
             scrap = rs.getString("scrap"); 
           }
          
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         if(rs!=null)try{rs.close();}catch(SQLException e) {}
         if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
         if(conn!=null)try{conn.close();}catch(SQLException e) {}
      }   
      return scrap;
   }
   
   public boolean checkScrapExist(scrapTO sto) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      boolean isExist = false;
         
      String scrapseq = "";
      try {
         conn = this.dataSource.getConnection(); 
                  
         String sql = "select scrapseq from member where id like ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, sto.getId());
                     
         rs = pstmt.executeQuery();
                  
          if(rs.next()) {                 
             scrapseq = rs.getString("scrapseq");
             if(scrapseq!=null) {
                if(scrapseq.contains(sto.getRcseq())){
                   isExist = true;
               }
             }
          }
                
            /* System.out.println(isExist); */
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         if(rs!=null)try{rs.close();}catch(SQLException e) {}
         if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
         if(conn!=null)try{conn.close();}catch(SQLException e) {}
      }   
      return isExist;
   }
}