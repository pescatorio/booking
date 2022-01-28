package cosmo.book.connection;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cosmo.book.service.RoomInfoService;
import cosmo.book.vo.RoomInfoVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ConnectionTest {
	
	@Autowired
	private DataSource dataSource;
	@Autowired
	private RoomInfoService rService;
	@Autowired
	private SqlSessionFactory sqlFactory;
	
	@Test
	private void selectRoomInfo() {
		RoomInfoVO rVo = rService.selectRoomInfo(54);
		System.out.println("rVo......"+rVo);
	}
	
	@Test 
	public void testConnection() throws Exception{ 
		String DRIVER = "org.postgresql.Driver"; 
		String URL = "jdbc:postgresql://192.168.5.22/sampledb"; 
		String USER = "testuser"; 
		String PW = "1234"; 
		Class.forName(DRIVER); 
		try(Connection conn = DriverManager.getConnection(URL, USER, PW)){ 
			System.out.println(conn); 
			} catch (Exception e) {  
				e.printStackTrace();
			} 
		}
	
	@Test
	public void testConnection2() throws Exception{ 
		try(Connection conn = (Connection) dataSource.getConnection()) {
			System.out.println("success : " + conn);
			System.out.println(dataSource);
			} catch (Exception ex){
				System.out.println("failed..!");
				ex.printStackTrace();
			}
		
		}
	
	
	public void testConnection3() throws Exception{ 
		
		try {

			SqlSession session = sqlFactory.openSession();
			System.out.println("success : " + session);
				
		} catch (Exception ex){
			System.out.println("fail..!");
			ex.printStackTrace();
		}
		}
	
	}


