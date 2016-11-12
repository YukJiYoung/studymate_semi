package addGroup.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.CommandAction;
import addGroup.addDAO;

public class ApplyPro implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		System.out.println("id="+id);
		String groupNum = request.getParameter("num"); 
		System.out.println("grouNum="+groupNum);
		if(id==null) {
			return "/addGroup/requestId.jsp";
		} 
		
		addDAO manager = addDAO.getInstance();
		int check = manager.applyPerson(id, groupNum);
		System.out.println("check="+check);
		return "/addGroup/groupPage.do";
	} //end requestPro() 

}
