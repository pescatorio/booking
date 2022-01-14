package cosmo.book.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class BookingVO {

	private int no;
	
	private int room_no;
	
	private String name;
	
	private String phone;
	
	private String adult;
	
	private String child;
	
	private String start_date;
	
	private String end_date;
	
	private String options;
	
	private String paymentFlag;
	
	private int totalCost;
	
	private String cancelFlag;
	
	private String bankName;
	
	private String bankAccountNumber;
	
	private String deleteFlag;
	
	private Date createdAt;
	
	private Date updatedAt;
	
	private int buildCode;
}
