package cosmo.book.security;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cosmo.book.vo.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class SecurityControllerTest {

	@Autowired 
	SecurityController sController;
	
	
	@Test
	public void testGenToken() {
		User user = new User(sController.genToken("admin").toString(),sController.genToken("1234").toString());
		System.out.println(user.getId());
		System.out.println(user.getPassword());
	}

	@Test
	public void testGetSubject() {
	}

}
