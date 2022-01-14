package cosmo.book.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class SliderimagesVO {

	private int no;
	
	private String fileName;
	
	private String sortNo;
	
	private String activity;
	
	private String deleteFlag;
	
	private Date createdAt;
	
	private Date updatedAt;
	
	private String buildCode;
}
