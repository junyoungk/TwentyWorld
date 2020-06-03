package reply.beans;
import java.util.Date;

public class ReplyDTO {
	private int reply_id;
	private int reply_boarderid;
	private int reply_useruid;
	private String reply_comment;
	private String reply_regdate;
	private String writeid;
	
	public ReplyDTO() {
		super();
	}

	public ReplyDTO(int reply_id, int reply_boarderid, int reply_useruid, String reply_comment) {
		super();
		this.reply_id = reply_id;
		this.reply_boarderid = reply_boarderid;
		this.reply_useruid = reply_useruid;
		this.reply_comment = reply_comment;
	}

	public String getWriteId() {
		return writeid;
	}

	public void setWriteId(String writeid) {
		this.writeid = writeid;
	}
	public int getReply_id() {
		return reply_id;
	}

	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}

	public int getReply_boarderid() {
		return reply_boarderid;
	}

	public void setReply_boarderid(int reply_boarderid) {
		this.reply_boarderid = reply_boarderid;
	}

	public int getReply_useruid() {
		return reply_useruid;
	}

	public void setReply_useruid(int reply_useruid) {
		this.reply_useruid = reply_useruid;
	}

	public String getReply_comment() {
		return reply_comment;
	}

	public void setReply_comment(String reply_comment) {
		this.reply_comment = reply_comment;
	}

	public String getReply_regdate() {
		return reply_regdate;
	}

	public void setReply_regdate(String reply_regdate) {
		this.reply_regdate = reply_regdate;
	}
	
}
