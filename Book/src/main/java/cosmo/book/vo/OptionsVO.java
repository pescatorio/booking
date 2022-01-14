package cosmo.book.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class OptionsVO {

	private int no;
	
	private String item;
	
	private int cost;
	
	private String activity;
	
	private String deleteFlag;
	
	private Date createdAt;
	
	private Date updatedAt;
}
