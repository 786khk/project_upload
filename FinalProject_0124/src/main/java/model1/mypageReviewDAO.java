package model1;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class mypageReviewDAO {
   private DataSource dataSource = null;
   
   public mypageReviewDAO(DataSource dataSource) {
      // TODO Auto-generated constructor stub
      this.dataSource = dataSource;   
   }
   
   public ArrayList<mypageReviewTO> mypageReplyWriteList(mypageReviewTO mprwTO){
          Connection conn = null; 
          PreparedStatement pstmt = null;
          ResultSet rs = null;
             
          ArrayList<mypageReviewTO> lists = new ArrayList<mypageReviewTO>();
          
          try {
             conn = this.dataSource.getConnection(); 
             
             String sql = "select rcseq, nickname, rvwdate, star, rvcontent, rvfilename, rvseq from review r inner join member m on r.rvwriter = m.id where id = ?";
             pstmt = conn.prepareStatement(sql);
             pstmt.setString(1, mprwTO.getId());
             
             rs = pstmt.executeQuery();
             
             while(rs.next()) {
                mypageReviewTO to = new mypageReviewTO();
                to.setRcseq(rs.getString("rcseq"));
                to.setNickname(rs.getString("nickname"));
                to.setRvwdate(rs.getString("rvwdate"));
                to.setRvcontent(rs.getString("rvcontent") == null ? "" : rs.getString("rvcontent").replaceAll("\n", "<br>"));
                to.setStar(rs.getInt("star"));            
                to.setRvfilename(rs.getString("rvfilename"));
                to.setRvseq(rs.getString("rvseq"));
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

   public ArrayList<mypageReviewTO> mypageReplyGetList(mypageReviewTO mrTO) {
      // TODO Auto-generated method stub
         Connection conn = null; 
          PreparedStatement pstmt = null;
          ResultSet rs = null;
             
          ArrayList<mypageReviewTO> lists = new ArrayList<mypageReviewTO>();
          
          try {
             conn = this.dataSource.getConnection(); 
             
             String rcseq = "";
             
             String sql = "select rcseq from recipe rc inner join member m on rc.rcwriter = m.id where id = ?";
             pstmt = conn.prepareStatement(sql);
             pstmt.setString(1, mrTO.getId());
             rs = pstmt.executeQuery();
             
             if(rs.next()) {
                rcseq = rs.getString("rcseq");
             }
             
             pstmt.close();
             rs.close();
             
             sql = "select rcseq, nickname, rvwdate, star, rvcontent, rvfilename, rvseq from review r inner join member m on r.rvwriter = m.id where rcseq = ?";
             pstmt = conn.prepareStatement(sql);
             pstmt.setString(1, rcseq);
             
             rs = pstmt.executeQuery();
             
             while(rs.next()) {
                mypageReviewTO to = new mypageReviewTO();
                to.setRcseq(rs.getString("rcseq"));
                to.setNickname(rs.getString("nickname"));
                to.setRvwdate(rs.getString("rvwdate"));
                to.setRvcontent(rs.getString("rvcontent") == null ? "" : rs.getString("rvcontent").replaceAll("\n", "<br>"));
                to.setStar(rs.getInt("star"));            
                to.setRvfilename(rs.getString("rvfilename"));
                to.setRvseq(rs.getString("rvseq"));
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