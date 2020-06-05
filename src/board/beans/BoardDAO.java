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
import java.util.List;

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
				int rownum = rs.getInt("rownum");
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
				dto.setRownum(rownum);
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
				pstmt = conn.prepareStatement("SELECT rownum, b.* " + 
						"FROM (SELECT b.board_id, b.board_category, u.user_name, b.board_subject, b.board_viewcnt, b.board_regdate " + 
						"FROM board b, users u " + 
						"WHERE b.board_writeuid = u.user_uid " + 
						"ORDER BY b.board_id ASC) b " + 
						"ORDER BY ROWNUM desc");
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
				
				pstmt = conn.prepareStatement("SELECT b.board_id, b.board_subject, u.user_name, b.board_regdate, b.board_content, b.board_category, b.board_viewcnt " + 
						"FROM board b , users u " + 
						"WHERE b.board_writeuid = u.user_uid AND b.board_id = ?");
				pstmt.setInt(1, board_id);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					int bid = rs.getInt("board_id");
					String subject = rs.getString("board_subject");
					String name = rs.getString("user_name");
					Date d = rs.getDate("board_regdate"); 
					
					String regDate = "";
					if(d != null){
						regDate = new SimpleDateFormat("yyyy-MM-dd").format(d);
						}
					String content = rs.getString("board_content");
					String category = rs.getString("board_category");
					int viewcnt = rs.getInt("board_viewcnt");
					
					Board dto = new Board();
					dto.setBoard_id(bid);
					dto.setBoard_subject(subject);
					dto.setWriteName(name);
					dto.setBoard_regdate(regDate);
					dto.setBoard_content(content);
					dto.setBoard_category(category);
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
		
		public Board[] selectBySubjectPre(int board_id) throws SQLException{
			Board[] arr = null;
			String subject = "";
			ArrayList<Board> list = new ArrayList<Board>();
			try {
				pstmt = conn.prepareStatement("SELECT board_id, board_subject " + 
						"FROM board " + 
						"WHERE board_id = (SELECT max(board_id) FROM board WHERE board_id < ?)");
				pstmt.setInt(1, board_id);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					subject = rs.getString("board_subject");
					int bid = rs.getInt("board_id");
					
					Board dto = new Board();
					dto.setBoard_subject(subject);
					dto.setBoard_id(bid);
					
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
		
		public Board[] selectBySubjectNext(int board_id) throws SQLException{
			Board[] arr = null;
			String subject = "";
			int bid = 0;
			ArrayList<Board> list = new ArrayList<Board>();
			try {
				pstmt = conn.prepareStatement("SELECT board_id, board_subject " + 
						"FROM board " + 
						"WHERE board_id = (SELECT min(board_id) FROM board WHERE board_id > ?)");
				pstmt.setInt(1, board_id);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					subject = rs.getString("board_subject");
			
					bid = rs.getInt("board_id");

					Board dto = new Board();
					dto.setBoard_subject(subject);
					dto.setBoard_id(bid);
					
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
		
		public int insert(String subject, String content, String category, int uid,
				List<String> originalFileNames,
				List<String> fileSystemNames
				) throws SQLException{
			int cnt = 0;
			
			int authorize = 0;
			int board_uid = 0;
			
			if(category.equals("자유") || category.equals("기타")) authorize = 1;
			else if(category.equals("공지") || category.equals("행사")) authorize = 3000;
			else authorize = 3000;
			
			try {		
				conn.setAutoCommit(false);
				String [] generatedCols = {"board_id"};
				
				pstmt = conn.prepareStatement("INSERT INTO board VALUES (board_SEQ.nextval, sysdate, ?, ?, ?, 0, ?, ?)", generatedCols);
				pstmt.setString(1, subject);
				pstmt.setString(2, content);
				pstmt.setInt(3, uid);
				pstmt.setInt(4, authorize);
				pstmt.setString(5, category);
				
				cnt = pstmt.executeUpdate();
				
				rs = pstmt.getGeneratedKeys();
				if(rs.next()) {
					board_uid = rs.getInt(1); 
				}
				
				pstmt.close();
				// 첨부파일(들) 정보 테이블에 INSERT 하기
				pstmt = conn.prepareStatement("INSERT INTO boardImg (bi_uid, bi_source, bi_file, board_id) VALUES(boardImg_seq.nextval, ?, ?, ?)");
				for(int i = 0; i<originalFileNames.size(); i++) {
					pstmt.setString(1, originalFileNames.get(i));
					pstmt.setString(2, fileSystemNames.get(i));
					pstmt.setInt(3, board_uid);
					pstmt.executeUpdate();
				}
				conn.commit();
			} finally {
				close();			
			}
			return cnt;
		}
		
		public int update(int uid, String subject, String content) throws SQLException{
			int cnt = 0;
			
			try {
				conn.setAutoCommit(false);
				pstmt = conn.prepareStatement("UPDATE board SET board_subject = ?, board_content = ? WHERE board_id = ?");
				pstmt.setString(1, subject);
				pstmt.setString(2, content);
				pstmt.setInt(3, uid);
				
				cnt = pstmt.executeUpdate();
				conn.commit();
			} finally {
				close();
			}
			return cnt;
		}
		
		public int deleteByUid(int uid) throws SQLException{
			int cnt = 0;
			
			try {
				conn.setAutoCommit(false);
				pstmt = conn.prepareStatement("DELETE FROM board WHERE board_id = ?");
				pstmt.setInt(1, uid);
				cnt = pstmt.executeUpdate();
				conn.commit();
			} finally {
				close();
			}
			return cnt;
		}
		
		public Board[] selectByCategory(String bCategory) throws SQLException{
			Board[] arr = null;
			
			List<Board> list = new ArrayList<Board>();
			
			try {
				pstmt = conn.prepareStatement("SELECT rownum, b.* FROM (SELECT b.board_id, b.board_category, u.user_name, b.board_subject, b.board_viewcnt, b.board_regdate " + 
						"FROM board b, users u " + 
						"WHERE b.board_writeuid = u.user_uid " + 
						"ORDER BY b.board_id ASC) b " + 
						"WHERE board_category = ? " + 
						"ORDER BY ROWNUM desc");
				pstmt.setString(1,bCategory);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					int rownum = rs.getInt("rownum");
					int bid = rs.getInt("board_id");
					String subject = rs.getString("board_subject");
					String name = rs.getString("user_name");
					Date d = rs.getDate("board_regdate"); 
					
					String regDate = "";
					if(d != null){
						regDate = new SimpleDateFormat("yyyy-MM-dd").format(d);
						}
					String category = rs.getString("board_category");
					int viewcnt = rs.getInt("board_viewcnt");
					
					Board dto = new Board();
					dto.setRownum(rownum);
					dto.setBoard_id(bid);
					dto.setBoard_subject(subject);
					dto.setWriteName(name);
					dto.setBoard_regdate(regDate);
					dto.setBoard_category(category);
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
		
		public Board[] selectBySearch(String col, String word) throws SQLException{
			Board[] arr = null;
			
			
			try {
					if(col.equals("none")) {
					pstmt = conn.prepareStatement("SELECT rownum, b.* " + 
							"FROM (SELECT b.board_id, b.board_category, u.user_name, b.board_subject, b.board_viewcnt, b.board_regdate " + 
							"FROM board b, users u " + 
							"WHERE b.board_writeuid = u.user_uid " + 
							"ORDER BY b.board_id ASC) b " + 
							"WHERE board_subject LIKE ? OR user_name LIKE ? " + 
							"ORDER BY ROWNUM desc");
						pstmt.setString(1, "%"+word+"%");
						pstmt.setString(2, "%"+word+"%");
						rs = pstmt.executeQuery();
	
						arr = createArray(rs);
					
					} else if(col.equals("name")) {
						pstmt = conn.prepareStatement("SELECT rownum, b.* " + 
								"FROM (SELECT b.board_id, b.board_category, u.user_name, b.board_subject, b.board_viewcnt, b.board_regdate " + 
								"FROM board b, users u " + 
								"WHERE b.board_writeuid = u.user_uid " + 
								"ORDER BY b.board_id ASC) b " + 
								"WHERE user_name LIKE ? " + 
								"ORDER BY ROWNUM desc");
						pstmt.setString(1, "%"+word+"%");
						rs = pstmt.executeQuery();
						arr = createArray(rs);
					} else if(col.equals("subject")) {
						pstmt = conn.prepareStatement("SELECT rownum, b.* " + 
								"FROM (SELECT b.board_id, b.board_category, u.user_name, b.board_subject, b.board_viewcnt, b.board_regdate " + 
								"FROM board b, users u " + 
								"WHERE b.board_writeuid = u.user_uid " + 
								"ORDER BY b.board_id ASC) b " + 
								"WHERE board_subject LIKE ? " + 
								"ORDER BY ROWNUM desc");
						pstmt.setString(1, "%"+word+"%");
						rs = pstmt.executeQuery();
						arr = createArray(rs);
					}
			} catch(SQLException e) {
				e.printStackTrace();
			}
			return arr;
		}
		
		public Board[] SelectByPages(int from, int pageRows) throws SQLException{
			Board[] arr = null;
			int cnt = 0;
			int curPage = 1;   // 현재 페이지 (디폴트 1 page)
			int writePages = 10;   // 한 [페이징] 에 몇개의 '페이지' 를 표현할 것인가?
			int totalPage = 0;	 // 총 몇 '페이지' 분량인가?
			
			List<Board> list = new ArrayList<Board>();
			try {
			pstmt = conn.prepareStatement("SELECT count(*) FROM board");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				cnt = rs.getInt(1);   // count(*), 전체 글의 개수
				
			rs.close();
			pstmt.close();
			
			totalPage = (int)Math.ceil(cnt / (double)pageRows); // 총 몇페이지 분량
			
			int fromRow = (curPage - 1) * pageRows + 1;  // 몇번째 row 부터?
					
			pstmt = conn.prepareStatement("SELECT * FROM (" + 
					"SELECT rownum AS rnum , b.* " + 
					"FROM (SELECT b.board_id, b.board_category, u.user_name, b.board_subject, b.board_viewcnt, b.board_regdate FROM board b, users u WHERE b.board_writeuid = u.user_uid ORDER BY board_id DESC) b " + 
					") " + 
					"WHERE rnum >= ? AND rnum < ?");
			pstmt.setInt(1, fromRow);  
			pstmt.setInt(2, fromRow + pageRows);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rownum = rs.getInt("rownum");
				int bid = rs.getInt("board_id");
				String subject = rs.getString("board_subject");
				String name = rs.getString("user_name");
				Date d = rs.getDate("board_regdate"); 
				
				String regDate = "";
				if(d != null){
					regDate = new SimpleDateFormat("yyyy-MM-dd").format(d);
					}
				String category = rs.getString("board_category");
				int viewcnt = rs.getInt("board_viewcnt");
				
				Board dto = new Board();
				dto.setRownum(rownum);
				dto.setBoard_id(bid);
				dto.setBoard_subject(subject);
				dto.setWriteName(name);
				dto.setBoard_regdate(regDate);
				dto.setBoard_category(category);
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
} //BoardDAO









