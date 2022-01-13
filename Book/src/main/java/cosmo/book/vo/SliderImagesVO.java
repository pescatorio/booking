package cosmo.book.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class SliderImagesVO {

	private int no;
	
	private String fileName;
	
	private String sortNo;
	
	private String activity;
	
	private String deleteFlag;
	
	private Date createdAt;
	
	private Date updatedAt;
	
	private String buildCode;
}
