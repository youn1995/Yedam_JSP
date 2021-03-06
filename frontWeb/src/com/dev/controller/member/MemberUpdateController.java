package com.dev.controller.member;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.dev.common.Controller;
import com.dev.dao.MemberDAO;
import com.dev.model.MemberVo;

public class MemberUpdateController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서브컨트롤러 업데이트 실행");

		MemberVo memVo = new MemberVo();
		 
		// 유효성처리
		if (memVo.getMailyn() != null) {
			memVo.setMailyn("Y");
		} else {
			memVo.setMailyn("N");
		}

		String strHobby = "";
		String[] hobby = request.getParameterValues("hobby");
		if (hobby != null) {
			for (String temp : hobby) {
				strHobby += temp + "/";
			}
		}
		memVo.setHobby(strHobby);

		// 서비스처리
		int r = MemberDAO.getInstance().update(memVo);

		// 결과 저장
		request.setAttribute("cnt", r); // 이미 request 안에 member에 대한 정보가 들어있음

		// 뷰페이지로 이동
		request.getRequestDispatcher("/member/memberUpdateOutput.jsp").forward(request, response);

	}

}
