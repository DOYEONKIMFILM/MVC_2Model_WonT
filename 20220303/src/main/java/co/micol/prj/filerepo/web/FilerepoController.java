package co.micol.prj.filerepo.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import co.micol.prj.filerepo.service.FilerepoService;
import co.micol.prj.filerepo.vo.FilerepoVO;

@Controller
public class FilerepoController {

	@Autowired
	private FilerepoService fileDao;

	@Autowired
	private String upLoadPath;


	@GetMapping("/fileUploadForm.do")
	public String fileUploadForm() {
		return "fileup/fileUploadForm";
	}

	@PostMapping("/fileUpload.do")
	public String fileUpload(FilerepoVO vo, MultipartFile file) {
		String fileName = file.getOriginalFilename(); // 원본 파일명
		String id = UUID.randomUUID().toString(); // 고유한 유니크한 아이디 생성
		// 파일명 치환
		String targetFile = id + fileName.substring(fileName.lastIndexOf(".")); // 파일명 다른이름으로 만들기

		File target = new File(upLoadPath, targetFile);
		try {
			FileCopyUtils.copy(file.getBytes(), target); // 파일 전송
			// DB작업
			vo.setFname(fileName); // 원본 파일명
			vo.setRname(targetFile); // 변경된 파일명
			fileDao.filerepoInsert(vo); // 파일 올리기

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:home.do";
	}
	

	@GetMapping("/fileUp.do")
	public void download(HttpServletResponse response) throws Exception {
		try {
			String path = "C:\\Users\\admin\\git\\MVC_2Model_WonT\\20220303\\src\\main\\webapp\\fileUp\\04.jpg"; // 경로에 접근할 때 역슬래시('\') 사용

			File file = new File(path);
			response.setHeader("Content-Disposition", "attachment;filename=" + file.getName()); // 다운로드 되거나 로컬에 저장되는 용도로
																								// 쓰이는지를 알려주는 헤더

			FileInputStream fileInputStream = new FileInputStream(path); // 파일 읽어오기
			OutputStream out = response.getOutputStream();

			int read = 0; //buffer 단위로 파일을 읽어서 저장하는 방법
			byte[] buffer = new byte[1024];
			while ((read = fileInputStream.read(buffer)) != -1) { // 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을
																	// 파일이 없음
				out.write(buffer, 0, read);
			}

		} catch (Exception e) {
			throw new Exception("download error");
		}
	}
}
