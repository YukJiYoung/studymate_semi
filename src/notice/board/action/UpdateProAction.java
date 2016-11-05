package notice.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import notice.board.NoticeDAO;
import notice.board.NoticeDTO;

public class UpdateProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		String pageNum = request.getParameter("pageNum");
		String passwd = request.getParameter("passwd");
		
		NoticeDTO article = new NoticeDTO();
		article.setNoticeNum(Integer.parseInt(request.getParameter("noticeNum")));
		article.setWriter(request.getParameter("writer"));
		article.setNoticeTitle(request.getParameter("noticeTitle"));
		article.setContent(request.getParameter("content"));
		
		NoticeDAO dbPro = NoticeDAO.getInstance();
		int check = dbPro.updateArticle(article, passwd);
		
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("check", new Integer(check));
		
		return "/notice/updatePro.jsp";
	} //end requestPro()

}
