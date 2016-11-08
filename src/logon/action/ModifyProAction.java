package logon.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import logon.LogonDBBean;
import logon.LogonDataBean;

public class ModifyProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String id = (String)request.getSession().getAttribute("memId");
		
		LogonDataBean member = new LogonDataBean();
		member.setId(id);
		member.setPasswd(request.getParameter("passwd"));
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));
//		member.setBlog(request.getParameter("blog"));
//		member.setZipcode(request.getParameter("zipcode"));
//		member.setAddress(request.getParameter("address"));
		
		LogonDBBean dbPro = LogonDBBean.getInstance();
		dbPro.updateMember(member);
		
		
		
		return "/logon/modifyPro.jsp";
	}
}
