package customerboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import customerboard.BoardDBBean;
import customerboard.BoardDataBean;

public class UpdateFormAction implements CommandAction {//疫뀐옙占쎈땾占쎌젟 占쎈쨲

    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        int qNum = Integer.parseInt(request.getParameter("qNum"));
        String pageNum = request.getParameter("pageNum");

        BoardDBBean dbPro = BoardDBBean.getInstance();
        BoardDataBean article =  dbPro.updateGetArticle(qNum);

	//占쎈퉸占쎈뼣 �뀎怨쀫퓠占쎄퐣 占쎄텢占쎌뒠占쎈막 占쎈꺗占쎄쉐
        request.setAttribute("pageNum", new Integer(pageNum));
        request.setAttribute("article", article);

        return "/customerboard/MVC/updateForm.jsp";//占쎈퉸占쎈뼣�뀎占�
    }
}