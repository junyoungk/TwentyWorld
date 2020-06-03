package Ticket.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import Ticket.beans.Ticket;
import Ticket.beans.Ticket;

public class TicketDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; // SELECT 결과, executeQuery()
 
	public TicketDAO() {

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
	public Ticket[] createArray(ResultSet rs) throws SQLException{
		Ticket[] arr = null;
		
		ArrayList<Ticket> list = new ArrayList<Ticket>();
		
		while(rs.next()) {
			int id = rs.getInt("ticket_id");
			String name = rs.getString("ticket_name");
			int price = rs.getInt("ticket_price");
			String img = rs.getString("ticket_img");
		
			
			Ticket dto = new Ticket();
			dto.setTicket_id(id);
			dto.setTicket_name(name);
			dto.setTicket_price(price);
			dto.setTicket_img(img);
			list.add(dto);
			
		} // end while
		
		int size = list.size();
		
		if(size == 0) return null;
		
		arr = new Ticket[size];
		
		list.toArray(arr);
	
		return arr;
	}
	public Ticket [] select() throws SQLException{
		Ticket [] arr = null;
		
		try {
			pstmt = conn.prepareStatement("SELECT ticket_id, ticket_name, ticket_price, ticket_img FROM Ticket");
				
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
		
	}
	public Ticket[] selectByid(int ticket_id) throws SQLException{
		int cnt = 0;
		Ticket[] arr = null;
		
		ArrayList<Ticket> list = new ArrayList<Ticket>();
		
		try {
			
			pstmt = conn.prepareStatement("SELECT * FROM TICKET WHERE ticket_id = ?");
			pstmt.setInt(1, ticket_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				int id = rs.getInt("ticket_id");
				String name = rs.getString("ticket_name");
				int price = rs.getInt("ticket_price");
				String img = rs.getString("ticket_img");
				
				Ticket dto = new Ticket();
				dto.setTicket_id(id);
				dto.setTicket_name(name);
				dto.setTicket_price(price);
				dto.setTicket_img(img);
				
				list.add(dto);
			}
			
			int size = list.size();
			
			if(size == 0) return null;
			
			arr = new Ticket[size];
			
			list.toArray(arr);
		} finally {
			close();
		}
		return arr;
	}	

	public int insert(int id, String name, int price ,String img) throws SQLException{
		int cnt = 0;
		
		
		
		try {			
			pstmt = conn.prepareStatement("INSERT INTO TICKET VALUES(?, ?, ?, ?)");
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.setInt(3, price);
			pstmt.setString(4, img);
			
			cnt = pstmt.executeUpdate();
			
		} finally {
			close();			
		}

		return cnt;

	}

	
} //TicketDAO

	
	
	
	
	
