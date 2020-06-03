package board.beans;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

// DAO : Data Access Object
//   DB 에 접속하여 트랜잭션을 수행하는 객체

// 다루는 데이터 소스의 종류에 따라 DAO는 여러개 정의 사용 가능

public class FileDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery()
	
	// DAO 객체가 생성될때 Connection 도 생성된다.
	public FileDAO() {
		
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
	
	//rs --> dto 배열로 리턴
	public FileDTO[] createArray(ResultSet rs) throws SQLException{
		FileDTO[] arr = null;
		List<FileDTO> list = new ArrayList<FileDTO>();
		
		while(rs.next()) {
			int uid = rs.getInt("bi_uid");
			String source = rs.getString("bi_source");
			String file = rs.getString("bi_file");
			
			FileDTO dto = new FileDTO(uid, source, file);
			list.add(dto);
		}
		
		arr = new FileDTO[list.size()];
		list.toArray(arr);
		return arr;
	}
	
	//특정 글의 첨부파일(들) SELECT
	public FileDTO[] selectFileByWrUid(int board_id) throws SQLException{
		FileDTO[] arr = null;
		
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement("SELECT bi_uid, bi_source, bi_file FROM boardImg WHERE BOARD_ID = ? ORDER BY bi_uid DESC");
			pstmt.setInt(1, board_id);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
			conn.commit();
		} finally {
			close();
		}
		
		return arr;
	}
	
	//특정 파일의 첨부파일(들) SELECT
		public FileDTO[] selectByUid(int uid) throws SQLException{
			FileDTO[] arr = null;
			
			try {
				conn.setAutoCommit(false);
				pstmt = conn.prepareStatement("SELECT bi_uid, bi_source, bi_file FROM boardImg WHERE bi_uid = ?");
				pstmt.setInt(1, uid);
				rs = pstmt.executeQuery();
				
				arr = createArray(rs);
				conn.commit();
			} finally {
				close();
			}
			return arr;
	}
		
		
	//특정 글의 첨부 파일(들) 삭제
	//db 삭제, 파일 삭제
	public int deleteByWrUid(int wrUid, HttpServletRequest request) throws SQLException{
		int cnt = 0;
		
		FileDTO[] arr = null;
		
		
		try {
			conn.setAutoCommit(false);
			// 1. 물리적인 파일 삭제
			pstmt = conn.prepareStatement("");
			pstmt.setInt(1, wrUid);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
			
			// 물리적인 경로 가져오기
			ServletContext context = request.getServletContext();
			String saveDirectory = context.getRealPath("upload");
			
			for(FileDTO dto : arr ) {
				File f = new File(saveDirectory, dto.getFile());
				System.out.println("삭제시도 --> " + f.getAbsolutePath());
				
				if(f.exists()) {
					if(f.delete()) { // 파일 삭제
						System.out.println("삭제 성공");
					} else {
						System.out.println("삭제 실패");
					}
				} else {
					System.out.println("파일이 존재하지 않습니다.");
				}
			}
			
			// 2. test_file 테이블 내용 삭제
			pstmt.close();
			rs.close();
			
			pstmt = conn.prepareStatement("");
			pstmt.setInt(1, wrUid);
			cnt = pstmt.executeUpdate();
			System.out.println("첨부파일" + cnt + "개 삭제");
			conn.commit();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	// 여러개의 bf_uid 의 파일(들) 제거
	public int deleteByUid(int [] uids, HttpServletRequest request) throws SQLException{
		int cnt = 0;
		// 101, 204, 319 번 파일을 지우려면
		// DELETE FROM test_file WHERE bf_uid = IN(101, 204, 319) <-- pstmt 로 불가능!
		
		try {
			conn.setAutoCommit(false);
			// 1. 물리적인 파일 삭제
			StringBuffer sql= new StringBuffer("SELECT bf_file FROM test_file WHERE bf_uid IN(");
			for(int uid : uids) {
				sql.append(uid + ",");
			}
			sql.deleteCharAt(sql.lastIndexOf(","));
			sql.append(")");

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			
			// 물리적인 경로 획득
			ServletContext context = request.getServletContext();
			String saveDirectory = context.getRealPath("upload");
			
			while(rs.next()) {
				String fileName = rs.getString("bf_file"); // 삭제할 파일명
				File f = new File(saveDirectory, fileName);
				
				System.out.println("삭제시도 --> " + f.getAbsolutePath());
				
				if(f.exists()) {
					if(f.delete()) { // 파일 삭제
						System.out.println("삭제 성공");
					} else {
						System.out.println("삭제 실패");
					}
				} else {
					System.out.println("파일이 존재하지 않습니다.");
				}
				
			}
			
			
			// 2. test_file 삭제
			sql = new StringBuffer("DELETE FROM test_file WHERE bf_uid IN (");
			for(int uid : uids) {
				sql.append(uid + ",");
			}
			sql.deleteCharAt(sql.lastIndexOf(","));
			sql.append(")");
			
			System.out.println("파일삭제합니다: " + sql.toString());
			
			cnt = stmt.executeUpdate(sql.toString());
			
			
			conn.commit();
		} finally {
			close();
		}	
		return cnt;
	}
	
	// 특정 글에 첨부파일(들) 추가
	public int insert(int wrUid, 
			List<String> original,
			List<String> file
			) throws SQLException{
		int cnt = 0;
		
		// 첨부파일 정보 추가(저장)
		pstmt = conn.prepareStatement("");
		for(int i =0; i<original.size(); i++) {
			pstmt.setString(1, original.get(i));
			pstmt.setString(2, file.get(i));
			pstmt.setInt(3, wrUid);
			cnt += pstmt.executeUpdate();
		}
		
		return cnt;
	}
}










