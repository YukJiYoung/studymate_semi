package addGroup.action;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.CommandAction;
import addGroup.addDAO;
import addGroup.addDTO;
import logon.LogonDataBean;

public class groupPageAction implements CommandAction  {

	
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		addDTO group = new addDTO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		addDAO dbPro = addDAO.getInstance();
		group = dbPro.loadGroupDB(num);
		request.setAttribute("group", group);
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		addDAO manager = addDAO.getInstance();
		List<LogonDataBean> member = manager.getMember(num);
		
		
		
		// 鍮꾪쉶�썝, 洹몃９�옣�뿉 �뵲�씪�꽌 異쒕젰�궡�슜�쓣 援щ텇 
		int check = manager.checkLeader(num, id);
		
		// DB�뿉 寃곌낵媛믪씠 �뾾�쓣 寃쎌슦 紐낆떆 (�삁�쇅諛⑹�瑜� �쐞�빐�꽌 �옉�꽦)
		if(member ==null) {
			request.setAttribute("member", member);
			return "/addGroup/groupPage.jsp?num=num";
		}
		// �쁽�옱 �뀈�룄瑜� 異쒕젰�븯湲� �쐞�빐 calendar媛앹껜 �깮�꽦
		Calendar today = Calendar.getInstance();
		int[] age = new int[member.size()];
		for (int i=0; i<member.size(); i++) {
			// �쁽�옱 �뀈�룄 - �깮�뀈�썡�씪�뿉�꽌 �뿰�룄 異붿텧 �삁) 2016-1990 = 26
			age[i] = today.get(Calendar.YEAR)- Integer.parseInt(member.get(i).getBirthday().substring(0,4));
		} 
		request.setAttribute("member", member);
		request.setAttribute("age", age);
		request.setAttribute("check", check);
		
		return "/addGroup/groupPage.jsp?num=num";
}
}  