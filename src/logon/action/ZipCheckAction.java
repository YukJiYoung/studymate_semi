package logon.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import logon.LogonDBBean;
import logon.ZipcodeBean;

public class ZipCheckAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		request.setCharacterEncoding("utf-8");

		String check = request.getParameter("check"); //n (ó�� â ����� �� 'y'�� �Ѱ���.)
		String area4 = request.getParameter("area4"); //���̸�
		
		LogonDBBean manager = LogonDBBean.getInstance();
		Vector<ZipcodeBean> zipcodeList = manager.zipcodeRead(area4); //vector��ü�� ���� �� �˻������ ��´�. ���ٸ� size=0
		int totalList = zipcodeList.size(); //zipcodeList ������ ��ŭ for�� ������ ���� totalList ������ ��´�.
		
		System.out.println(totalList);
		System.out.println(check);
		request.setAttribute("check", check);
		request.setAttribute("totalList", new Integer(totalList));
		request.setAttribute("zipcodeList", zipcodeList);
		
		return "/logon/zipCheck.jsp";
	}

}
