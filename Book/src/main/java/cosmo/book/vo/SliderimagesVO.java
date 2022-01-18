package cosmo.book.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class SliderimagesVO {

	private int no;
	
	private String file_name;
	
	private String sort_no;
	
	private String activity;
	
	private String delete_flag;
	
	private Date created_at;
	
	private Date updated_at;
	
	private String build_code;
}
