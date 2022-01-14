package cosmo.book.service;

import static org.junit.Assert.*;

import java.sql.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cosmo.book.vo.Criteria;
import cosmo.book.vo.NoticeVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeServiceTest {

	@Autowired
	private NoticeService nService;
	

	@Test
	public void selectNoticeTest() {
		NoticeVO nVo = nService.selectNotice(1);
		System.out.println(nVo.getNo());
	}
	
	@Test
	public void getListTest() {
		Criteria cri = new Criteria();
		cri.setKeyword("testTitle");
		cri.setType("title");
		System.out.println(nService.getList(cri));
	}
	
	@Test
	public void getTotalTest() {
		Criteria cri = new Criteria();
		cri.setKeyword("testTitle");
		cri.setType("title");
		System.out.println(nService.getTotal(cri));
	}
	@Test
	public void insertNoticeTest() {
		NoticeVO nVo=new NoticeVO();
		nVo.setTitle("testTitle");
		nVo.setContents("testContents");
		nVo.setDeleteFlag("0");
		nVo.setBuildCode(7);
		System.out.println(nService.insertNotice(nVo));
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
		System.out.println(nService.updateNotice(nVo));
	}
	
	@Test
	public void deleteNoticeTest() {
		NoticeVO nVo=new NoticeVO();
		nVo.setDeleteFlag("1");
		nVo.setNo(11);
		nService.deleteFlagNotice(nVo);
	}

}
