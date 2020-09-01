package board;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;


/**
 * Servlet implementation class BoardInsertServ
 */
@WebServlet("/board/boardInsert.do")
public class BoardInsertServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public BoardInsertServ() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("boardInsert.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 등록처리
				request.setCharacterEncoding("UTF-8"); // post는따로 인코딩해줘야함 get은 자동으로 해줌 // 이게 작업하는것 보다 위에가야함 기존페이지랑 같은 값으로 해줘야함 대소문자 상관없음
		 		
				BoardDAO dao = new BoardDAO();
				BoardVo boardVo = new BoardVo();
		 
				try {
					BeanUtils.copyProperties(boardVo, request.getParameterMap());
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
				
				dao.insert(boardVo);
				
				response.sendRedirect("boardSelectAll.do");			
	}

}
