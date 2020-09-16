package com.dev.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.dao.MemberDAO;
import com.dev.model.MemberVo;

public class MemberSearchController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서브컨트롤러 조회 실행");
		// job에 따라서 포워드 페이지 지정
		String path = "/member/memberSearch.jsp";
		String pathRe = "/member/memberSearchOutPut.jsp";
		String dos = request.getParameter("dos");
		
		if (dos.equals("delete")) {
			path = "/member/memberDelete.jsp";
			pathRe = path;
		} else if(dos.equals("update")) {
			path = "/member/memberUpdate.jsp";
			pathRe = path;
		}

		String id = request.getParameter("id");
		if (id.isEmpty()) {
			request.setAttribute("error", "id를 입력");
			request.getRequestDispatcher(path).forward(request, response);
		} else {
			MemberVo memVo = new MemberVo();
			memVo.setId(id);
			memVo = MemberDAO.getInstance().selectOne(memVo);
			if (memVo == null) {
				request.setAttribute("error", "없는사용자입니다");
			}
			request.setAttribute("memVo", memVo);
			request.getRequestDispatcher(pathRe).forward(request, response);
		}
	}

}
