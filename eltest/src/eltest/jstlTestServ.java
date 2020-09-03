package eltest;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/jstlTestServ")
public class jstlTestServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public jstlTestServ() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("today", new Date());
		request.setAttribute("todayStr", "2020/01/01");
		request.setAttribute("price", 1200000);
		request.setAttribute("priceStr", "1200000");
		request.getRequestDispatcher("jstlTest.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
