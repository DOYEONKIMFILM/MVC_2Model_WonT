package com.yeon.cvd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yeon.cvd.common.Command;
import com.yeon.cvd.member.service.Covid19MemberService;
import com.yeon.cvd.member.service.Covid19MemberVO;
import com.yeon.cvd.serviceImpl.Covid19MemberServiceImpl;

public class LoginController implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// Login.do 로그인이 진행될 수 있는 기능을 코딩하는 공간
		Covid19MemberService covid19memberDAO = new Covid19MemberServiceImpl();
		Covid19MemberVO vo = new Covid19MemberVO();
		
		// 세션 객체를 가져옴
		HttpSession session = request.getSession();
		
		vo.setPhoneNumber(request.getParameter("phoneNumber"));
		vo.setPassword(request.getParameter("password"));
		
		vo = covid19memberDAO.memberSelectOne(vo);
		
		if(vo != null) {
			session.setAttribute("phoneNumber", vo.getPhoneNumber());
			session.setAttribute("name", vo.getName());
			session.setAttribute("startDate", vo.getStartDate());
			request.setAttribute("message", vo.getName() + "님 로그인에 성공했습니다.");
		} else {
			request.setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		return "covid19member/memberLoginResult";
	}

}
