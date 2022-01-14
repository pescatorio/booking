package cosmo.book.mapper;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import cosmo.book.vo.BookingVO;
import cosmo.book.vo.Criteria;

@Mapper
public interface BookingMapper {

	public BookingVO selectBooking(int no);
	
	public int getTotal(Criteria cri);
	
	public ArrayList <BookingVO> getList(Criteria cri);
	
	public int updateBooking(BookingVO vo);
	
	public int deleteFlagBooking(BookingVO vo);
	
	public int insertBooking(BookingVO vo);
}