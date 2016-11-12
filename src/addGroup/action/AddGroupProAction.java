package addGroup.action;

import java.sql.Timestamp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import addGroup.addDAO;
import addGroup.addDTO;


public class AddGroupProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		addDTO group = new addDTO();
		
		String id = (String)request.getSession().getAttribute("memId");
		String location = request.getParameter("location");
		
		
		group.setId(id); // 洹몃９�옣 �벑濡� 
		group.setCreateDate(new Timestamp(System.currentTimeMillis()));
		group.setGroupName(request.getParameter("groupName"));
		group.setMaxMember(Integer.parseInt(request.getParameter("maxMember")));
		group.setMoney(Integer.parseInt(request.getParameter("money")));
		group.setLimitDate(request.getParameter("limitDate"));
		group.setMeetingCount(Integer.parseInt(request.getParameter("meetcount")));
		group.setTel(request.getParameter("tel"));
		group.setBcategorycode(Integer.parseInt(request.getParameter("bcategorycode")));
		group.setScategorycode(request.getParameter("scategorycode"));
		group.setImagePath(request.getParameter("imagePath"));
		group.setLocation(location);
		group.setIntroduce(request.getParameter("introduce"));
		group.setGroupGoal(request.getParameter("groupGoal"));
		group.setTarget(request.getParameter("target"));
		
			
		addDAO dbPro = addDAO.getInstance();
		dbPro.addGroup(group);
		request.setAttribute("group", group);
		return "/addGroup/addGroupPro.jsp";
	} 

}
