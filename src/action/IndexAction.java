package action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import searchGroup.SearchListDAO;
import searchGroup.SearchListDTO;

public class IndexAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int bcategory = 1;
		if(request.getParameter("bcategory") != null)
			bcategory = Integer.parseInt(request.getParameter("bcategory"));
		
		int count = 0;
		
		List<SearchListDTO> articleList = null;
		SearchListDAO dbPro = SearchListDAO.getInstance();
		count = dbPro.getArticleCount(bcategory); //��ü �� ����
		
		if(count > 0){
			articleList = dbPro.getArticles(bcategory);
//			count = articleList.size();
		}else { 
			articleList = Collections.emptyList();
		}
		
		
		/* ó�� ����� request��ü�� ���� : ���ǿ� ������ ��� - request.getSession()���� ���Ǿ��ͼ� ���� */
		
		request.setAttribute("count", new Integer(count));
		request.setAttribute("bcategoryNum", new Integer(bcategory));
		request.setAttribute("articleList", articleList);
		
		return "/index.jsp";
		
	} //end requestPro()

}