package CKJY;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; // SELECT 결과, executeQuery()

	public UserDAO() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TEAM20", "tiger20");
			
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

	public int login(String user_id, String user_pw) {
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
	 
	public int join(UserDTO user) {
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
	public int idCheckFunction(String user_id) {
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

}