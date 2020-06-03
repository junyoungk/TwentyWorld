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
					int reply_boarderid = rs.getInt("reply_boarderid");
					int reply_useruid = rs.getInt("reply_useruid");
					String writeid = rs.getString("user_id");
					String reply_comment = rs.getString("reply_comment");
					Date d = rs.getDate("reply_regdate");
					String reply_regdate = "";
					if(d != null){
						reply_regdate = new SimpleDateFormat("yyyy-MM-dd").format(d);
						}
					
					ReplyDTO dto = new ReplyDTO();
					dto.setReply_useruid(reply_useruid);
					dto.setReply_boarderid(reply_boarderid);
					dto.setReply_comment(reply_comment);
					dto.setWriteId(writeid);
					dto.setReply_regdate(reply_regdate);
					dto.setWriteId(writeid);
					list.add(dto);
					
				} // end while
				
				arr = new ReplyDTO[list.size()];
				list.toArray(arr);
				return arr;
			}
		
	public int insert(int reply_boarderid, int reply_useruid, String reply_comment) throws SQLException{
		int cnt = 0;
		String SQL = "INSERT INTO reply (reply_id,reply_boarderid,reply_useruid,reply_comment,reply_regdate)"
				+ "VALUES(reply_SEQ.nextval,?,?,?,sysdate)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, reply_boarderid);
			pstmt.setInt(2, reply_useruid);
			pstmt.setString(3, reply_comment);
			
			cnt = pstmt.executeUpdate();
			
		} finally {
			close();			
		}

		
		return cnt;
	}
			
	public ReplyDTO[] Replyselect() throws SQLException{
		ReplyDTO[] arr = null;
		String SQL = "SELECT b.board_id, u.user_name, r.reply_comment FROM reply r,board b, users u";
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
			
		}finally {
			close();
		}
		
		return arr;
		}
	/*
	 * public ReplyDTO[] selectReplyByBoardid(int board_id) throws SQLException{
	 * ReplyDTO[] arr = null; String SQL =
	 * "SELECT reply_id,reply_comment,reply_regdate FROM reply where reply_boarderid = ?"
	 * ; try { pstmt = conn.prepareStatement(SQL); pstmt.setInt(1, board_id); rs =
	 * pstmt.executeQuery(); arr = createArray(rs); } finally { close(); } return
	 * arr; }
	 */
}





















