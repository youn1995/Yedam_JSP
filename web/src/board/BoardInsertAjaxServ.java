package board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class BoardInsertAjaxServ
 */
@WebServlet("/BoardInsertAjaxServ")
public class BoardInsertAjaxServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertAjaxServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardVo boardVo = new BoardVo();
		boardVo.setPoster(request.getParameter("poster"));
		boardVo.setSubject(request.getParameter("subject"));
		boardVo.setContents(request.getParameter("contents"));
		
		BoardDAO dao = new BoardDAO();
	    Integer no = dao.insert(boardVo);
	    boardVo.setNo(no.toString());
		
	    BoardVo bVo = new BoardVo();
	    bVo = dao.selectOne(boardVo);
		String result = JSONObject.fromObject(bVo).toString();
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
