package attraction.beans;
//?
//DTO : Data Trasfer Object
// 데이터를 담아 나르기 위한 객체

//게시글DTO, 회원DTO, ... 필요한 데이터 객체들 만큼 정의
//Bean 객체

public class AttrWriteDTO {
	
	private int attr_id;
	private int attr_max;
	private int attr_time;
	private int attr_price;
	private String attr_content;
	private String attr_name ;
	private int attr_location;
	private int attr_min_age;
	private int attr_max_age;
	private int attr_min_height;
	private int attr_max_height;
	private int attr_authorize;
	private String attr_regDate;
	private String attr_img;
	private String attr_cardimg;
	// 개발시..
//다음 3가지 네이밍은 일치시켜주는 것이 좋다 .
//클래스 필드명 = DB 필드명  = form 의 name명
public int getAttr_id() {
	System.out.println("getAttr_id 호출");
	return attr_id;
}
public void setAttr_id(int attr_id) {this.attr_id = attr_id;	
System.out.println("setAttr_id(" + attr_id + ") 호출");
}
	
	public int getAttr_max() {return attr_max;	
}
	public void setAttr_max(int attr_max) {this.attr_max = attr_max;	
	System.out.println("setAttr_max(" + attr_max + ") 호출");
}
	
	public int getAttr_time() {return attr_time;	
}
	public void setAttr_time(int attr_time) {this.attr_time = attr_time;	
	System.out.println("setAttr_time(" + attr_time + ") 호출");
}
	
	public int getAttr_price() {return attr_price;	
}
	public void setAttr_price(int attr_price) {this.attr_price = attr_price;	
	System.out.println("setAttr_price(" + attr_price + ") 호출");
}
	
	public String getAttr_content() {return attr_content;	
}
	public void setAttr_content(String attr_content) {this.attr_content = attr_content;	
	System.out.println("setAttr_content(" + attr_content + ") 호출");
}
	
	public String getAttr_name() {return attr_name;	
}
	public void setAttr_name(String attr_name) {this.attr_name = attr_name;	
	System.out.println("setAttr_name(" + attr_name + ") 호출");
}
	
	public int getAttr_location() {return attr_location;	
}
	public void setAttr_location(int attr_location) {this.attr_location = attr_location;
	System.out.println("setAttr_location(" + attr_location + ") 호출");
	}
	
	public int getAttr_min_age() {return attr_min_age;	
}
	public void setAttr_min_age(int attr_min_age) {this.attr_min_age = attr_min_age;
	System.out.println("setAttr_min_age(" + attr_min_age + ") 호출");
	}
	
	public int getAttr_max_age() {return attr_max_age;	
}
	public void setAttr_max_age(int attr_max_age) {this.attr_max_age = attr_max_age;
	System.out.println("setAttr_max_age(" + attr_max_age + ") 호출");
}

	public int getAttr_min_height() {return attr_min_height;
}

	public void setAttr_min_height(int attr_min_height) {this.attr_min_height = attr_min_height;	
System.out.println("setAttr_min_height(" + attr_min_height + ") 호출");
}
	
	public int getAttr_max_height() {return attr_max_height;	
}
	public void setAttr_max_height(int attr_max_height) {this.attr_max_height = attr_max_height;	
	System.out.println("setAttr_max_height(" + attr_max_height + ") 호출");
}
	
	public int getAttr_authorize() {return attr_authorize;	
}
	public void setAttr_authorize(int attr_authorize) {this.attr_authorize = attr_authorize;	
	System.out.println("setAttr_authorize(" + attr_authorize + ") 호출");
}	
	
	public String getAttr_regDate() {return attr_regDate;	
}
	public void setAttr_regDate(String attr_regDate) {this.attr_regDate = attr_regDate;	
	System.out.println("setAttr_regDate(" + attr_regDate + ") 호출");
}
	
	public String getAttr_img() {return attr_img;	
}
	public void setAttr_img(String attr_img) {this.attr_img = attr_img;	
	System.out.println("setAttr_img(" + attr_img + ") 호출");
}
	
	public String getAttr_cardimg() {return attr_cardimg;	
}
	public void setAttr_cardimg(String attr_cardimg) {this.attr_cardimg = attr_cardimg;	
	System.out.println("setAttr_cardimg(" + attr_cardimg + ") 호출");
}
	
	public AttrWriteDTO(int attr_id, int attr_max, int attr_time, int attr_price, String attr_content, String attr_name,
			int attr_location, int attr_min_age, int attr_max_age, int attr_min_height, int attr_max_height,
			int attr_authorize, String attr_regDate, String attr_img, String attr_cardimg) {
		super();
		this.attr_id = attr_id;
		this.attr_max = attr_max;
		this.attr_time = attr_time;
		this.attr_price = attr_price;
		this.attr_content = attr_content;
		this.attr_name = attr_name;
		this.attr_location = attr_location;
		this.attr_min_age = attr_min_age;
		this.attr_max_age = attr_max_age;
		this.attr_min_height = attr_min_height;
		this.attr_max_height = attr_max_height;
		this.attr_authorize = attr_authorize;
		this.attr_regDate = attr_regDate;
		this.attr_img = attr_img;
		this.attr_cardimg = attr_cardimg;
		System.out.println("WriteDTO 객체 생성");
	}
	public AttrWriteDTO() {
		super();
	}
	@Override
	public String toString() {
		return "WriteDTO [attr_id=" + attr_id + ", attr_max=" + attr_max + ", attr_time=" + attr_time + ", attr_price="
			+ attr_price + ", attr_content=" + attr_content + ", attr_name=" + attr_name + ", attr_location="
			+ attr_location + ", attr_min_age=" + attr_min_age + ", attr_max_age=" + attr_max_age
			+ ", attr_min_height=" + attr_min_height + ", attr_max_height=" + attr_max_height + ", attr_authorize="
			+ attr_authorize + ", attr_regDate=" + attr_regDate + ", attr_img=" + attr_img + ", attr_cardimg="
			+ attr_cardimg + "]";
	}
	
	
} // end DTO









