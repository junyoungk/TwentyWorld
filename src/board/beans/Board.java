package board.beans;

import java.util.Date;

public class Board {
	private int board_id;
	private String board_regdate;
	private String board_subject;
	private String board_content;
	private String board_img;
	private int board_writeuid;
	private int board_viewcnt;
	private int board_authorize;
	private String board_category;
	private String writeName;
	
	

	public Board() {
		super();
	}
	
	

	public Board(int board_id, String board_subject, String board_content, String board_img, int board_writeuid,
			int board_viewcnt, int board_authorize, String board_category) {
		super();
		this.board_id = board_id;
		this.board_subject = board_subject;
		this.board_content = board_content;
		this.board_img = board_img;
		this.board_writeuid = board_writeuid;
		this.board_viewcnt = board_viewcnt;
		this.board_authorize = board_authorize;
		this.board_category = board_category;
	}

	public String getWriteName() {
		return writeName;
	}

	public void setWriteName(String writeName) {
		this.writeName = writeName;
	}
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(String board_regdate) {
		this.board_regdate = board_regdate;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_img() {
		return board_img;
	}
	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}
	public int getBoard_writeuid() {
		return board_writeuid;
	}
	public void setBoard_writeuid(int board_writeuid) {
		this.board_writeuid = board_writeuid;
	}
	public int getBoard_viewcnt() {
		return board_viewcnt;
	}
	public void setBoard_viewcnt(int board_viewcnt) {
		this.board_viewcnt = board_viewcnt;
	}
	public int getBoard_authorize() {
		return board_authorize;
	}
	public void setBoard_authorize(int board_authorize) {
		this.board_authorize = board_authorize;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	
	
}