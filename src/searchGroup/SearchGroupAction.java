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
		if(request.getParameter("bcategory") != null) bcategory = Integer.parseInt(request.getParameter("bcategory"));
		
		int typeList = 0;
		String searchInput = "";
		if(request.getParameter("searchInput") != null){
			searchInput = request.getParameter("searchInput");
			typeList = Integer.parseInt(request.getParameter("typeList"));
		}
		String searchCheck = "n";
		if(request.getParameter("searchCheck") != null) searchCheck = request.getParameter("searchCheck");
		
		String[] searchCategory = new String[0];
		int searchMembers = 0;
		int searchMeetcount = 0;
		int searchRegdate = 0;
		
		if(searchCheck.equals("y")){
			if(request.getParameter("members") != null) searchMembers = Integer.parseInt(request.getParameter("members"));
			if(request.getParameter("meetcount") != null) searchMeetcount = Integer.parseInt(request.getParameter("meetcount"));
			if(request.getParameter("regdate") != null) searchRegdate = Integer.parseInt(request.getParameter("regdate"));
			if(request.getParameter("category") != null) searchCategory = request.getParameterValues("category");
			if(request.getParameter("searchKeyword") != null) searchInput = request.getParameter("searchKeyword");
			bcategory = 0;
		}
		if(pageNum == null) pageNum = "1";
		
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		
		List<SearchListDTO> articleList = null;
		SearchListDAO dbPro = SearchListDAO.getInstance();
		if(searchCheck.equals("n")){
			if(request.getParameter("bcategory") != null){
				count = dbPro.getArticleCount(bcategory); //전체 글 개수
				if(count > 0){
					articleList = dbPro.getArticles(bcategory);
	//				count = articleList.size();
				}else { 
					articleList = Collections.emptyList();
				}
			}else{
				count = dbPro.getArticleCount(typeList,searchInput); //전체 글 개수
				if(count > 0){
					articleList = dbPro.getArticles(startRow,endRow,typeList,searchInput);
	//				count = articleList.size();
				}else { 
					articleList = Collections.emptyList();
				}
			}
		}else{
			count = dbPro.getArticleCount(bcategory,searchCategory,searchMembers,searchMeetcount,searchRegdate,searchInput); //전체 글 개수
			if(count > 0){
				articleList = dbPro.getArticles(startRow, endRow, bcategory,searchCategory,searchMembers,searchMeetcount,searchRegdate,searchInput);
			}else { 
				articleList = Collections.emptyList();
			}
		}
		
		number = count - (currentPage - 1) * pageSize;
		
		/* 처리 결과를 request객체에 저장 : 세션에 저장할 경우 - request.getSession()으로 세션얻어와서 저장 */
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("articleList", articleList);
		request.setAttribute("bcategoryNum", new Integer(bcategory));
		request.setAttribute("searchInput", searchInput);
		
		return "/searchGroup.jsp"; //같은 패키지 안이기 때문에 webContents 다음 경로부터
	} //end requestPro()

}
