package action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import searchGroup.SearchListDAO;
import searchGroup.SearchListDTO;

public class IndexAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		return "/index.jsp";
		
	} //end requestPro()

}
