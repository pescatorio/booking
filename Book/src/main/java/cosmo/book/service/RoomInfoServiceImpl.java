package cosmo.book.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cosmo.book.mapper.RoomInfoMapper;
import cosmo.book.vo.Criteria;
import cosmo.book.vo.RoomInfoVO;

@Service
public class RoomInfoServiceImpl implements RoomInfoService{

	@Autowired
	public RoomInfoMapper rMapper;


	@Override
	public RoomInfoVO selectRoomInfo(int no) {
		return rMapper.selectRoomInfo(no);
	}

	@Override
	public int getTotal(Criteria cri) {
		return rMapper.getTotal(cri);
	}

	@Override
	public ArrayList<RoomInfoVO> getList(Criteria cri) {
		return rMapper.getList(cri);
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
