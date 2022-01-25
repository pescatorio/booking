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
	
	private String payment_flag;
	
	private int total_cost;
	
	private String cancel_flag;
	
	private String bank_name;
	
	private String bank_branch_code;
	
	private String bank_account_number;
	
	private String delete_flag;
	
	private Date created_at;
	
	private Date updated_at;
	
	private int build_code;
}
