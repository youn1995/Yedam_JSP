package eltest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/EltestServ1")
public class EltestServ1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EltestServ1() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//array
		String[] arr = {"키위였던것","바나나였던것","사과였던것"};
		request.setAttribute("fruit", arr);
		
		
		Member[] arr2 = {new Member("chichi", "초초초"), new Member("gigigi", "장장장")};
		request.setAttribute("user", arr2);
		
		//map
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("title", "첫번쨰");
		map.put("content", "첫번쨰내용");
		request.setAttribute("board", map);
		
		//vo
		request.setAttribute("login", new Member("gi","기장군"));
		
		//list
		ArrayList<Member> list = new ArrayList<>();
		list.add(new Member("kang","강강술래"));
		list.add(new Member("Lee","이강술래"));
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("eltest1.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
