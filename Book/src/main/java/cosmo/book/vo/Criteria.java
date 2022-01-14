package cosmo.book.vo;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class Criteria {
	int pageNo;
	int amount;
	String type;
	String keyword;
	public Criteria() {
		this.pageNo=1;
		this.amount=10;
	}
	public Criteria(int pageNo,int amount) {
		this.pageNo=pageNo;
		this.amount=amount;
	}
	
	
}