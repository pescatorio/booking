package cosmo.book.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class RoomInfoVO {

	private String no;
	
	private String roomNum;
	
	private String roomTitle;
	
	private int max;
	
	private int adultCost;
	
	private int childCost;
	
	private String explanation;
	
	private String images;
	
	private String colorCode;
	
	private String deleteFlag;
	
	private Date createdAt;
	
	private Date updatedAt;
}
