package cosmo.book.vo;

import java.util.Arrays;
import java.util.List;

import lombok.Data;

@Data
public class ImageFile {
	
	private List<String> imageFile;
	
	private String images;
	
	public ImageFile(String images) {
		
		this.images = images;
		String [] splitors = images.split("/");
		this.imageFile = Arrays.asList(splitors);
	}
	
}
