package cosmo.book.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Repository
public class SliderimagesVO {

	private int no;
	
	private String file_name;
	
	private String sort_no;
	
	private String activity;
	
	private String delete_flag;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
	private Date created_at;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
	private Date updated_at;
	
	private int build_code;
	
	
	public void switchingActivity(String activity) {
		if(activity.equals("0")) {this.activity="1";}
		if(activity.equals("1")) {this.activity="0";}
	}
	
	public void switchingDeleteFlag(String delete_flag) {
		if(delete_flag.equals("0")) {this.delete_flag="1";}
		if(delete_flag.equals("1")) {this.delete_flag="0";}
	}
}
