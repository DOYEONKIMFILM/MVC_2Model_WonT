package co.micol.prj;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	
	@RequestMapping("/")
	   public String home(HttpServletRequest request) {
	      String ip = request.getHeader("X-Forwarded-For");
	      if(ip == null) ip= request.getRemoteAddr();
	      System.out.println("접속한 IP"+ip); 
	      return "home/home";
	   }
	
	@RequestMapping("/home.do")
	public String home() {
		return "home/home";
	}
}
