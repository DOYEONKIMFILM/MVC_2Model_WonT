package co.micol.encryption;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home/home";
	}
	
	@RequestMapping("/home.do")
	public String home(Model model) {
		return "home/home";
	}
	
	@RequestMapping("/homeChart.do")
	public String homeChart() {
		return "home/homeChart";
	}
	
	/*
	 * @RequestMapping("/sha.do") public void sha(@RequestParam("id") String id) {
	 * ShaEncript shaEncript = new ShaEncript(); String cyperText =
	 * shaEncript.encryptSHA256("1234"); // System.out.println("평문 : " + id);
	 * System.out.println("평문 : 1234"); System.out.println("암호문 : " + cyperText); }
	 * 
	 * @RequestMapping("/aria.do") public void aria(@RequestParam("id") String id) {
	 * String encryptionKey = "a123456789"; //키값(대칭키 기반=> 암호화키=복호화키) ☆소중하게 보관해야 할 값
	 * Aria aria = new Aria(encryptionKey);
	 * 
	 * String cyperText = aria.Encrypt(id); //암호화 String decryptionText =
	 * aria.Decrypt(cyperText); //복호화
	 * 
	 * System.out.println("평문 : " + id); System.out.println("암호문 : " + cyperText);
	 * System.out.println("복호문 : " + decryptionText); }
	 */
	
}
