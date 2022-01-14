package cosmo.book.mapper;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import cosmo.book.vo.Criteria;
import cosmo.book.vo.RoomInfoVO;

@Mapper
public interface RoomInfoMapper {

	public RoomInfoVO selectRoomInfo(int no);
	
	public int getTotal(Criteria cri);
	
	public ArrayList <RoomInfoVO> getList(Criteria cri);
	
	public int updateRoomInfo(RoomInfoVO vo);
	
	public int deleteFlagRoomInfo(RoomInfoVO vo);
	
	public int insertRoomInfo(RoomInfoVO vo);
}