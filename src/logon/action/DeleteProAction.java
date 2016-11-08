package logon.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.CommandAction;
import logon.LogonDBBean;

public class DeleteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId"); //���ǿ� ����Ǿ� �ִ� id�� �����ͼ� ����.
		String passwd = request.getParameter("pw1");
		
		LogonDBBean manager = LogonDBBean.getInstance();
		int check = manager.deleteMember(id, passwd);
		
		if(check == 1) //���� ����
			session.invalidate();
		
		request.setAttribute("check", new Integer(check));
		
		return "/logon/deletePro.jsp";
	}

}
