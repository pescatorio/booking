package cosmo.book.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class ConsultationVO {

	private int no;
	
	private int grno;
	
	private int grgrod;
	
	private int depth;
	
	private String title;
	
	private String contents;
	
	private String name;
	
	private String passwd;
	
	private String lock_flag;
	
	private String delete_flag;
	
	private Date created_at;
	
	private Date updated_at;
	
	private int build_code;

	
	
}
