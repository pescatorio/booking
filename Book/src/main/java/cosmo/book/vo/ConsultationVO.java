package cosmo.book.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class ConsultationVO {

	private int no;
	
	private int grno;
	
	private int grgrod;
	
	private int depth;
	
	private String title;
	
	private String contents;
	
	private String name;
	
	private String passwd;
	
	private String lock_flag;
	
	private String delete_flag;
	
	private Date created_at;
	
	private Date updated_at;
	
	private int build_code;

	//To get a next tmp number of grno from mapper
	private int tmpGrno;

	//using at reply
	public ConsultationVO(int grno,int grgrod, int depth
			,String title, String contents, String name, String passwd) {
		this.grno = grno;
		this.grgrod = grgrod+1;
		this.depth = depth+1;
		this.title=title;
		this.contents=contents;
		this.name=name;
		this.passwd=passwd;
	}

	public ConsultationVO() {
		super();
	}
	
	
	
}
