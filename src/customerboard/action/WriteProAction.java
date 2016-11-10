package customerboard.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import customerboard.BoardDBBean;
import customerboard.BoardDataBean;

public class WriteProAction implements CommandAction {// 占쎌뿯占쎌젾占쎈쭆 疫뀐옙 筌ｌ꼶�봺

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");// 占쎈립疫뀐옙 占쎌뵥�굜遺얜뎃
		System.out.println(request.getParameter("qNum"));
		BoardDataBean article = new BoardDataBean();// 占쎈쑓占쎌뵠占쎄숲筌ｌ꼶�봺 �뜮占�
		article.setqNum(Integer.parseInt(request.getParameter("qNum")));
		
		article.setqWriter(request.getParameter("qWriter"));
		article.setEmail(request.getParameter("email"));
		article.setqTitle(request.getParameter("qTitle"));
		article.setPasswd(request.getParameter("passwd"));
		article.setqDate(new Timestamp(System.currentTimeMillis()));
		article.setRef(Integer.parseInt(request.getParameter("ref")));
		article.setRefStep(Integer.parseInt(request.getParameter("refStep")));
		article.setRefLevel(Integer.parseInt(request.getParameter("refLevel")));
		article.setqContent(request.getParameter("qContent"));
		article.setIp(request.getRemoteAddr());

		BoardDBBean dbPro = BoardDBBean.getInstance();// DB筌ｌ꼶�봺
		dbPro.insertArticle(article);

		return "/customerboard/MVC/writePro.jsp";
	}
}