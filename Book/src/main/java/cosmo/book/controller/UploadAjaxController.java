package cosmo.book.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import cosmo.book.service.RoomInfoService;
import cosmo.book.service.SliderImagesService;
import cosmo.book.vo.RoomInfoVO;
import cosmo.book.vo.SliderimagesVO;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;


@RestController
public class UploadAjaxController {
	
	@Autowired
	SliderImagesService sService;
	@Autowired
	RoomInfoService rService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(UploadAjaxController.class);
	
	
	@PostMapping(value="/uploadAjaxAction",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<SliderimagesVO>> adminMainUploadAjax(MultipartFile[] uploadFile,Model model) throws Exception{
		logger.info("uploadAjax...");
		List<SliderimagesVO> sList= sService.selectSliderimages();
		String uploadFolder="C:\\githup\\booking\\Book\\src\\main\\webapp\\resources\\image\\image1200X700";
		String uploadFolder2="C:\\\\githup\\\\booking\\\\Book\\\\src\\\\main\\\\webapp\\\\resources\\\\image\\\\image500X500";
		for(MultipartFile multipartFile :uploadFile) {
			logger.info("--------------------------------------------------------");
			logger.info("Upload File Name :"+multipartFile.getOriginalFilename());
			logger.info("Upload File Size :"+multipartFile.getSize());
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("/")+1);
			String tmpExtention = uploadFileName.substring(uploadFileName.length()-4, uploadFileName.length());
			String sha= sha256(uploadFileName);
			uploadFileName=sha+tmpExtention;
			try {
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadFolder,uploadFileName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,1200,700);
				thumbnail = new FileOutputStream(new File(uploadFolder2,uploadFileName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,500,500);
				thumbnail.close(); 
				SliderimagesVO sVo= new SliderimagesVO();
				sVo.setFile_name(uploadFileName);
				System.out.println("uploadFileName........."+uploadFileName);
				sService.insertSliderimages(sVo);
			}catch (Exception e){
				logger.error(e.getMessage());
			}
			//list 更新
			sList= sService.selectSliderimages();
		}//for
		return new ResponseEntity<List<SliderimagesVO>>(sList, HttpStatus.OK);
		
	}
	
	@PostMapping(value="/getImageAjax",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<SliderimagesVO>> getImageAjax(MultipartFile[] uploadFile,Model model) throws Exception{
		logger.info("getImageAjax...");
		List<SliderimagesVO> sList= sService.selectSliderimages();
		return new ResponseEntity<List<SliderimagesVO>>(sList, HttpStatus.OK);
	}
	

	
	
	/*@PostMapping(value="/uploadRoomAjaxAction",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<RoomInfoVO> uploadRoomAjax(MultipartFile[] uploadFile,Model model,@RequestParam String no)throws Exception{
		logger.info("uploadRoomAjax...");
		RoomInfoVO rVo= rService.selectRoomInfo(no);
		String uploadFolder="C:\\githup\\booking\\Book\\src\\main\\webapp\\resources\\image\\image1200X700";
		String uploadFolder2="C:\\\\githup\\\\booking\\\\Book\\\\src\\\\main\\\\webapp\\\\resources\\\\image\\\\image500X500";
		for(MultipartFile multipartFile :uploadFile) {
			logger.info("--------------------------------------------------------");
			logger.info("Upload File Name :"+multipartFile.getOriginalFilename());
			logger.info("Upload File Size :"+multipartFile.getSize());
			String uploadFileName = multipartFile.getOriginalFilename();
			rVo.getImages();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("/")+1);
			String tmpExtention = uploadFileName.substring(uploadFileName.length()-4, uploadFileName.length());
			String sha= sha256(uploadFileName);
			uploadFileName=sha+tmpExtention;
			try {
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadFolder,uploadFileName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,1200,700);
				thumbnail = new FileOutputStream(new File(uploadFolder2,uploadFileName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,500,500);
				thumbnail.close(); 
				rVo.setImages(rVo.getImages()+","+uploadFileName);
				System.out.println("uploadFileName........."+uploadFileName);
				rService.updateRoomInfo(rVo);
			}catch (Exception e){
				logger.error(e.getMessage());
			}
		}//for
		return new ResponseEntity<RoomInfoVO>(rVo, HttpStatus.OK);
		
	}*/
	
	
	
	
	
	
	
	
	
	public static String sha256(String msg) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(msg.getBytes());
        
        return bytesToHex(md.digest());
    }
 
    public static String bytesToHex(byte[] bytes) {
        StringBuilder builder = new StringBuilder();
        for (byte b: bytes) {
          builder.append(String.format("%02x", b));
        }
        return builder.toString();
    }




	
}