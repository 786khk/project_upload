package model1;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class mypageMemberDAO {
   private DataSource dataSource;
   
   public mypageMemberDAO(DataSource dataSource) {
      // TODO Auto-generated constructor stub
      this.dataSource = dataSource;
   }
   
   public int mypageAllview(String id){
          Connection conn = null; 
          PreparedStatement pstmt = null;
          ResultSet rs = null;
             
          int allview = 0;
          
          try {
             conn = this.dataSource.getConnection(); 
             
             String sql = "select hit from recipe where rcwriter = ?";
             pstmt = conn.prepareStatement(sql);
             pstmt.setString(1, id);
             
             rs = pstmt.executeQuery();
                                       
             while(rs.next()) {
                
               allview += Integer.parseInt(rs.getString("hit"));
                
             }
             
          } catch (SQLException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
          }finally {
             if(rs!=null)try{rs.close();}catch(SQLException e) {}
             if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
             if(conn!=null)try{conn.close();}catch(SQLException e) {}
          }   
          return allview;
       }
   
   public int mypageRev(String id){
          Connection conn = null; 
          PreparedStatement pstmt = null;
          ResultSet rs = null;
             
          int allrev = 0;
          
          try {
             conn = this.dataSource.getConnection(); 
             
             String sql = "select rev from recipe where rcwriter = ?";
             pstmt = conn.prepareStatement(sql);
             pstmt.setString(1, id);
             
             rs = pstmt.executeQuery();
                                       
             while(rs.next()) {
                
               allrev += Integer.parseInt(rs.getString("rev"));
                
             }
             
          } catch (SQLException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
          }finally {
             if(rs!=null)try{rs.close();}catch(SQLException e) {}
             if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
             if(conn!=null)try{conn.close();}catch(SQLException e) {}
          }   
          return allrev;
       }
   
   public int mypageAllscrap(String id){
          Connection conn = null; 
          PreparedStatement pstmt = null;
          ResultSet rs = null;
             
          int allscrap = 0;
          
          try {
             conn = this.dataSource.getConnection(); 
             
             String sql = "select scrap from recipe where rcwriter = ?";
             pstmt = conn.prepareStatement(sql);
             pstmt.setString(1, id);
             
             rs = pstmt.executeQuery();
                                       
             while(rs.next()) {
                
               allscrap += Integer.parseInt(rs.getString("scrap"));
                
             }
             
          } catch (SQLException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
          }finally {
             if(rs!=null)try{rs.close();}catch(SQLException e) {}
             if(pstmt!=null)try{pstmt.close();}catch(SQLException e) {}
             if(conn!=null)try{conn.close();}catch(SQLException e) {}
          }   
          return allscrap;
       }
   
   
   public ArrayList<mypageMemberTO> mypageMemberList(String id){
          Connection conn = null; 
          PreparedStatement pstmt = null;
          ResultSet rs = null;
             
          ArrayList<mypageMemberTO> lists = new ArrayList<mypageMemberTO>();
          
          try {
             conn = this.dataSource.getConnection(); 
             
             String sql = "select nickname, introduce, picture from member where id = ?";
             pstmt = conn.prepareStatement(sql);
             pstmt.setString(1, id);
             
             rs = pstmt.executeQuery();
             
             while(rs.next()) {
               mypageMemberTO to = new mypageMemberTO();
                to.setNickname(rs.getString("nickname"));
                to.setIntroduce(rs.getString("introduce") == null ? "" : rs.getString("introduce").replaceAll("\n", "<br>"));
                to.setPicture(rs.getString("picture"));
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
}