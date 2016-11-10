package customerboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import customerboard.BoardDBBean;

public class DeleteProAction implements CommandAction {//疫뀐옙占쎄텣占쎌젫

    public String requestPro( HttpServletRequest request,
        HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("utf-8");

        int qNum = Integer.parseInt(request.getParameter("qNum"));
        String pageNum = request.getParameter("pageNum");
        String passwd = request.getParameter("passwd");
   
        BoardDBBean dbPro = BoardDBBean.getInstance();
        int check = dbPro.deleteArticle(qNum, passwd);

        //占쎈퉸占쎈뼣 �뀎怨쀫퓠占쎄퐣 占쎄텢占쎌뒠占쎈막 占쎈꺗占쎄쉐
        request.setAttribute("pageNum", new Integer(pageNum));
        request.setAttribute("check", new Integer(check));

        return "/customerboard/MVC/deletePro.jsp";//占쎈퉸占쎈뼣�뀎占�
    }
}
