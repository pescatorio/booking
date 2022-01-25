package cosmo.book.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import cosmo.book.vo.RoomInfoVO;

@Mapper
public interface RoomInfoMapper {

	public RoomInfoVO selectRoomInfo(String no);
	
	public List<RoomInfoVO> selectRoomInfoList();
	
	public int updateRoomInfo(RoomInfoVO vo);
	
	public int deleteFlagRoomInfo(RoomInfoVO vo);
	
	public int insertRoomInfo(RoomInfoVO vo);
}