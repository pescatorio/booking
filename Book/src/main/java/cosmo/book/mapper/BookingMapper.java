package cosmo.book.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import cosmo.book.vo.BookingPeriodVO;
import cosmo.book.vo.BookingVO;

@Mapper
public interface BookingMapper {

	public BookingVO selectBooking(int no);
	
	public List<BookingVO> selectBookingList();
	
	public List<BookingPeriodVO> selectPeriod(int room_no);
	
	public int updateBooking(BookingVO vo);
	
	public void updateBookingPaymentFlag(BookingVO vo);
	
	public void updateBookingDeleteFlag(BookingVO vo);
	
	public void updateBookingCancelFlag(BookingVO vo);
	
	public int insertBooking(BookingVO vo);
}