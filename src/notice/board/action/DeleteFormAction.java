package notice.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;

public class DeleteFormAction implements CommandAction {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
		String pageNum = request.getParameter("pageNum");
		
		request.setAttribute("noticeNum", new Integer(noticeNum));
		request.setAttribute("pageNum", new Integer(pageNum));
		
		return "/notice/deleteForm.jsp";
	} //end requestPro()
	
}
