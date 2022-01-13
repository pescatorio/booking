package cosmo.book.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class NoticeVO {

	private int no;
	
	private String title;
	
	private String deleteFlag;
	
	private Date createdAt;
	
	private Date updatedAt;
	
	private int buildCode;
}
