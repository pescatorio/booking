package cosmo.book.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Repository
public class RoomInfoVO {

	private int no;   
	
	private String room_num;
	
	private String room_title;
	
	private int max;
	
	private int adult_cost;
	
	private int child_cost;
	
	private String explanation;
	
	private String images;
	
	private String color_code;
	
	private String delete_flag;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
	private Date created_at;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
	private Date updated_at;
	
	private int build_code;
}
