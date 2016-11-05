package notice.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import notice.board.NoticeDAO;
import notice.board.NoticeDTO;

public class ContentAction implements CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
		String pageNum = request.getParameter("pageNum");
		
		NoticeDAO dbPro = NoticeDAO.getInstance();
		NoticeDTO article = dbPro.getArticle(noticeNum);
		
		request.setAttribute("noticeNum", new Integer(noticeNum));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("article", article);
		
		return "/notice/content.jsp";
	} //end requestPro()
} 
