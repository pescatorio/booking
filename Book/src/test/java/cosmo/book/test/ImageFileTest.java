package cosmo.book.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cosmo.book.vo.ImageFile;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ImageFileTest {


	@Test
	public void selectNoticeTest() {
		long tmpImage= Long.parseLong("1,2,3");
		ImageFile imageFile= new ImageFile(tmpImage);
		List<String> list = imageFile.getImageFile();
		System.out.println(list.get(0));
		System.out.println(list.get(1));
	}
	
	
}