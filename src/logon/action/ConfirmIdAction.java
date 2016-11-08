package logon.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import logon.LogonDBBean;

public class ConfirmIdAction implements CommandAction {

	@Override
	 public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//System.out.println("3");
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String checkId = request.getParameter("checkId");
		
		LogonDBBean manager = LogonDBBean.getInstance();
		int check = manager.confirmId(id); //confirmId(id) ������ 'check'�� ����. ���� �� x�� '1' �̸� '�ش� ���̵� ����.'
		
		request.setAttribute("id", id);
		request.setAttribute("checkId", checkId);
		request.setAttribute("check", new Integer(check));
		return "/logon/confirmId.jsp";
	}

}
