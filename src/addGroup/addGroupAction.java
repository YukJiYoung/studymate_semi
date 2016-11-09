package addGroup;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;

public class addGroupAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int groupNum=0, zzimCount=0, nowMember=1;
		
		try{ 
			if(request.getParameter("groupNum")!=null){
				 groupNum=Integer.parseInt(request.getParameter("groupNum"));
				 zzimCount = Integer.parseInt(request.getParameter("zzimCount"));
				 nowMember = Integer.parseInt(request.getParameter("nowMember"));
			}
		} catch(Exception e){e.printStackTrace();}
		request.setAttribute("groupNum", new Integer(groupNum));
		request.setAttribute("zzimCount", new Integer(zzimCount));
		request.setAttribute("nowMember", new Integer(nowMember));
		
		return "/addGroup.jsp";
	}

}
