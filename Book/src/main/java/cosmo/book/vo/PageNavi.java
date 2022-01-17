package cosmo.book.vo;


import lombok.Data;

@Data
public class PageNavi {

	int startPage;
	int endPage;
	boolean prev;
	boolean next;
	
	Criteria cri;
	int total;
	
	public PageNavi(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		endPage = (int)(Math.ceil(cri.getPageNo() / 10.0)) *10;
		startPage = endPage - 9;
		int realEndPage = (int)Math.ceil((total*1.0)/cri.getAmount());
		
		endPage = endPage > realEndPage ? realEndPage : endPage;  
		
		prev = startPage>1;
		
		next = realEndPage > endPage;
		
			
	}
	
	
	
}