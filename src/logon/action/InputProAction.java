package logon.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import logon.LogonDataBean;
import logon.LogonDBBean;

public class InputProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		LogonDataBean member = new LogonDataBean();
		member.setId(request.getParameter("id"));
		member.setPasswd(request.getParameter("passwd"));
		member.setName(request.getParameter("name"));
		member.setGender(request.getParameter("gender"));
		member.setTel(request.getParameter("tel"));
		member.setBirthday(request.getParameter("birthday"));
		member.setRegdate(new Timestamp(System.currentTimeMillis()));
		member.setEmail(request.getParameter("email"));
		member.setLocation(request.getParameter("location"));
		member.setScategorycode(request.getParameter("scategorycode"));
		member.setZzimlist(request.getParameter("zzimlist")); 
		
		LogonDBBean dbPro = LogonDBBean.getInstance();
		dbPro.insertMember(member);
		
		return "/logon/inputPro.jsp";
	} //end requestPro()

}
