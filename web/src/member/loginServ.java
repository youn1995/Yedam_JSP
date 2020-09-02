package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class loginServ
 */
@WebServlet({ "/member/login", "/member/logout" })
public class loginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// logout
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().invalidate();
		response.sendRedirect("../index.jsp");
	}

	// login
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.파라미터 보에 담고
		MemberVo memberVo = new MemberVo();
		memberVo.setId(request.getParameter("id"));
		memberVo.setPw(request.getParameter("pw"));

		// 2.서비스 처리(db)
		// 싱글톤사용
		MemberVo resultVo = MemberDAO.getInstance().selectOne(memberVo);

		// 3.결과저장
		String page = "";
		if (resultVo == null) { // 아이디없음
			request.setAttribute("errormsg", "아이디가 음슴");
			page = "login.jsp";
		} else {
			if (memberVo.getPw().equals(resultVo.getPw())) { // 로그인성공
				request.getSession().setAttribute("login", resultVo); // vo 자체를 저장
				request.getSession().setAttribute("id", resultVo.getId()); // id만 따로 저장
				page = "../index.jsp";
			} else { // 패스워드 불일치
				request.setAttribute("errormsg", "패스워드 틀림");
				page = "login.jsp";
			}
		}
		// 4.뷰페이지이동 포워드 리다이렉트 또는 뷰페이지 출력
		request.getRequestDispatcher(page).forward(request, response);
	}

}
