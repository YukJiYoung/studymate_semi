package logon.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import logon.LogonDBBean;

public class LoginProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String url = request.getParameter("url");
		
		LogonDBBean manager = LogonDBBean.getInstance();
		int check = manager.userCheck(id, passwd);
		if(check == 1){
			request.getSession().setAttribute("memId", id);
		}
		request.setAttribute("url", url);
		request.setAttribute("check", new Integer(check));
		return "/logon/loginPro.jsp";
	}

}
