package logon.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import logon.LogonDBBean;

public class ChangePwProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		
		LogonDBBean manager = LogonDBBean.getInstance();
		String cpasswd = manager.changePasswd(id, email, name); 
		
		request.setAttribute("cpasswd", cpasswd);
		
		return "/logon/changePwPro.jsp";
	}

}
