package model1;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class userModifyDAO {
   private DataSource dataSource;
   
   public userModifyDAO(DataSource dataSource) {
      // TODO Auto-generated constructor stub
      this.dataSource = dataSource;
   }
   
   public ArrayList<userModifyTO> userModifyInfo(String id){
      Connection conn = null; 
        PreparedStatement pstmt = null;
        ResultSet rs = null;
           
        ArrayList<userModifyTO> lists = new ArrayList<userModifyTO>();
        
        try {
           conn = this.dataSource.getConnection(); 
           
           String sql = "select nickname, email from member where id = ?";
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, id);
           
           rs = pstmt.executeQuery();
           
           while(rs.next()) {
             userModifyTO to = new userModifyTO();
              to.setNickname(rs.getString("nickname"));
              to.setEmail(rs.getString("email"));
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
   
   public int nickModify(String nick, String id){
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         
         int flag = 0;
         try {
            conn = this.dataSource.getConnection(); 
                    
            
            
            String sql = "update member set nickname = ? where id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nick);
            pstmt.setString(2, id);
                                       
            int result = pstmt.executeUpdate();
            
            pstmt.close();
            
            if(result == 1) {           
               flag = 1;
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
   
   public int emailModify(String email, String id){
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         
         int flag = 0;
         try {
            conn = this.dataSource.getConnection(); 
                    
            
            
            String sql = "update member set email = ? where id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, id);
                                       
            int result = pstmt.executeUpdate();
            
            pstmt.close();
            
            if(result == 1) {           
               flag = 1;
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

   public int userDel(String id) {
      // TODO Auto-generated method stub
      Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       //String rcseq = "";
       ArrayList<String> rcseqs = new ArrayList<String>();
       int flag_1 = 0;
       int flag = 0;
         try {
            conn = this.dataSource.getConnection(); 
                  
            
            String sql = "select rcseq from recipe where rcwriter = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            while(rs.next()) {
              
              rcseqs.add(rs.getString("rcseq")); 
            }
            
            for(String rcseq : rcseqs) {
               
               sql = "delete from material where rcseq = ?";
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, rcseq);
               int result1 = pstmt.executeUpdate();
               if(result1 != 0) {
                  flag_1 = 1;
               }
               
               sql = "delete from step where rcseq = ?";
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, rcseq);
               int result2 = pstmt.executeUpdate();       
               if(result2 != 0) {
                  flag_1 = 2;
               }
               
               sql = "delete from review where rcseq = ?";
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, rcseq);
               int result3 = pstmt.executeUpdate();       
               if(result3 != 0) {
                  flag_1 = 3;
               }
               
               sql = "delete from recipe where rcseq = ?";
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, rcseq);
               int result4 = pstmt.executeUpdate();       
               if(result4 != 0) {
                  flag_1 = 4;
               }
            }
            
            sql = "delete from review where rvwriter = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            int result5 = pstmt.executeUpdate();       
            if(result5 != 0) {
               flag_1 = 5;
            }
            
            sql = "delete from member where id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            int result6 = pstmt.executeUpdate();       
            if(result6 != 0) {
               flag_1 = 6;
            }
            
            if(flag_1 == 6) {           
               flag = 1;
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
}