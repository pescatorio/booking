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
	
	private String delete_flag;
	
	private Date created_at;
	
	private Date updated_at;
}
