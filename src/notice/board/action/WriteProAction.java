package notice.board.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import notice.board.NoticeDAO;
import notice.board.NoticeDTO;

public class WriteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		NoticeDTO article = new NoticeDTO();
		article.setWriter(request.getParameter("writer"));
		article.setNoticeTitle(request.getParameter("noticeTitle"));
		article.setContent(request.getParameter("content"));
		article.setNoticeDate(new Timestamp(System.currentTimeMillis()));
		
		NoticeDAO dbPro = NoticeDAO.getInstance();
		dbPro.insertArticle(article);
		
		return "/notice/writePro.jsp";
	} //end requestPro()
	
}
