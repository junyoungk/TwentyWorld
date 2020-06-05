package attraction.beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import attraction.common.AttrD;

// DAO : Data Access Object
//   DB 에 접속하여 트랜잭션을 수행하는 객체

// 다루는 데이터 소스의 종류에 따라 DAO는 여러개 정의 사용 가능

public class AttrWriteDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery()
	
	// DAO 객체가 생성될때 Connection 도 생성된다.
	public AttrWriteDAO() {
		
		try {
			Class.forName(AttrD.DRIVER);
			conn = DriverManager.getConnection(AttrD.URL, AttrD.USERID, AttrD.USERPW);
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
	
	// 새글 작성 <-- DTO
	public int insert(AttrWriteDTO dto) throws SQLException {
		int attr_max = dto.getAttr_max();
		int attr_time = dto.getAttr_time();
		int attr_price = dto.getAttr_price();
		String attr_content = dto.getAttr_content();
		String attr_name = dto.getAttr_name();
		
		int attr_location = dto.getAttr_location();
		int attr_min_age = dto.getAttr_min_age();
		int attr_max_age = dto.getAttr_max_age();
		int attr_min_height = dto.getAttr_min_height();
		int attr_max_height = dto.getAttr_max_height();
		int attr_authorize = dto.getAttr_authorize();
		String attr_regDate = dto.getAttr_regDate();
		String attr_img = dto.getAttr_img();
		String attr_cardimg = dto.getAttr_cardimg();

		int cnt = this.insert(attr_max, attr_time, attr_price, attr_content, attr_name,
				attr_location, attr_min_age, attr_max_age, attr_min_height, attr_max_height, attr_authorize, 
				attr_img, attr_cardimg);
		return cnt;
	}
	
	// 새글 작성 <-- 제목, 내용, 작성자 
	public int insert(int attr_max, int attr_time, int attr_price, 
			String attr_content, String attr_name, int attr_location, 
			int attr_min_age, int attr_max_age, int attr_min_height, 
			int attr_max_height, int attr_authorize, 
			String attr_img, String attr_cardimg) throws SQLException {
		int cnt = 0;
		
		try {			
			System.out.println(AttrD.SQL_WRITE_INSERT + "으악");
			pstmt = conn.prepareStatement(AttrD.SQL_WRITE_INSERT);
			System.out.println(AttrD.SQL_WRITE_INSERT + "으악2");
			pstmt.setInt(1, attr_max);
			pstmt.setInt(2, attr_time);
			pstmt.setInt(3, attr_price);
			
			pstmt.setString(4, attr_content);
			pstmt.setString(5, attr_name);
			pstmt.setInt(6, attr_location);
			
			pstmt.setInt(7, attr_min_age);
			pstmt.setInt(8, attr_max_age);
			
			pstmt.setInt(9, attr_min_height);
			pstmt.setInt(10, attr_max_height);
			
			pstmt.setInt(11, attr_authorize);
			//pstmt.setString(12, attr_regdate);
			pstmt.setString(12, attr_img);
			pstmt.setString(13, attr_cardimg);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();			
		}

		return cnt;
	}
	
	// ResultSet --> DTO 배열로 리턴
	public AttrWriteDTO [] createArray(ResultSet rs) throws SQLException {
		AttrWriteDTO [] arr = null;  // DTO 배열
		
		ArrayList<AttrWriteDTO> list = new ArrayList<AttrWriteDTO>();
		
		while(rs.next()) {
			int attr_id = rs.getInt("attr_id");
			int attr_max = rs.getInt("attr_max");
			int attr_time = rs.getInt("attr_time");
			int attr_price = rs.getInt("attr_price");
			String attr_content = rs.getString("attr_content");
			String attr_name = rs.getString("attr_name");
			int attr_location = rs.getInt("attr_location");
			int attr_min_age = rs.getInt("attr_min_age");
			int attr_max_age = rs.getInt("attr_max_age");
			int attr_min_height = rs.getInt("attr_min_height");
			int attr_max_height = rs.getInt("attr_max_height");
			int attr_authorize = rs.getInt("attr_authorize");
			Date d = rs.getDate("attr_regDate");
			Time t = rs.getTime("attr_regDate");
			String attr_img = rs.getString("attr_img");
			String attr_cardimg = rs.getString("attr_cardimg");
			
			String attr_regdate = "";
			if(d != null){
				attr_regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			}
			AttrWriteDTO dto = new AttrWriteDTO(attr_id, attr_max, attr_time, attr_price, attr_content,
					attr_name, attr_location ,attr_min_age, attr_max_age,
					attr_min_height,attr_max_height,attr_authorize,
					attr_regdate, attr_img, attr_cardimg);
			dto.setAttr_regDate(attr_regdate);
			list.add(dto);
			
		} // end while
		
		int size = list.size();
		
		if(size == 0) return null;
		
		arr = new AttrWriteDTO[size];
		list.toArray(arr);  // List -> 배열		
		return arr;
	}
	
	// 전체 SELECT
	public AttrWriteDTO [] select() throws SQLException {
		AttrWriteDTO [] arr = null;
		
		try {
			System.out.println(AttrD.SQL_WRITE_SELECT);
			pstmt = conn.prepareStatement(AttrD.SQL_WRITE_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}		
		
		return arr;
	} // end select()
	
	// 특정 uid 의 글 내용 읽기, 조회수 증가
		public AttrWriteDTO [] readByUid(int attr_id) throws SQLException{
			System.out.println("readByUid 들어옴");
			AttrWriteDTO [] arr = null;
			
			try {
				conn.setAutoCommit(false);
				
				// 쿼리들 수행
				pstmt = conn.prepareStatement(AttrD.SQL_WRITE_SELECT_BY_UID);
				pstmt.setInt(1, attr_id);
				rs = pstmt.executeQuery();
				
				arr = createArray(rs);
				conn.commit();
				
			} catch(SQLException e) {
				conn.rollback();
				throw e;
			} finally {
				System.out.println("readByUid finally 들어옴");
				close();
			}
			
			return arr;
		} // end readByUid()
		
	public AttrWriteDTO [] selectByUid(int attr_id) throws SQLException {
		System.out.println("WriteDTO[] 까지 들어옴");
		AttrWriteDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(AttrD.SQL_WRITE_SELECT_BY_UID);
			pstmt.setInt(1, attr_id);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			System.out.println("WriteDTO[] 의 finally");
			close();
		}
		return arr;
	}
	

	// 특정 uid 의 글 수정 (제목, 내용)
	public int update( int attr_id, int attr_max, int attr_time, int attr_price, 
			String attr_content, String attr_name, int attr_location, 
			int attr_min_age, int attr_max_age, int attr_min_height, 
			int attr_max_height, int attr_authorize, 
			String attr_img, String attr_cardimg) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(AttrD.SQL_WRITE_UPDATE);
			pstmt.setInt(1, attr_max);
			pstmt.setInt(2, attr_time);
			pstmt.setInt(3, attr_price);
			
			pstmt.setString(4, attr_content);
			pstmt.setString(5, attr_name);
			pstmt.setInt(6, attr_location);
			
			pstmt.setInt(7, attr_min_age);
			pstmt.setInt(8, attr_max_age);
			
			pstmt.setInt(9, attr_min_height);
			pstmt.setInt(10, attr_max_height);
			
			pstmt.setInt(11, attr_authorize);
			pstmt.setString(12, attr_img);
			pstmt.setString(13, attr_cardimg);
			pstmt.setInt(14, attr_id);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}		
		
		return cnt;
	} // end update()
	
	// 특정 uid 글 삭제하기
	public int deleteByUid(int uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(AttrD.SQL_WRITE_DELETE_BY_UID);
			pstmt.setInt(1, uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}		
		return cnt;
	} // end deleteByUid()
	
	
	
	
	
	
} // end DAO










