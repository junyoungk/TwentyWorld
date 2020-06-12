package CKJY;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import board.beans.Board;





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
	
	public int checkuid(String user_id) {
		String SQL = "SELECT user_uid FROM users WHERE USER_ID = ?";
		int uid = 0;
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				uid = rs.getInt("user_uid");	
				}
			}
		catch (Exception e) {
			e.printStackTrace();
		   }	
		return uid;
	}
	
	
	public String checkname(String user_id) {
		String SQL = "SELECT user_name FROM users WHERE USER_ID = ?";
		String a = "";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				a = rs.getString("user_name");	
				}
			}
		catch (Exception e) {
			e.printStackTrace();
		   }	
		return a;
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
	
	public UserDTO[] readMypage(int session) {
		String SQL = "SELECT * FROM USERS WHERE user_uid = ?";
		UserDTO [] arr = null;
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, session);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
	
	public int UserDelete(int session) { // 계정 삭제
		String SQL = "DELETE FROM USERS WHERE user_uid = ?";
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, session);
			rs = pstmt.executeQuery();
			conn.commit();
			if (rs.next()) {				
				return 1; // 로그인 성공					
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public String findID (String user_name, String user_jumin) {
		String SQL = "SELECT user_id FROM USERS WHERE user_name = ? AND user_jumin = ?";
		String user_id = "";
		try {
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_name);
			pstmt.setString(2, user_jumin);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {				
				user_id = rs.getString("user_id");				
				
			} else {
				return "없음";
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user_id;
	}
	
	public UserDTO[] selectByUid(int user_uid) throws SQLException{
		String SQL = "SELECT * FROM USERS WHERE user_uid = ?";
		UserDTO [] arr = null;
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, user_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}
	
	public int update(int user_uid, String user_pw, String user_email, String user_cardnum) throws SQLException {
		int cnt = 0;
		String SQL = "UPDATE USERS SET user_pw = ? , user_email = ? ,user_cardnum = ? WHERE user_uid = ?";
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,user_pw);
			pstmt.setString(2,user_email);
			pstmt.setString(3,user_cardnum);
			pstmt.setInt(4,user_uid);
			

			
			cnt = pstmt.executeUpdate();
			conn.commit();
		}finally {
			close();
		}	
		return cnt;
		
	} 

	public String findPW (String user_name,String user_id, String user_jumin) {
		String SQL = "SELECT user_pw FROM USERS WHERE user_name = ? AND user_id = ? AND user_jumin = ?";
		String user_pw = "";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_name);
			pstmt.setString(2, user_id);
			pstmt.setString(3, user_jumin);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {				
				user_pw = rs.getString("user_pw");				
				
			} else {
				return "없음";
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user_pw;
	}
	
	public String[] writeList (int user_uid) {
		String SQL = "SELECT BOARD_SUBJECT FROM BOARD WHERE BOARD_WRITEUID = ? ORDER BY BOARD_ID DESC ";
		String  [] a = new String[5]; // 최근 5개만 받아오게.
		int i = 0;
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, user_uid);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				a[i] = rs.getString("board_subject");
				i++;
				if(i==5) break;
			}
	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return a;
	}
	
	public int[] writeListUID (int user_uid) {
		String SQL = "SELECT BOARD_ID FROM BOARD WHERE BOARD_WRITEUID = ? ORDER BY BOARD_ID DESC ";
		int  [] a = new int[5]; // 최근 5개만 받아오게.
		int i = 0;
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, user_uid);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				a[i] = rs.getInt("BOARD_ID");
				i++;
				if(i==5) break;
			} 
	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return a;
	}
	
	
	
	public String[] writeListDate (int user_uid) {
		String SQL = "SELECT BOARD_REGDATE FROM BOARD WHERE BOARD_WRITEUID = ? ORDER BY BOARD_ID DESC ";
		String  [] a = new String[5]; // 최근 5개만 받아오게.
		int i = 0;
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, user_uid);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				a[i] = rs.getString("BOARD_REGDATE");
				i++;
				if(i==5) break;
			} 
	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return a;
	}
	
	
	public String[] writereplyDate (int user_uid) {
		String SQL = "SELECT REPLY_REGDATE FROM REPLY WHERE REPLY_USERUID = ? ORDER BY REPLY_REGDATE DESC ";
		String  [] a = new String[5]; // 최근 5개만 받아오게.
		int i = 0;
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, user_uid);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				a[i] = rs.getString("REPLY_REGDATE");
				i++;
				if(i==5) break;
			} 
	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return a;
	}
	
	
	
	
	public String[] replyList (int user_uid) {
		String SQL = "SELECT REPLY_COMMENT FROM REPLY WHERE REPLY_USERUID = ? ORDER BY REPLY_REGDATE DESC ";
		String  [] a = new String[5]; // 최근 10개만 받아오게.
		int i = 0;
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, user_uid);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				a[i] = rs.getString("reply_comment");
				i++;
				if(i==5) break;
			}
	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return a;
	}
	
	public int[] replyListUID (int user_uid) {
		String SQL = "SELECT REPLY_BOARDERID FROM REPLY WHERE REPLY_USERUID = ? ORDER BY REPLY_REGDATE DESC ";
		int  [] a = new int[5]; // 최근 10개만 받아오게.
		int i = 0;
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, user_uid);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				a[i] = rs.getInt("reply_boarderid");
				i++;
				if(i==5) break;
			} 
	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return a;
	}
	
	public String[] myTicketList (int user_uid) {
		String SQL = "SELECT t.TICKET_NAME FROM TICKET t , USERS u ,TICKETBUY tb"
				+ " WHERE tb.USER_UID = u.USER_UID AND tb.TICKET_ID  = t.TICKET_ID AND u.USER_UID = ?"
				+ " ORDER BY tb.TICKETBUY_ID DESC";
		String  [] a = new String[5]; // 최근 10개만 받아오게.
		int i = 0;
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, user_uid);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				a[i] = rs.getString("TICKET_NAME");
				i++;
				if(i==5) break;
			}
	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return a;
	}
	
	public int[] myTicketNum (int user_uid) {
		String SQL = "SELECT tb.TICKETBUY_ID FROM TICKET t , USERS u ,TICKETBUY tb"
				+ " WHERE tb.USER_UID = u.USER_UID AND tb.TICKET_ID  = t.TICKET_ID AND u.USER_UID = ?"
				+ " ORDER BY tb.TICKETBUY_ID DESC";
		int  [] a = new int[5]; // 최근 10개만 받아오게.
		int i = 0;
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, user_uid);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				a[i] = rs.getInt("TICKETBUY_ID");
				i++;
				if(i==5) break;
			} 
	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return a;
	}
	
	
	public Board[] boardGonggi() throws SQLException{
		Board[] arr = null;
		List<Board> list = new ArrayList<Board>();
		
		try {
			pstmt = conn.prepareStatement("SELECT rownum , b.BOARD_ID , b.BOARD_SUBJECT, b.BOARD_REGDATE FROM board b WHERE BOARD_CATEGORY = '공지' AND rownum <= 5 ORDER BY board_id DESC");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int rownum = rs.getInt("rownum");
				String subject = rs.getString("board_subject");
				int bid = rs.getInt("board_id");
				String b_regdate = rs.getString("board_regdate");
				
				Board dto = new Board();
				dto.setRownum(rownum);
				dto.setBoard_subject(subject);
				dto.setBoard_id(bid);
				dto.setBoard_regdate(b_regdate);
				
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
	
	
	public int UserTicketDelete(int ticketNum) { // 계정 삭제
		String SQL = "DELETE FROM TICKETBUY WHERE TICKETBUY_ID = ?";
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ticketNum);
			rs = pstmt.executeQuery();
			conn.commit();
			if (rs.next()) {				
				return 1; // 로그인 성공					
				}
		} catch (Exception e) {
			
		}
		return -1;
	}

	
	
	

}