package customerboard.action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import customerboard.BoardDBBean;

public class ListAction implements CommandAction {//疫뀐옙筌뤴뫖以� 筌ｌ꼶�봺

    public String requestPro(HttpServletRequest request,
        HttpServletResponse response)throws Throwable {
       
    	request.setCharacterEncoding("UTF-8");
        String pageNum = request.getParameter("pageNum");//占쎈읂占쎌뵠筌욑옙 甕곕뜇�깈

        if (pageNum == null) {
            pageNum = "1";
        }
           
    	String search = request.getParameter("search");	
    	int searchn = 0;
    	
        if(search == null) {
    		search = "";
    	} else {
    		searchn = Integer.parseInt(request.getParameter("searchn"));
    	}

        
   
        int pageSize = 10;//占쎈립 占쎈읂占쎌뵠筌욑옙占쎌벥 疫뀐옙占쎌벥 揶쏆뮇�땾
        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * pageSize + 1;//占쎈립 占쎈읂占쎌뵠筌욑옙占쎌벥 占쎈뻻占쎌삂疫뀐옙 甕곕뜇�깈
        int endRow = currentPage * pageSize;//占쎈립 占쎈읂占쎌뵠筌욑옙占쎌벥 筌띾뜆占쏙쭕占� 疫뀐옙甕곕뜇�깈
        int count = 0;
        int number=0;

        List articleList = null;
        BoardDBBean dbPro = BoardDBBean.getInstance();//DB占쎈염占쎈짗
        
        if(search.equals("") || search == null)
    		count = dbPro.getArticleCount();
    	else
    		count = dbPro.getArticleCount(searchn,search);
       
        if (count > 0) {
        	if(search.equals("") || search == null){
    			articleList = dbPro.getArticles(startRow, endRow);
        	}else{
    			articleList = dbPro.getArticles(startRow, endRow, searchn, search);  
        	}
        } else {
            articleList = Collections.EMPTY_LIST;
        }

        
        number=count-(currentPage-1)*pageSize;//疫뀐옙筌뤴뫖以됵옙肉� 占쎈ご占쎈뻻占쎈막 疫뀐옙甕곕뜇�깈
        //占쎈퉸占쎈뼣 �뀎怨쀫퓠占쎄퐣 占쎄텢占쎌뒠占쎈막 占쎈꺗占쎄쉐
        request.setAttribute("currentPage", new Integer(currentPage));
        request.setAttribute("startRow", new Integer(startRow));
        request.setAttribute("endRow", new Integer(endRow));
        request.setAttribute("count", new Integer(count));
        request.setAttribute("pageSize", new Integer(pageSize));
        request.setAttribute("number", new Integer(number));
        request.setAttribute("articleList", articleList);
       
        return "/customerboard/MVC/list.jsp";//占쎈퉸占쎈뼣 �뀎占�
    }
}










