package logon.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import logon.LogonDBBean;

public class SearchIdAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		
		LogonDBBean manager = LogonDBBean.getInstance();
		String id = manager.searchId(email, name );
		
		request.setAttribute("id", id);
		
		return "/logon/searchId.jsp";
	}

}
