package dept;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeptSelectServ
 * 단건조회
 */
@WebServlet("/dept/deptSelect")
public class DeptSelectServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeptSelectServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//부서번호 파라미터로 조회한 결과를 select.jsp로 포워드
		
		//파라미터를 VO에담기
		DeptVo paramVo = new DeptVo();
		int department_id = Integer.parseInt(request.getParameter("department_id"));
		paramVo.setDepartment_id(department_id);
		
		//단건조회
		DeptDAO dao = new DeptDAO();
		DeptVo dept = dao.selectOne(paramVo);
		
		//조회결과 request저장
		request.setAttribute("dept", dept); //속성이름이 넘겨주는 jsp 페이지 속성명이랑 같아야함
		
		//view페이지로 이동 forward
		request.getRequestDispatcher("deptSelect.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
