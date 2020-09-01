package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberStat
 */
@WebServlet("/member/memberStat.do")
public class MemberStat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberStat() {
        super();

    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터
		//db조회
		MemberDAO dao = new MemberDAO();
		
		//결과저장
		request.setAttribute("mailCnt", dao.getMailYnCnt());
		request.setAttribute("genderCnt", dao.getGenderCnt());
		//뷰페이지로 포워드
		request.getRequestDispatcher("memberStat.jsp").forward(request, response);
	}



}
