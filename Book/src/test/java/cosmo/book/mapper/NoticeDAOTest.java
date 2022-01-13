package cosmo.book.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cosmo.book.mapper.NoticeMapper;
import cosmo.book.service.NoticeService;
import cosmo.book.service.NoticeServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeDAOTest {

	@Autowired
	private NoticeMapper nMapper;
	
	@Autowired
	private NoticeServiceImpl nService;
	

	@Test
	public void NoticeTest() {
		System.out.println(nService.selectNotice());
	}
	
	@Test
	public void getTimTest() {
		System.out.println(nMapper.getTime());
	}

}
