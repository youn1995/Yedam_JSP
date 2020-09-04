package test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test/cookieAdd")
public class CookieAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		// 쿠키객체 생성
		Cookie cookie = new Cookie("id", "홍길동");
		// 쿠키경로설정
		cookie.setPath("/"); // 자기도메인은 전부 볼수있음
		// 쿠키유효시간
		cookie.setMaxAge(86400);
		// 쿠키 저장
		response.addCookie(cookie); // 쿠키는 디폴트로 같은 폴더안에서만 볼수있음

		// 쿠키객체 생성
		Cookie cookie2 = new Cookie("popupYn", "yes");
		// 쿠키경로설정
		cookie2.setPath("/"); // 자기도메인은 전부 볼수있음
		// 쿠키유효시간
		cookie2.setMaxAge(86400);
		// 쿠키 저장
		response.addCookie(cookie2); // 쿠키는 디폴트로 같은 폴더안에서만 볼수있음

		response.sendRedirect("cookieSelect.jsp");
	}

}
