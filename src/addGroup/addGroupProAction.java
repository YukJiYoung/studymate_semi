package addGroup;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;


public class addGroupProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		addDTO group = new addDTO();
		
		group.setGroupName(request.getParameter("groupName"));
		group.setMaxMember(Integer.parseInt(request.getParameter("maxMember")));
		group.setMoney(request.getParameter("money"));
		group.setLimitDate(request.getParameter("limitDate"));
		group.setPossibleDay(request.getParameter("possibleDay"));
		group.setTel(request.getParameter("tel"));
		group.setBc(request.getParameter("bc"));
		group.setSc(request.getParameter("sc"));
		group.setGroupGoal(request.getParameter("groupGoal"));
		group.setTarget(request.getParameter("target"));
		group.setGroupImage(request.getParameter("groupImage"));
		group.setLocation(request.getParameter("location"));
		group.setIntroduce(request.getParameter("introduce"));
		group.setCreateDate(new Timestamp(System.currentTimeMillis()));
		
		
		
		addDAO dbPro = addDAO.getInstance();
		dbPro.addGroup(group);
		
		return "/addGroupPro.jsp";
	} 

}
