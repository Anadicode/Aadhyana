package Filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.mysql.cj.Session;

/**
 * Servlet Filter implementation class AuthenticationFilter
 */
@WebFilter("/*")
public class AuthenticationFilter extends HttpFilter implements Filter {
       
    
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		String path = req.getRequestURI();
		String contextPath = req.getContextPath();
		
		String requestPath=path.substring(contextPath.length());
		
	    if(requestPath.equals("/")  || requestPath.equals("/login")) {
	    	chain.doFilter(req, res);
	    	return;
	    }
	    
	    HttpSession session = req.getSession(false);
	    
	    if(session!=null && session.getAttribute("user")!=null) {
	    	chain.doFilter(req, res);
	    	
	    }else {

            // User is not authenticated
            res.sendRedirect(
                contextPath + "/login"
            );
        }
		
	}

	
}
