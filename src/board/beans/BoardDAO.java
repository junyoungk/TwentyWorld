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

public class BoardDAO {
	
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery()
	
	// DAO 객체가 생성될때 Connection 도 생성된다.
	public BoardDAO() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TEAM20", "TIGER20");
			System.out.println("boardDAO 생성, 데이터 베이스 연결!");
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
		public Board[] createArray(ResultSet rs) throws SQLException{
			Board[] arr = null;
			
			ArrayList<Board> list = new ArrayList<Board>();
			
			while(rs.next()) {
				int uid = rs.getInt("board_id");
				String category = rs.getString("board_category");
				String name = rs.getString("user_name");
				String subject = rs.getString("board_subject");
				int viewcnt = rs.getInt("board_viewcnt");
				Date d = rs.getDate("board_regdate");

				String regDate = "";
				if(d != null){
					regDate = new SimpleDateFormat("yyyy-MM-dd").format(d);
					}
				
				Board dto = new Board();
				dto.setBoard_regdate(regDate);
				dto.setBoard_id(uid);
				dto.setBoard_category(category);
				dto.setBoard_subject(subject);
				dto.setBoard_viewcnt(viewcnt);
				dto.setWriteName(name);
				list.add(dto);
				
			} // end while
			
			int size = list.size();
			
			if(size == 0) return null;
			
			arr = new Board[size];
			
			list.toArray(arr);
		
			return arr;
		}
		public Board [] select() throws SQLException{
			Board [] arr = null;
			
			try {
				pstmt = conn.prepareStatement("SELECT b.board_id, b.board_category, u.user_name, b.board_subject, "
						+ "b.board_viewcnt, b.board_regdate FROM board b, users u "
						+ "WHERE b.board_writeuid = u.user_uid ORDER BY b.board_id DESC");
				rs = pstmt.executeQuery();
				
				arr = createArray(rs);
			} finally {
				close();
			}
			return arr;
			
		}
		
		public Board[] selectByUid(int board_id) throws SQLException{
			int cnt = 0;
			Board[] arr = null;
			
			ArrayList<Board> list = new ArrayList<Board>();
			
			try {
				conn.setAutoCommit(false);
				
				pstmt = conn.prepareStatement("UPDATE board SET board_viewcnt = board_viewcnt + 1 WHERE board_id = ?");
				pstmt.setInt(1, board_id);
				cnt = pstmt.executeUpdate();
				
				pstmt.close();
				
				pstmt = conn.prepareStatement("SELECT b.board_subject, u.user_name, b.board_regdate, b.board_content, b.board_category, b.board_img, b.board_viewcnt " + 
						"FROM board b , users u " + 
						"WHERE b.board_writeuid = u.user_uid AND b.board_id = ?");
				pstmt.setInt(1, board_id);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					String subject = rs.getString("board_subject");
					String name = rs.getString("user_name");
					Date d = rs.getDate("board_regdate"); 
					
					String regDate = "";
					if(d != null){
						regDate = new SimpleDateFormat("yyyy-MM-dd").format(d);
						}
					String content = rs.getString("board_content");
					String category = rs.getString("board_category");
					String img = rs.getString("board_img");
					int viewcnt = rs.getInt("board_viewcnt");
					
					Board dto = new Board();
					dto.setBoard_subject(subject);
					dto.setWriteName(name);
					dto.setBoard_regdate(regDate);
					dto.setBoard_content(content);
					dto.setBoard_category(category);
					dto.setBoard_img(img);
					dto.setBoard_viewcnt(viewcnt);
					
					list.add(dto);
				}
				
				int size = list.size();
				
				if(size == 0) return null;
				
				arr = new Board[size];
				
				list.toArray(arr);
			} finally {
				close();
			}
			return arr;
		}
		
		public int insert(String subject, String content, String category, int uid) throws SQLException{
			int cnt = 0;
			
			int authorize = 0;
			
			if(uid == 1) authorize = 3000;
			else authorize = 1;
			
			try {			
				pstmt = conn.prepareStatement("INSERT INTO board VALUES (board_SEQ.nextval, sysdate, ?, ?, '', ?, 0, ?, ?)");
				pstmt.setString(1, subject);
				pstmt.setString(2, content);
//				pstmt.setString(3, img);
				pstmt.setInt(3, uid);
				pstmt.setInt(4, authorize);
				pstmt.setString(5, category);
				
				cnt = pstmt.executeUpdate();
				
			} finally {
				close();			
			}

			return cnt;
		}
		
		public int insertImg(int uid, String img) throws SQLException{
			int cnt= 0;
			
			try {
				pstmt = conn.prepareStatement("UPDATE board SET board_img = ? WHERE board_id = ?");
				pstmt.setString(1, img);
				pstmt.setInt(2, uid);
				
				cnt = pstmt.executeUpdate();
				
			} finally {
				close();
			}
			
			return cnt;
		};
} //BoardDAO











