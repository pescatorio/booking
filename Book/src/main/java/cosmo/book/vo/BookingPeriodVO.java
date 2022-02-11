package cosmo.book.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class BookingPeriodVO {
	
	private int room_no;

	private String start_date;
	
	private String end_date;
	
	private ArrayList<String>betweenStartToEnd;

	public BookingPeriodVO(int room_no,String start_date, String end_date) {
		this.room_no=room_no;
		this.start_date=start_date;
		this.end_date=end_date;
		ArrayList<String> tmpBetweenStartToEnd=new ArrayList<String>();
		int tmpStart=Integer.parseInt(start_date);
		int tmpEnd=Integer.parseInt(end_date);
		
		for(int i=tmpStart;i<=tmpEnd;i++) {
			tmpBetweenStartToEnd.add(i+"");
		}
		
		this.betweenStartToEnd=tmpBetweenStartToEnd;
	}
	
	
}
