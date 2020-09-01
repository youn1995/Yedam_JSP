package member;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

@WebServlet("/member/memberInsert.do")
public class MemberInsertServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberInsertServ() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//등록페이지로 이동
		request.getRequestDispatcher("memberInsert.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 등록처리
		request.setCharacterEncoding("UTF-8"); // post는따로 인코딩해줘야함 get은 자동으로 해줌 // 이게 작업하는것 보다 위에가야함 기존페이지랑 같은 값으로 해줘야함 대소문자 상관없음
 		MemberDAO dao = new MemberDAO();
		MemberVo memVo = new MemberVo();		
		
//		 memVo.setId(request.getParameter("id"));
//		  memVo.setPw(request.getParameter("pw"));
//		  memVo.setGender(request.getParameter("gender"));
//		  memVo.setJob(request.getParameter("job"));
//		  
//		  String mail = null; if(request.getParameter("mailYn") != null) { mail = "Y";
//		  } else { mail = "N"; } memVo.setMailyn(mail);
//		  
//		 memVo.setReason(request.getParameter("reason"));
		 
		try {
			BeanUtils.copyProperties(memVo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		System.out.println("============map===============");
		Map<String, String[]> map = request.getParameterMap();
		System.out.println("id: "+map.get("id")[0]);
		
		System.out.println("=============names==============");
		Enumeration<String> pnames = request.getParameterNames();
		while(pnames.hasMoreElements()) {
			System.out.println(pnames.nextElement());
		}
		System.out.println("=================hobby===================");
		//checkbox 값받기
		String strHobby = "";
		String[] hobby = request.getParameterValues("hobby");
		if(hobby != null) {
			for(String temp : hobby) {
				strHobby += temp +"/";
			}
		}
		System.out.println(Arrays.toString(hobby));
		memVo.setHobby(strHobby);
		System.out.println();
		
		dao.insert(memVo);
		
		response.sendRedirect("memberSelectAll.do");
		
		
		
	}

}
