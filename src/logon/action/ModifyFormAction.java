package logon.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import logon.LogonDBBean;
import logon.LogonDataBean;

public class ModifyFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = (String)request.getSession().getAttribute("memId"); //���ǿ� ���� �� �� id���� �����ͼ� ���� 'id'��  ����
		
		LogonDBBean manager = LogonDBBean.getInstance();
		LogonDataBean member = manager.getMember(id);
		
		request.setAttribute("member", member);
		
		return "/logon/modifyForm.jsp";
	} //end requestPro()

}
