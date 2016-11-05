package searchGroup;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;

public class SearchGroupAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String pageNum = request.getParameter("pageNum");
		int bcategory = 1;
		if(request.getParameter("bcategory") != null) 
			bcategory = Integer.parseInt(request.getParameter("bcategory"));
		
		if(pageNum == null)
			pageNum = "1";
		
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		
		List<SearchListDTO> articleList = null;
		SearchListDAO dbPro = SearchListDAO.getInstance();
//		count = dbPro.getArticleCount(); //��ü �� ����
		
		if(count > 0){
			articleList = dbPro.getArticles(startRow, endRow, bcategory);
			count = articleList.size();
		}else { 
			articleList = Collections.emptyList();
		}
		
		number = count - (currentPage - 1) * pageSize;
		
		/* ó�� ����� request��ü�� ���� : ���ǿ� ������ ��� - request.getSession()���� ���Ǿ��ͼ� ���� */
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("articleList", articleList);
		request.setAttribute("bcategoryNum", new Integer(bcategory));
		
		
		return "/searchGroup.jsp"; //���� ��Ű�� ���̱� ������ webContents ���� ��κ���
	} //end requestPro()

}
