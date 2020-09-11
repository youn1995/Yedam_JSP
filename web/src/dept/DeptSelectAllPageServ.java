package dept;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;

/**
 * Servlet implementation class DeptSelectAllServ
 */
@WebServlet("/dept/deptSelectAllPage") //send하는 url과 받는곳이 같아야함
public class DeptSelectAllPageServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeptSelectAllPageServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DeptDAO dao = new DeptDAO();
		String p = request.getParameter("p");
		int page = 1;
		if (p != null) {
			page= Integer.parseInt(p);
		}
		Paging paging = new Paging();
		paging.setPageUnit(5);
		paging.setPageSize(3);
		paging.setPage(page);
		DeptVo deptVo = new DeptVo();
		deptVo.setDepartment_name(request.getParameter("department_name"));
		paging.setTotalRecord(dao.count(deptVo));
		
		deptVo.setStartNum(paging.getFirst());
		deptVo.setLastNum(paging.getLast());
		
		System.out.println("dept 전체조회 실행");
		
		ArrayList<DeptVo> list = dao.selectAllPage(deptVo);
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.getRequestDispatcher("deptSelectAllPage.jsp").forward(request, response);
	}	//현재 필요한 정보를 챙겨서 가야할떄는 forward

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
