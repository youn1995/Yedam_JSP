package board;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import common.FileRenamePolicy;

//파라미터 스트림 값을 바운드리(구분기호)로 잘라사 part배열로 만들어줌
@MultipartConfig(location = "D:/upload", maxRequestSize = 1024 * 1024 * 10) // 업로드하는 파일 사이즈제한
@WebServlet("/board/boardInsert.do")

public class BoardInsertServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardInsertServ() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("boardInsert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 등록처리
		request.setCharacterEncoding("UTF-8"); // post는따로 인코딩해줘야함 get은 자동으로 해줌 // 이게 작업하는것 보다 위에가야함 기존페이지랑 같은 값으로 해줘야함
												// 대소문자 상관없음

		BoardDAO dao = new BoardDAO();
		BoardVo boardVo = new BoardVo();

		try {
			BeanUtils.copyProperties(boardVo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}

		// 첨부파일 처리
		Part part = request.getPart("filename"); // input 타입이 filename
		String fileName = getFileName(part);
		String path = request.getServletContext().getRealPath("/images");
		System.out.println(path);
		if (fileName != null && !fileName.isEmpty()) {
			//파일명 중복체크
			File renameFile = FileRenamePolicy.rename(new File(path,fileName));
			part.write(path + "/" + renameFile.getName());
			boardVo.setFilename(renameFile.getName());
		}

		dao.insert(boardVo);

		response.sendRedirect("boardSelectAll.do");
	}

	private String getFileName(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
}
