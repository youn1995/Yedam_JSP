package test;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test/cartAdd")
public class CartAddServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//배열용 cnt
	//int cnt = 0;
	// 상품조회
	protected void doGet(HttpServletRequest requset, HttpServletResponse response)
			throws ServletException, IOException {
		requset.getRequestDispatcher("goodsList.jsp").forward(requset, response);
	}

	// 장바구니 등록
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 세션에서 장바구니 목록조회
		//String[] cartList = (String[]) request.getSession().getAttribute("cartList");
		
		@SuppressWarnings("unchecked")
		ArrayList<String> cartList = (ArrayList<String>) request.getSession().getAttribute("cartList");
		// cartList가 null 이면 String [] 초기화 session에 추가
		if(cartList == null) {
			cartList = new ArrayList<String>();
			request.getSession().setAttribute("cartList", cartList);
		}
		// 선택한 상품(파라미터)를 cartList에 추가 getParameter

		
//		for(int i = 0; i<cartList.length; i++) {
//			if(cartList[i] == null) {
//				cartList[i] = request.getParameter("goods");
//				break;
//			}
//		}
		//필드 사용해서 하는거
		//cartList[cnt++] = request.getParameter("goods");
		cartList.add(request.getParameter("goods"));
		// 상품조회 페이지로 이동
		response.sendRedirect("cartAdd");

	}

}
