package dept;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

/**
 * Servlet implementation class EmpInsertServ
 */
@WebServlet("/dept/empInsertServ")
public class EmpInsertServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public EmpInsertServ() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//직업챙기고
		List<JobVO> jlist = JobDAO.getInstance().selectAll();
		request.setAttribute("jList", jlist);
		//매니저 챙기고
		List<EmpVO> elist = EmpDAO.getInstance().selectAll();
		request.setAttribute("empList", elist);		
		//부서챙기고
		DeptDAO dao = new DeptDAO();
		ArrayList<DeptVo> dlist = dao.selectAll(null);
		request.setAttribute("dList", dlist);	
		
		request.getRequestDispatcher("employeeInsert.jsp").forward(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		EmpVO dto = new EmpVO();
		try {
			BeanUtils.copyProperties(dto, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		
		EmpDAO.getInstance().insert(dto);
		response.sendRedirect("empSelectAll");
	}

}
