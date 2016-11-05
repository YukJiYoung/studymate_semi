package addGroup;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import addGroup.addDAO;
import addGroup.addDTO;


public class addGroupProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		addDTO group = new addDTO();
		
		group.setGroupName(request.getParameter("groupName"));
		group.setMaxMember(request.getParameter("maxMember"));
		group.setMoney(request.getParameter("maxMember"));
		group.setLimitDate(request.getParameter("limitDate"));
		group.setTel(request.getParameter("tel"));
		group.setBcategorycode(request.getParameter("bcategorycode"));
		group.setScategorycode(request.getParameter("scategorycode"));
		group.setRegQuestion(request.getParameter("regQuestion"));
		group.setGroupGoal(request.getParameter("groupGoal"));
		group.setTarget(request.getParameter("target"));
		group.setImagePath(request.getParameter("imagePath"));
		group.setLocation(request.getParameter("location"));
		group.setIntroduce(request.getParameter("introduce"));
		
		group.setGroupNum(request.getParameter("groupNum"));
		group.setId(request.getParameter("id"));
		group.setCreateDate(new Timestamp(System.currentTimeMillis()));
		group.setZzimCount(request.getParameter("zzimCount"));
		group.setNowMember(request.getParameter("nowMember"));
		
		
		addDAO dbPro = addDAO.getInstance();
		dbPro.addGroup(group);
		
		return "/addGroupPro.jsp";
	} 

}
