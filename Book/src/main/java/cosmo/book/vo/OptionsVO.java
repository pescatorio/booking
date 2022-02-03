package cosmo.book.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Repository
public class OptionsVO {

	private int no;
	
	private String item;
	
	private int cost;
	
	private String activity;
	
	private String delete_flag;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
	private Date created_at;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
	private Date updated_at;
}
