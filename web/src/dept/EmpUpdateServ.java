package dept;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

/**
 * Servlet implementation class EmpUpdateServ
 */
@WebServlet("/dept/empUpdateServ")
public class EmpUpdateServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmpUpdateServ() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	/// 수정페이지로 이동
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 잡리스트
		List<JobVO> jlist = JobDAO.getInstance().selectAll();
		request.setAttribute("jList", jlist);
		// 부서리스트
		DeptDAO dao = new DeptDAO();
		ArrayList<DeptVo> dlist = dao.selectAll(null);
		request.setAttribute("dList", dlist);
		// 사원리스트
		List<EmpVO> elist = EmpDAO.getInstance().selectAll();
		request.setAttribute("empList", elist);
		// 사번으로 단건조회
		EmpVO emp = new EmpVO();
		emp.setEmployee_id(request.getParameter("employee_id"));
		emp = EmpDAO.getInstance().selectOne(emp);
		request.setAttribute("emp", emp);

		// 수정페이지로 이동 해당수정페이지 vaule에 단건조히한거 꾸역꾸역넣기
		request.getRequestDispatcher("empUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		EmpVO dto = new EmpVO();
		try {
			BeanUtils.copyProperties(dto, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		EmpDAO.getInstance().update(dto);
		response.sendRedirect("empSelectAll");
	}
}
