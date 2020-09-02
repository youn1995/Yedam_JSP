package test;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/context3")
public class ServletContextTestServ2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//브라우저를 닫든말든 서버안에서 값이 공유됨
		ServletContext application = this.getServletContext();
		ShareObject obj1 =new ShareObject();
		obj1.setCount(1);
		obj1.setStr("객체공유1");
		application.setAttribute("data1", obj1);
		resp.getWriter().append("data set");
	}
	
	
	

}
