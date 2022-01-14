package cosmo.book.service;

import java.util.ArrayList;

import cosmo.book.vo.Criteria;
import cosmo.book.vo.RoomInfoVO;

public interface RoomInfoService {
	
	public RoomInfoVO selectRoomInfo(int no);
	
	public int getTotal(Criteria cri);
	
	public ArrayList <RoomInfoVO> getList(Criteria cri);
	
	public int updateRoomInfo(RoomInfoVO vo);
	
	public int deleteFlagRoomInfo(RoomInfoVO vo);
	
	public int insertRoomInfo(RoomInfoVO vo);
}
