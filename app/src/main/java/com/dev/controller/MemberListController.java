package com.dev.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.model.MemberDAO;
import com.dev.model.MemberVo;

public class MemberListController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서브컨트롤러 리스트실행");
		//파라미터
		
		//유효성 체크
		
		//vo담기
		
		//서비스처리
		ArrayList<MemberVo> list = MemberDAO.getInstance().selectAll(null);
		//결과저장
		request.setAttribute("list", list);
		//페이지이동
		request.getRequestDispatcher("/member/memberAll.jsp").forward(request,response);
	}

}
