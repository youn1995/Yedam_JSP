package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.model.MemberDAO;
import com.dev.model.MemberVo;

public class MemberDeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서브컨트롤러 삭제 실행");
		
		String id = request.getParameter("id");
		
		if (id.isEmpty()) {
			request.setAttribute("error", "id를 입력");
			request.getRequestDispatcher("/member/memberDelete.jsp").forward(request, response);
		} else {
			MemberVo memVo = new MemberVo();
			memVo.setId(id);
			int r = MemberDAO.getInstance().delete(memVo);
			request.setAttribute("cnt", r);
			request.getRequestDispatcher("/member/memberDeleteOutput.jsp").forward(request, response);
		}
		
	}

}
