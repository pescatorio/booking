package cosmo.book.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cosmo.book.mapper.RoomInfoMapper;
import cosmo.book.vo.RoomInfoVO;

@Service
public class RoomInfoServiceImpl implements RoomInfoService{

	@Autowired
	public RoomInfoMapper rMapper;

	@Override
	public RoomInfoVO selectRoomInfo(String no) {
		return rMapper.selectRoomInfo(no);
	}

	@Override
	public List<RoomInfoVO> selectRoomInfoList() {
		return rMapper.selectRoomInfoList();
	}
	
	@Override
	public int updateRoomInfo(RoomInfoVO vo) {
		return rMapper.updateRoomInfo(vo);
	}

	@Override
	public int deleteFlagRoomInfo(RoomInfoVO vo) {
		return rMapper.deleteFlagRoomInfo(vo);
	}

	@Override
	public int insertRoomInfo(RoomInfoVO vo) {
		return rMapper.insertRoomInfo(vo);
	}

	

	
	
}
