package CKJY;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;



public class UserDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; // SELECT 결과, executeQuery()

	public UserDAO() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TEAM20", "TIGER20");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println();
			// throw e;
		}

	}

	public void close() throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	}

	public int login(String user_id, String user_pw) { // 로그인
		String SQL = "SELECT user_pw FROM users WHERE USER_ID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(user_pw)) {
					return 1; // 로그인 성공
				} else {
					return 0; // 로그인 실패
				}
			}
			return -1; // 아이디없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	 
	public int join(UserDTO user) { // 회원등록
		String SQL = "INSERT INTO USERS VALUES (user_SEQ.nextval, ?, ?, ?, ?, ?, ?, 1, ?,'-')";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUser_id());
			pstmt.setString(2, user.getUser_pw());
			pstmt.setString(3, user.getUser_name());
			pstmt.setString(4, user.getUser_gender());
			pstmt.setString(5, user.getUser_jumin());
			pstmt.setInt(6, user.getUser_age());
			pstmt.setString(7, user.getUser_email());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		   }	
		return -1;

}
	public int idCheckFunction(String user_id) { // 아이디 중복체크
		String SQL = "SELECT * FROM USERS WHERE user_id = ?";
				
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 0;
			} else {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	
	}
	
	public UserDTO [] createArray(ResultSet rs) throws SQLException {
		UserDTO [] arr = null;
		 
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		
		while(rs.next()) {
			int user_uid = rs.getInt("user_uid");
			String user_id = rs.getString("user_id");
			String user_pw = rs.getString("user_pw");
			String user_name = rs.getString("user_name");
			String user_gender = rs.getString("user_gender");
			String user_jumin = rs.getString("user_jumin");
			int user_age = rs.getInt("user_age");
			int user_authorize = rs.getInt("user_authorize");
			String user_email = rs.getString("user_email");
			String user_cardnum = rs.getString("user_cardnum");
			
			UserDTO dto = new UserDTO(user_uid, user_id, user_pw, user_name, user_gender, user_jumin, user_age, user_authorize, user_email, user_cardnum);
			list.add(dto);
		}
		int size = list.size();
		if(size == 0) return null;
		
		arr = new UserDTO[size];
		list.toArray(arr);
		return arr;
	}
	
	public UserDTO[] readMypage(String session) {
		String SQL = "SELECT * FROM USERS WHERE user_id = ?";
		UserDTO [] arr = null;
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, session);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}

}