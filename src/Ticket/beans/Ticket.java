package Ticket.beans;

public class Ticket {
	private int ticket_id;  
	private String ticket_name;
	private int ticket_price;
	private String ticket_img;
	
	
	public Ticket() {
		super();
	}
	
	
	public Ticket(int ticket_id, String ticket_name, int ticket_price , String ticket_img) {
		super();
		this.ticket_id = ticket_id;
		this.ticket_name = ticket_name;
		this.ticket_price = ticket_price;
		this.ticket_img = ticket_img;
	}


	public int getTicket_id() {
		return ticket_id;
	}


	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
	}


	public String getTicket_name() {
		return ticket_name;
	}


	public void setTicket_name(String ticket_name) {
		this.ticket_name = ticket_name;
	}


	public int getTicket_price() {
		return ticket_price;
	}


	public void setTicket_price(int ticket_price) {
		this.ticket_price = ticket_price;
	}


	public String getTicket_img() {
		return ticket_img;
	}


	public void setTicket_img(String ticket_img) {
		this.ticket_img = ticket_img;
	}

	

	
	
	
	
}

