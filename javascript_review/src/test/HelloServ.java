package test;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServ
 */
//@WebServlet(urlPatterns = {"/hello","/deptSelect"},
//		loadOnStartup = 1
//		) //배열로 넣어도됨
//@WebServlet("/hello")
public class HelloServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HelloServ() {
		super();
		
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		System.out.println("init실행");
	}



	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("service 실행");
		System.out.println("client ip: " + request.getRemoteAddr());
		System.out.println("client agent: "+request.getHeader("User-Agent"));
		System.out.println("uri :" + request.getRequestURI());
		System.out.println("url :" + request.getRequestURL());
		System.out.println("query String: "+request.getQueryString());
		DeptDAO dao = new DeptDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		DeptVo dept = dao.selectOne(new DeptVo(id));
		request.setAttribute("dept", dept);
		request.getRequestDispatcher("deptSelect.jsp").forward(request, response);
	}


}
