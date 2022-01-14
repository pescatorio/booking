package cosmo.book.mapper;


import java.sql.Date;
import java.util.Calendar;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cosmo.book.mapper.NoticeMapper;
import cosmo.book.service.NoticeService;
import cosmo.book.service.NoticeServiceImpl;
import cosmo.book.vo.Criteria;
import cosmo.book.vo.NoticeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeMapperTest {

	@Autowired
	private NoticeMapper nMapper;
	
	Criteria cri;

	@Test
	public void selectNoticeTest() {
		NoticeVO nVo = nMapper.selectNotice(1);
		System.out.println(nVo.getNo());
	}
	
	@Test
	public void getListTest() {
		System.out.println(nMapper.getList(cri));
	}
	
	@Test
	public void getTotalTest() {
		System.out.println(nMapper.getTotal(cri));
	}
	@Test
	public void insertNoticeTest() {
		NoticeVO nVo=new NoticeVO();
		nVo.setTitle("testTitle");
		nVo.setContents("testContents");
		nVo.setDeleteFlag("0");
		nVo.setBuildCode(7);
		System.out.println(nMapper.insertNotice(nVo));
	}
	
	@Test
	public void updateNoticeTest() {
		Date date = new Date(0);
		NoticeVO nVo=new NoticeVO();
		nVo.setNo(10);
		nVo.setTitle("testUpdateTitle");
		nVo.setContents("testUpdateContents");
		nVo.setDeleteFlag("0");
		nVo.setBuildCode(7);
		System.out.println(nMapper.updateNotice(nVo));
	}
}
