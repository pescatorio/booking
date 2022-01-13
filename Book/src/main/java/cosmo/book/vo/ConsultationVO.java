package cosmo.book.vo;

import java.sql.Date;

import lombok.Data;


@Data
public class ConsultationVO {

	private int no;
	
	private int grno;
	
	private int grgrod;
	
	private int depth;
	
	private String title;
	
	private String contents;
	
	private String name;
	
	private String password;
	
	private String lockFlag;
	
	private String deleteFlag;
	
	private Date createdAt;
	
	private Date updatedAt;
	
	private int buildCode;

	
	
}
