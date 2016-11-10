package customerboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import customerboard.BoardDBBean;
import customerboard.BoardDataBean;

public class ContentAction implements CommandAction {//疫뀐옙占쎄땀占쎌뒠 筌ｌ꼶�봺

    public String requestPro(HttpServletRequest request, HttpServletResponse response)throws Throwable {
       
        int qNum = Integer.parseInt(request.getParameter("qNum"));//占쎈퉸占쎈뼣 疫뀐옙甕곕뜇�깈
        String pageNum = request.getParameter("pageNum");//占쎈퉸占쎈뼣 占쎈읂占쎌뵠筌욑옙 甕곕뜇�깈

        BoardDBBean dbPro = BoardDBBean.getInstance();//DB筌ｌ꼶�봺
        BoardDataBean article =  dbPro.getArticle(qNum);//占쎈퉸占쎈뼣 疫뀐옙甕곕뜇�깈占쎈퓠 占쏙옙占쎈립 占쎈퉸占쎈뼣 占쎌쟿�굜遺얜굡
        //占쎈퉸占쎈뼣 �뀎怨쀫퓠占쎄퐣 占쎄텢占쎌뒠占쎈막 占쎈꺗占쎄쉐
        
        request.setAttribute("qNum", new Integer(qNum));
        request.setAttribute("pageNum", new Integer(pageNum));
        request.setAttribute("article", article);
       
        return "/customerboard/MVC/content.jsp";//占쎈퉸占쎈뼣 �뀎占�
    }
}