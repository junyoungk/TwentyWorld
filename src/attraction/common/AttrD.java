package attraction.common;

/*
 * DB 접속 정보, 쿼리문, 테이블명, 컬럼명 등은
 * 별도로 관리하든지
 * XML, 초기화 파라미터 등에서 관리하는 것이 좋다.
 */
public class AttrD {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";  // JDBC 드라이버 클래스
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";  // DB 접속 URL
	public static final String USERID = "scott0316";  // DB 접속 계정 정보
	public static final String USERPW = "tiger0316";
	
	public static final String SQL_WRITE_SELECT = 
			"SELECT * FROM attraction ORDER BY attr_id DESC"; 

	public static final String SQL_WRITE_INSERT = "INSERT INTO attraction " 
					+ "(attr_id, attr_max, attr_time, attr_price,"
					+ "attr_content, attr_name, attr_location, "
					+ "attr_min_age, attr_max_age, attr_min_height, attr_max_height,"
					+ "attr_authorize, attr_regDate, attr_img, attr_cardimg) " 
					 + " VALUES(attraction_write_seq.nextval, ?, ?, ?," 
					+ " ?, ?, ?," + "?, ?, ?, ?," + " ?, sysdate, ?, ?)";

	

	public static final String SQL_WRITE_SELECT_BY_UID =  // 글 읽어 오기
			"SELECT * FROM attraction WHERE attr_id = ?";

	public static final String SQL_WRITE_UPDATE = 
			" UPDATE attraction SET "
			+ " attr_max = ?, attr_time = ?, attr_price = ?, "
			+ "attr_content = ?, attr_name = ?, attr_location = ?,"
			+ "attr_min_age = ?, attr_max_age = ?, attr_min_height = ?, attr_max_height = ?, "
			+ "attr_authorize = ?, attr_img = ?, attr_cardimg = ? "
			+ " WHERE attr_id = ?";

	public static final String SQL_WRITE_DELETE_BY_UID = 
			"DELETE FROM attraction WHERE attr_id = ?";
	
}




























