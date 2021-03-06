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

public class MemberInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서브컨트롤러 인서트 실행");
		// 파라미터를 Vo에 담기
		MemberVo memVo = new MemberVo();
		try {
			BeanUtils.copyProperties(memVo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}

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
		int r = MemberDAO.getInstance().insert(memVo);

		// 결과 저장
		request.setAttribute("cnt", r); // 이미 request 안에 member에 대한 정보가 들어있음

		// 뷰페이지로 이동
		request.getRequestDispatcher("/member/memberInsertOutput.jsp").forward(request, response);

	}

}
