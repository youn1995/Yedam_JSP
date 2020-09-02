package member;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

@WebServlet("/member/memberUpdate")
public class MemberUpdateServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//수정페이지로 이동
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("memberUpdate.jsp").forward(request, response);
	}
	
	//수정 처리
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		MemberVo member = (MemberVo) request.getSession().getAttribute("login");
		
		MemberVo memVo = new MemberVo();
		try {
			BeanUtils.copyProperties(memVo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		if(memVo.getGender() == null) {
			memVo.setGender(member.getGender());
		}
		if(memVo.getJob().equals("")) {
			memVo.setJob(member.getJob());
		}
		if(memVo.getMailyn() == null) {
			memVo.setMailyn(member.getMailyn());
		}
		
		String strHobby = "";
		String[] hobby = request.getParameterValues("hobby");
		if (hobby != null) {
			for (String temp : hobby) {
				strHobby += temp + "/";
			}
		}
		System.out.println(Arrays.toString(hobby));
		memVo.setHobby(strHobby);
		
		
		if(memVo.getRegdate() == null) {
			memVo.setRegdate(member.getRegdate());
		}
		
		MemberDAO.getInstance().update(memVo);
		response.sendRedirect("memberSelectAll.do");
	}

}
