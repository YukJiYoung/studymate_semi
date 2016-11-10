package customerboard.action;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import customerboard.BoardDBBean;
import customerboard.BoardDataBean;

public class UpdateProAction implements CommandAction {

    public String requestPro( HttpServletRequest request,
        HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("utf-8");

        String pageNum = request.getParameter("pageNum");

	BoardDataBean article = new BoardDataBean();
        article.setqNum(Integer.parseInt(request.getParameter("qNum")));
        article.setqWriter(request.getParameter("qWriter"));
        article.setEmail(request.getParameter("email"));
        article.setqTitle(request.getParameter("qTitle"));
        article.setqContent(request.getParameter("qContent"));
        article.setPasswd(request.getParameter("passwd"));
   
	BoardDBBean dbPro = BoardDBBean.getInstance();
        int check = dbPro.updateArticle(article);

        request.setAttribute("pageNum", new Integer(pageNum));
        request.setAttribute("check", new Integer(check));

        return "/customerboard/MVC/updatePro.jsp";
    }
}