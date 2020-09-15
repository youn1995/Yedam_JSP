package board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class BoardSelectOneAjaxServ
 */
@WebServlet("/BoardSelectOneAjaxServ")
public class BoardSelectOneAjaxServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSelectOneAjaxServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String bno = request.getParameter("bno");
		BoardVo bVo = new BoardVo();
		bVo.setNo(bno);
		BoardDAO dao = new BoardDAO();
		bVo = dao.selectOne(bVo);
		String result = JSONObject.fromObject(bVo).toString();
		response.getWriter().print(result);
	}



}
