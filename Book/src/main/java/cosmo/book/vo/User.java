package cosmo.book.vo;

import lombok.Data;

public class User {
	private String id;
	private String password;
	
	
	
	public String getId() {
		return id;
	}



	public String getPassword() {
		return password;
	}



	public User(String id, String password) {
		if(id.equals("eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTY0Mjc0MjE2M30.RqI7EPvx5RwzZW6grDsb7uRk4hyNYP1-xZBZmcaXnBo")
				&&password.equals("eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjM0IiwiZXhwIjoxNjQyNzQyMTY0fQ.McAb85KTxoCCeonftuA03qmV856qsZD96JIHgEX3bXI")) {
			this.id = id;
			this.password = password;
		}
	}
	
	
	
}