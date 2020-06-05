package board.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import board.beans.Board;

public class ReplyDAO {
	
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery()
	
	// DAO 객체가 생성될때 Connection 도 생성된다.
		public ReplyDAO() {
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TEAM20", "TIGER20");
				System.out.println("ReplyDAO 생성, 데이터 베이스 연결!");
			} catch(Exception e) {
				e.printStackTrace();
			}		
		} // 생성자
		
		// DB 자원 반납 메소드,
			public void close() throws SQLException {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
		} // end close()
			
			// ResultSet --> DTO 배열로 리턴
			public ReplyDTO[] createArray(ResultSet rs) throws SQLException{
				ReplyDTO[] arr = null;
				
				ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();
				
				while(rs.next()) {
					int reply_id = rs.getInt("reply_id");
					String user_name = rs.getString("user_name");
					String reply_comment = rs.getString("reply_comment");
					int reply_boarderid = rs.getInt("reply_boarderid");
					Date d = rs.getDate("reply_regdate");
					String reply_regdate = "";
					if(d != null){
						reply_regdate = new SimpleDateFormat("yyyy-MM-dd").format(d);
						}
					
					ReplyDTO rdto = new ReplyDTO();
					rdto.setReply_id(reply_id);
					rdto.setWriteName(user_name);
					rdto.setReply_boarderid(reply_boarderid);
					rdto.setReply_comment(reply_comment);
					rdto.setReply_regdate(reply_regdate);
					list.add(rdto);
					
				} // end while
				
				arr = new ReplyDTO[list.size()];
				list.toArray(arr);
				return arr;
			}
		
			
			  public ReplyDTO[] replyselect() throws SQLException{
				  ReplyDTO[] replyarr = null;
				  String SQL = 
				"SELECT r.reply_id,r.reply_boarderid, u.user_name, r.reply_comment, r.reply_regdate FROM reply r,board b, users u " + 
				"WHERE b.board_id = r.reply_boarderid AND u.USER_UID = r.REPLY_USERUID";
				  try {
					  pstmt = conn.prepareStatement(SQL);
					  rs =pstmt.executeQuery();
					  
					  replyarr = createArray(rs);
				  }finally {
						close();
					}
				  
				  return replyarr;
			  }
			
			
	public int insert(int reply_boarderid, int reply_useruid, String reply_comment) throws SQLException{
		int cnt = 0;
		String SQL = "INSERT INTO reply VALUES(reply_SEQ.nextval,?,?,?,sysdate)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, reply_boarderid);
			pstmt.setInt(2, reply_useruid);
			pstmt.setString(3, reply_comment);
			
			cnt += pstmt.executeUpdate();
			
		} finally {
			close();			
		}

		return cnt;
	}
	
	  public ReplyDTO[] selectReplyByBoardid(int board_id) throws SQLException{
	  ReplyDTO[] arr = null; 
	  
	  ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();
	  
	  String SQL = "SELECT r.reply_id, r.REPLY_BOARDERID, u.user_uid, u.user_name, r.reply_comment, r.reply_regdate"+
	  " FROM reply r,board b, users u "+
	  "WHERE r.reply_boarderid = ? AND u.USER_UID = r.REPLY_USERUID AND b.BOARD_ID = r.REPLY_BOARDERID"; 
	  try {
		  pstmt = conn.prepareStatement(SQL); 
		  pstmt.setInt(1, board_id);
		  rs = pstmt.executeQuery();
		  
		  while(rs.next()) {
			  int reply_id =rs.getInt("reply_id");
			  String user_name = rs.getString("user_name");
			  int user_uid = rs.getInt("user_uid");
			  String reply_comment = rs.getString("reply_comment");
			  Date reply_regdate = rs.getDate("reply_regdate"); 
				
				String regDate = "";
				if(reply_regdate != null){
					regDate = new SimpleDateFormat("yyyy-MM-dd").format(reply_regdate);
					}
				ReplyDTO Replydto = new ReplyDTO();
				Replydto.setReply_id(reply_id);
				Replydto.setWriteName(user_name);
				Replydto.setReply_useruid(user_uid);
				Replydto.setReply_comment(reply_comment);
				Replydto.setReply_regdate(regDate);

				list.add(Replydto);
			}
			int size = list.size();
			if (size == 0)
				return null;
			arr = new ReplyDTO[size];
			list.toArray(arr);
		} finally {
			close();
		}
		return arr;
	}
	  
	public int deleteByReplyUid(int reply_id, int reply_boarderid) throws SQLException {
		int cnt = 0;
		String SQL = "DELETE FROM reply WHERE reply_id = ? AND reply_boarderid = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, reply_id);
			pstmt.setInt(2, reply_boarderid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
}