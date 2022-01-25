package cosmo.book.vo;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Repository;

import lombok.Data;

public class ImageFile {
	
	private List <String> imageFile;
	
	private String images;
	
	private long tmpImages;
	
	String [] splitors = images.split(",");
	



	public  List <String> getImageFile() {
		return imageFile;
		
	}


	public ImageFile(long tmpImages) {
		this.tmpImages = tmpImages;
		System.out.println("..............tmpImages"+tmpImages);
		this.images = String.valueOf(tmpImages);
		System.out.println("..............images"+images);
		this.imageFile = Arrays.asList(splitors);
	}


	
	
}
