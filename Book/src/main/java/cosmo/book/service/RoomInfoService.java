package cosmo.book.service;

import java.util.List;

import cosmo.book.vo.OptionsVO;
import cosmo.book.vo.RoomInfoVO;

public interface RoomInfoService {
	
	public RoomInfoVO selectRoomInfo(int no);
	
	public List<String> selectRoomImage(int no);
	
	public List<RoomInfoVO> selectRoomInfoList();
	
	public List<RoomInfoVO> selectRoomInfoListAtHome();
	
	public int updateRoomInfo(RoomInfoVO vo);
	
	public int deleteFlagRoomInfo(RoomInfoVO vo);
	
	public int insertRoomInfo(RoomInfoVO vo);
	
	public int updateRoomInfoImage(RoomInfoVO vo);
}
