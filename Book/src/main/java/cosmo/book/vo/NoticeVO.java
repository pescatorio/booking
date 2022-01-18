package cosmo.book.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class NoticeVO {

	private int no;
	
	private String title;
	
	private String contents;
	
	private String delete_flag;
	
	private Date created_at;
	
	private Date updated_at;
	
	private int build_code;
}
