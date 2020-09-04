package dept;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/dept/deptInsert")
public class DeptInsertServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeptInsertServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    //get: 부서등록페이지
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//지역정보
		// 싱글톤이라서 안써도 됨 LocationDAO dao = new LocationDAO();
		ArrayList<HashMap<String, String>> list = LocationDAO.getInstance().selectAll();
		request.setAttribute("locationList", list);
		//사원(매니저)정보
		EmpDAO edao = new EmpDAO();
		List<EmpVO> elist = edao.selectAll();
		request.setAttribute("empList", elist);
		
		request.getRequestDispatcher("deptInsertForm.jsp").forward(request,response);
	}
	
	//post:부서등록 처리
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("dept 등록실행");
		DeptDAO dao = new DeptDAO();
		DeptVo deptVo = new DeptVo();
		deptVo.setDepartment_id(Integer.parseInt(request.getParameter("department_id")));
		deptVo.setDepartment_name(request.getParameter("department_name"));
		deptVo.setLocation_id(Integer.parseInt(request.getParameter("location_id")));
		deptVo.setManager_id(Integer.parseInt(request.getParameter("manager_id")));
		dao.insert(deptVo);
		//전체 조회 서블릿 페이지로 이동
		response.sendRedirect("deptSelectAll");  //처리후 완전히 다른 처리를 할떄는 send
	}

}
