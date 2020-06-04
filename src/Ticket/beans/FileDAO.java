package Ticket.beans;

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
			System.out.println("WriteDAO 생성, 데이터 베이스 연결!");
		} catch(Exception e) {
			e.printStackTrace();
			// throw e;
		}		
		
	} // 생성자

	// DB 자원 반납 메소드,
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	} // end close()

	// 특정 글(wr_uid) 에 첨부파일(들) 추가
	// update, insert  에 사용
	public int insert(int wrUid, 
			List<String> originalFileNames, // 원본 파일명(들)
			List<String> fileSystemNames  // 저장된 파일명(들)
			) throws SQLException {
		int cnt = 0;
		
		try {			
			// 첨부파일 정보 추가(저장)하기
			pstmt = conn.prepareStatement(D.SQL_FILE_INSERT);
			for(int i = 0; i < originalFileNames.size(); i++) {			
				pstmt.setString(1, originalFileNames.get(i));
				pstmt.setString(2, fileSystemNames.get(i));
				pstmt.setInt(3, wrUid);
				cnt += pstmt.executeUpdate();
			} // end for
		} finally {
			close();
		} // end try
		
		return cnt;
	} // end insert()
	

	//---------------------------------------------------------------
	// ResultSet --> DTO 배열로 리턴
	public FileDTO [] createArray(ResultSet rs) throws SQLException {
		FileDTO [] arr = null;
		List<FileDTO> list = new ArrayList<FileDTO>();
		
		while(rs.next()) {
			int uid = rs.getInt("bf_uid");
			String source = rs.getString("bf_source");
			String file = rs.getString("bf_file");
			
			FileDTO dto = new FileDTO(uid, source, file);
			list.add(dto);
		} // end while
		
		arr = new FileDTO[list.size()];
		list.toArray(arr);
		return arr;
	}  // end createArray()
	
	// 특정 글 (wr_uid) 의 첨부파일(들) SELECT
	public FileDTO [] selectFilesByWrUid(int wrUid) throws SQLException{
		FileDTO [] arr = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_FILE_SELECT);
			pstmt.setInt(1, wrUid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}		
		return arr;
	} // end selectFilesByWrUid()
	
	// 특정 파일 (bf_uid) 의 첨부파일 한개 SELECT
	public FileDTO [] selectByUid(int uid) throws SQLException{
		FileDTO [] arr = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_FILE_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}		
		return arr;
	} // end selectFilesByWrUid
	
	//---------------------------------------------------------------
	// 물리적인 파일(들) 삭제
	public void deleteFiles(FileDTO [] arr, HttpServletRequest request) {
		if(arr == null || arr.length == 0 || request == null) return;
		
		// 물리적인 경로
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload");
		
		for(FileDTO dto : arr) {
			File f = new File(saveDirectory, dto.getFile());
			System.out.println("삭제시도--> " + f.getAbsolutePath());
			
			if(f.exists()) {
				if(f.delete()) {  // 삭제!
					System.out.println("삭제 성공");
				} else {
					System.out.println("삭제 실패");
				}
			} else {
				System.out.println("파일이 존재하지 않습니다.");		
			} // end if
			
		} // end for
	} // end deleteFiles()
	
	// 특정 글 (wr_uid) 의 첨부파일(들) 삭제
	// DB 삭제, 파일 삭제
	public int deleteByWrUid(int wrUid, HttpServletRequest request) throws SQLException{
		int cnt = 0;
		
		FileDTO [] arr = null;
		
		try {
			// 1. 물리적인 파일 삭제
			pstmt = conn.prepareStatement(D.SQL_FILE_SELECT);
			pstmt.setInt(1,  wrUid);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
			deleteFiles(arr, request); // 파일 삭제
			
			// 2. test_file 테이블 내용 삭제
			pstmt.close();
			rs.close();
			
			pstmt = conn.prepareStatement(D.SQL_FILE_DELETE_BY_WRUID);
			pstmt.setInt(1, wrUid);
			cnt = pstmt.executeUpdate();
			System.out.println("첨부파일 " + cnt + "개 삭제");
			
		} finally {
			close();
		}
		
		return cnt;
	} // end deleteByWrUid()
	
	// 여러개의 bf_uid 의 파일(들) 제거
	public int deleteByUid(int [] uids, HttpServletRequest request) throws SQLException{
		if(uids == null || uids.length == 0) return 0;  

		int cnt = 0;
		
		// 101, 204, 319 번 파일을 지우려면? 
		// DELETE FROM test_file WHERE bf_uid = 101 OR bf_uid = 204 OR bf_uid = 319
		// DELETE FROM test_file WHERE bf_uid IN (101, 204, 319)
		try {
			// 1. 물리적인 파일 삭제
			StringBuffer sql = new StringBuffer("SELECT * FROM test_file WHERE bf_uid IN (");
			for(int uid : uids) {
				sql.append(uid + ",");
			}
			sql.deleteCharAt(sql.lastIndexOf(","));  // 맨 끝의 콤마 삭제
			sql.append(")");
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			
			FileDTO [] arr = createArray(rs);	
			deleteFiles(arr, request); // 파일 삭제
			
			
			// 2. test_file 테이블 삭제
			sql = new StringBuffer("DELETE FROM test_file WHERE bf_uid IN (");
			for(int uid : uids) {
				sql.append(uid + ",");
			}
			sql.deleteCharAt(sql.lastIndexOf(","));  // 맨 끝의 콤마 삭제
			sql.append(")");
			
			System.out.println("파일삭제: " + sql);
			
			cnt = stmt.executeUpdate(sql.toString());
			
		} finally {
			close();
		}
		
		return cnt;
	} // end deleteByUid()
	
	
	
	
} // end DAO










