package cosmo.book.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cosmo.book.mapper.BookingMapper;
import cosmo.book.mapper.RoomInfoMapper;
import cosmo.book.vo.BookingPeriodVO;
import cosmo.book.vo.BookingVO;
import cosmo.book.vo.Criteria;
import cosmo.book.vo.RoomInfoVO;

@Service
public class BookingServiceInpl implements BookingService{

	@Autowired
	public BookingMapper bMapper;

	@Autowired
	public RoomInfoMapper rMapper;

	@Override
	public BookingVO selectBooking(int no) {
		return bMapper.selectBooking(no);
	}


	@Override
	public int updateBooking(BookingVO vo) {
		return bMapper.updateBooking(vo);
	}

	@Override
	public void updateBookingDeleteFlag(BookingVO vo) {
		bMapper.updateBookingDeleteFlag(vo);
	}

	
	@Override
	public void updateBookingPaymentFlag(BookingVO vo){
		bMapper.updateBookingPaymentFlag(vo);
	}
	
	@Override
	public void updateBookingCancelFlag(BookingVO vo) {
		bMapper.updateBookingCancelFlag(vo);
	}

	
	@Override
	public int insertBooking(BookingVO vo) {
		return bMapper.insertBooking(vo);
	}


	@Override
	public List<String> selectPeriod(int room_no) {
		List <BookingPeriodVO> tmpBPVo= bMapper.selectPeriod(room_no);
		List <String> resultList = new ArrayList<String>();
		for(int i=0;i<tmpBPVo.size();i++) {
			resultList.addAll(tmpBPVo.get(i).getBetweenStartToEnd());
		}
		return resultList;
	}


	@Override
	public Map<String, BookingVO> selectBookingMap() {
		List<BookingVO> tmpList=bMapper.selectBookingList();
		Map<String,BookingVO>tmpMap= new HashMap<String, BookingVO>();
		for (int i=0;i<tmpList.size();i++) {
			String tmpString=tmpList.get(i).getNo()+"";
			System.out.println(tmpString);
			tmpMap.put(tmpString, tmpList.get(i));
			System.out.println("tmpMap at serviceImpl....."+tmpMap);
		}
		
		return tmpMap;
	}
	
	@Override
	public List<BookingVO> selectBookingList() {
		List<BookingVO> tmpList=bMapper.selectBookingList();
		List<RoomInfoVO> rList=rMapper.selectRoomInfoList();
		System.out.println(tmpList);
		System.out.println(rList);
		for(int i=0;i<tmpList.size();i++) {
			for(int o=0;o<rList.size();o++) {
				if(tmpList.get(i).getRoom_no()==rList.get(o).getNo()) {
					tmpList.get(i).setTmpColor(rList.get(o).getColor_code());
				}
			}
		}
		return tmpList;
	}
	
	
	
}
