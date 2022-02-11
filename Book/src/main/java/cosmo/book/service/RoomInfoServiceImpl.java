package cosmo.book.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cosmo.book.mapper.RoomInfoMapper;
import cosmo.book.vo.ImageFile;
import cosmo.book.vo.OptionsVO;
import cosmo.book.vo.RoomInfoVO;

@Service
public class RoomInfoServiceImpl implements RoomInfoService{

	@Autowired
	public RoomInfoMapper rMapper;

	@Override
	public RoomInfoVO selectRoomInfo(int no) {
		return rMapper.selectRoomInfo(no);
	}

	public List<String> selectRoomImage(int no) {
		String tmpImageName=rMapper.selectRoomInfo(no).getImages();
		System.out.println("tmpImageNameMapper........."+tmpImageName);
		ImageFile iFile= new ImageFile(tmpImageName);
		iFile.getImageFile();
		System.out.println("iFile.getImageFile().get(0)......"+iFile.getImageFile().get(0));
		System.out.println("iFile.getImageFile().get(1)......"+iFile.getImageFile().get(1));
		return iFile.getImageFile();
	}
	
	@Override
	public List<RoomInfoVO> selectRoomInfoList() {
		return rMapper.selectRoomInfoList();
	}
	
	@Override
	public List<RoomInfoVO> selectRoomInfoListAtHome() {
		return rMapper.selectRoomInfoListAtHome();
	}
	
	@Override
	public int updateRoomInfo(RoomInfoVO vo) {
		return rMapper.updateRoomInfo(vo);
	}

	@Override
	public int deleteFlagRoomInfo(RoomInfoVO vo) {
		if(vo.getDelete_flag().equals("1")) {
			vo.setDelete_flag("0");
		}else {
			vo.setDelete_flag("1");
		}
		return rMapper.deleteFlagRoomInfo(vo);
	}

	@Override
	public int insertRoomInfo(RoomInfoVO vo) {
		return rMapper.insertRoomInfo(vo);
	}
	
	@Override
	public int updateRoomInfoImage(RoomInfoVO vo) {
		return rMapper.updateRoomInfoImage(vo);
	}
	
	

	
	
}
