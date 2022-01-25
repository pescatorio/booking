package cosmo.book.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import cosmo.book.service.RoomInfoService;
import cosmo.book.vo.ImageFile;

@RestController
public class FileAjaxController {

	@Autowired
	private RoomInfoService roomInfoService;

	private static final Logger logger = LoggerFactory.getLogger(FileAjaxController.class);
	private static final String ROOT_DIR = "C:\\upload\\temp\\";

	@GetMapping("/fileUploadAjax/{images}/{no}")
	public List<File> getList(@PathVariable("images") String images, @PathVariable("no") int no) {
		logger.info("getList........" + images + "...no............" + no);
		
		return null;
	}

	@GetMapping("/fileDisplay")
	public ResponseEntity<byte[]> fileDisplay(@Param("images") String images) {
		// log.info("fileDisplay...."+file_name);
		HttpHeaders headers = new HttpHeaders();
		File file = new File(ROOT_DIR + images);
		// log.info(file);
		if (file.exists()) {
			try {
				headers.add("Content-Type", Files.probeContentType(file.toPath()));
				return new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
			} catch (Exception e) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@PostMapping("/fileUploadAjax")
	public Map<String, String> fileUpload(MultipartFile[] uploadFile, String images) {
		logger.info("fileUpload...Ajax Post..." + images);

		Map<String, String> map = new HashMap<String, String>();
		int res = 0;

		/*
		 * if (null == images || 0 == images) { images =
		 * Long.parseLong(fileService.getFileSeq()); }
		 */
		logger.info(uploadFile + "");
		for (MultipartFile multipartFile : uploadFile) {

			// 중복 방지를 위해 UUID를 생성하여 파일명 앞에 붙여준다.(일련 번호 대신 유추하기 힘든 식별자를 사용)
			// universally unique identifier (UUID)

			/* String uploadPath = getFolder(); */

			// String uploadFileName = "_"+multipartFile.getOriginalFilename();

			logger.info("File Name: " + multipartFile.getOriginalFilename());
			logger.info("File Size: " + multipartFile.getSize());
			logger.info("File Size: " + multipartFile.getContentType());
			logger.info("===================================");

			// 파일을 서버에 저장
			/*
			 * try {
			 * 
			 * FileVO fileVO = new FileVO(String.valueOf(file_pictureId), uploadPath,
			 * multipartFile.getOriginalFilename());
			 * 
			 * //File saveFile = new File(ATTACHES_DIR+uploadPath, uploadFileName);
			 * multipartFile.transferTo(saveFile);
			 * 
			 * 
			 * 
			 * 
			 * Thumbnails.of(saveFile).size(1280,
			 * 720).toFile(ROOT_DIR+fileVO.getFile_savePath());
			 * 
			 * fileVO.setFile_type("Y"); logger.info(fileVO.getFile_type());
			 * 
			 * 
			 * } catch (IllegalStateException | IOException e) { e.printStackTrace(); }
			 */
		}
		// attachNo에 해당하는 파일리스틀를 조회하여 화면에 출력
		map.put("images", images + "");
		// log.info(list);
		return map;
	}//

	// delete file
	// @return String
	// path로 부터 parameter를 추출해야하므로 {parameter}로 작성
	@GetMapping("/fileDelete/{images}")
	public String fileDelete(@PathVariable("file_uuid") String file_uuid,
			@PathVariable("file_pictureId") String file_pictureId) {
		logger.info("delete..........." + file_uuid + "========" + file_pictureId);
		Long attachno = Long.parseLong(file_pictureId);
		String res = "";
		/*
		 * FileVO fileVO = fileService.getFile(file_pictureId, file_uuid); int de =
		 * fileService.fileDelete(file_pictureId, file_uuid);
		 * 
		 * if (de > 0) { // 저장된 파일을 조회 logger.info(fileVO + ""); File file = new
		 * File(ROOT_DIR + fileVO.getFile_savePath());
		 * 
		 * // 서버에 저장된 파일을 삭제 if (file.exists()) logger.info("normal file: " + file);
		 * file.delete();
		 * 
		 * // 만약에 이미지이면 서버에 이미지 파일의 썸네일도 삭제 if (fileVO.getFile_type().equals("Y")) {
		 * File sFile = new File(ROOT_DIR + fileVO.getFile_s_savePath());
		 * 
		 * if (sFile.exists()) logger.info("normal sFile: " + sFile); sFile.delete(); }
		 * res = attachno + "가 삭제되었습니다."; } else res = "error";
		 */
		return res;
	}//

}//