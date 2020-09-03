package common;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class FilterOne
 */
@WebFilter(filterName = "first") // 모든 요청일때 /* 사용 확장자로 하고 싶으면 *.do /넣으면 안됨 특정 거에 하고싶으면 /member/*
//필터순서를 변경할려면 web.xml 참고
public class FilterOne implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//서블릿전에 호출전에 처리할 내용(인코딩)
		System.out.println("encoding filter 실행됨");
		request.setCharacterEncoding("UTF-8");
		
		
		//다음 필터 또는 호출된 서블릿을 실행
		chain.doFilter(request, response);
		
		//서블릿 실행 후에 처리할 내용			
		System.out.println("처리완료: "+((HttpServletRequest) request).getRequestURI());
	}


	public void init(FilterConfig fConfig) throws ServletException {}
	@Override
	public void destroy() {}

}
