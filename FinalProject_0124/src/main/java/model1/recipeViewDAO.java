package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class recipeViewDAO {
	private DataSource dataSource = null;
	
	public recipeViewDAO(DataSource dataSource) {
		// TODO Auto-generated constructor stub
		this.dataSource = dataSource;
	}
	
	public ArrayList<recipeViewTO> recipeViewList(recipeViewTO rto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		ArrayList<recipeViewTO> lists = new ArrayList<recipeViewTO>();
		
		try {
			conn = this.dataSource.getConnection(); 
			
			String sql = "update recipe set hit = hit + 1 where rcseq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rto.getRcseq());
			pstmt.executeUpdate();
			
			pstmt.close();
			
			sql = "select rcseq, m.nickname, subject, r.introduce rintroduce, m.introduce mintroduce, rfilename, url, tip, wdate, hit, rev, picture, allview from recipe r inner join member m on r.rcwriter = m.id where rcseq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rto.getRcseq());
							
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				recipeViewTO to = new recipeViewTO();
				to.setRcseq(rs.getString("rcseq"));
				to.setNickname(rs.getString("nickname"));
				to.setSubject(rs.getString("subject"));
				to.setRintroduce(rs.getString("rintroduce") == null ? "" : rs.getString("rintroduce").replaceAll("\n", "<br>"));
				to.setMintroduce(rs.getString("mintroduce"));
				to.setrfilename(rs.getString("rfilename"));
				to.setUrl(rs.getString("url"));
				to.setTip(rs.getString("tip"));
				to.setWdate(rs.getString("wdate"));
				to.setHit(rs.getString("hit"));
				to.setRev(rs.getString("rev"));
				to.setPicture(rs.getString("picture"));
				to.setAllview(rs.getString("allview"));
				
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
