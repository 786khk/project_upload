package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class memberDAO {
	private DataSource dataSource = null;
			
	public memberDAO(DataSource dataSource) {
		this.dataSource = dataSource;
	}	

	public int login_ok(memberTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int flag = 0;
		try {
			conn = dataSource.getConnection();
			String sql = "select count(*) count from member where id like ? and password like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getId());
			pstmt.setString(2, to.getPassword());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				flag = rs.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) try {rs.close();} catch (SQLException e) {}
			if (pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if (conn != null) try {conn.close();} catch (SQLException e) {}
		}
		return flag;
	}

	public int join_ok(memberTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = dataSource.getConnection();
			String sql = "insert into member values(?,?,?,?,?,?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getId());
			pstmt.setString(2, to.getPassword());
			pstmt.setString(3, to.getNickname());
			pstmt.setString(4, to.getEmail());
			pstmt.setString(5, to.getGender());
			pstmt.setString(6, to.getPhone());
			pstmt.setString(7, to.getIntroduce());
			pstmt.setString(8, to.getPicture());
			//pstmt.setInt(9, to.getAllview());
			pstmt.setString(9, "");//스크랩 문자열
			flag = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if (conn != null) try {conn.close();} catch (SQLException e) {}
		}
		return flag;
	}

	public int idCheck(memberTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int flag = 0;
		try {
			conn = dataSource.getConnection();
			String sql = "select count(*) count from member where id like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				flag = rs.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) try {rs.close();} catch (SQLException e) {}
			if (pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if (conn != null) try {conn.close();} catch (SQLException e) {}
		}
		return flag;
	}

	public int nameCheck(memberTO to){
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   int flag = 0;
	   try {
	      conn = dataSource.getConnection();
	      String sql = "select count(*) count from member where nickname like ?";
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, to.getNickname());      
	      rs = pstmt.executeQuery();
	      if(rs.next()) {
	         flag = rs.getInt("count");
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
	
//	public ArrayList<memberTO> memberList(){
//	    Connection conn = null;
//	    PreparedStatement pstmt = null;
//	    ResultSet rs = null;
//	    ArrayList<memberTO> lists = new ArrayList<memberTO>();
//	    try {
//	       conn=this.dataSource.getConnection();
//	       String sql="select id, password, nickname, email, gender,phone, introduce, picture, allview, scrapseq from member";
//	       pstmt = conn.prepareStatement(sql);
//	       rs = pstmt.executeQuery();
//	       while(rs.next()) {
//	          memberTO to = new memberTO();
//	          to.setId(rs.getString("id"));
//	          to.setPassword(rs.getString("password"));
//	          to.setNickname(rs.getString("nickname"));
//	          to.setEmail(rs.getString("email"));
//	          to.setGender(rs.getString("gender"));
//	          to.setPhone(rs.getString("phone"));
//	          to.setIntroduce(rs.getString("introduce"));
//	          to.setPicture(rs.getString("picture"));
//	          to.setAllview(rs.getInt("allview"));
//	          to.setScrapseq(rs.getString("scrapseq"));
//	          lists.add(to);
//	       }
//	    } catch (SQLException e) {
//	       // TODO Auto-generated catch block
//	       System.out.println("[boardList 에러] : "+e.getMessage());
//	    }
//	    return lists;
//	 }
//
//	public int memberModifyOk(memberTO to) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		int flag = 2; // 에러처리
//		try {
//			conn = dataSource.getConnection();
//			String sql = "update member set password=?, nickname=?, email=?, phone=?, introduce=?, picture=? where id like ?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, to.getPassword());
//			pstmt.setString(2, to.getNickname());
//			pstmt.setString(3, to.getEmail());
//			pstmt.setString(4, to.getPhone());
//			pstmt.setString(5, to.getIntroduce());
//			pstmt.setString(6, to.getPicture());
//			pstmt.setString(7, to.getId());
//			if (pstmt.executeUpdate() == 0) {
//				flag = 1;
//			} else if (pstmt.executeUpdate() == 1) {
//				flag = 0;
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			if (pstmt != null) try {pstmt.close();} catch (SQLException e) {}
//			if (conn != null) try {conn.close();} catch (SQLException e) {}
//		}
//		return flag;
//	}
//	public int memberDeleteOK(memberTO mto, recipeTO rcto, reviewTO rvto) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		int flag = 1;
//		try {
//			conn = this.dataSource.getConnection();
//			// 리뷰삭제
//			String sql = "delete from review where rvwriter=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, rvto.getRvwriter());
//			flag = pstmt.executeUpdate();
//			pstmt.close();
//			
//			sql = "delete from recipe where rcwriter=? ";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, rcto.getRcwriter());
//			flag = pstmt.executeUpdate();
//			pstmt.close();
//			// 회원정보
//			sql = "delete from member where id=? and password=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, mto.getId());
//			pstmt.setString(2, mto.getPassword());
//
//			if (pstmt.executeUpdate() == 1) {
//				flag = 0;
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			System.out.println("[memberdelete에러] : " + e.getMessage());
//		} finally {
//			if (pstmt != null) try {pstmt.close();} catch (SQLException e) {}
//			if (conn != null) try {conn.close();} catch (SQLException e) {}
//		}
//		return flag;
//	}
	 
	public int getAllview(String id) {
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 int allview = 0;			   
		 try {
			 conn = dataSource.getConnection();
		     String sql = "select hit from recipe where rcwriter like ?";
		     pstmt = conn.prepareStatement(sql);
		     pstmt.setString(1, id);      
		     rs = pstmt.executeQuery();
		     while(rs.next()) {
		        allview += rs.getInt("hit");
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
}
