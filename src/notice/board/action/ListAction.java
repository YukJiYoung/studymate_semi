package notice.board.action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.javafx.image.impl.IntArgb;

import notice.board.BoardDBBean;

public class ListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null){
			pageNum = "1";
		}
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		
		List articleList = null;
		BoardDBBean dbPro = BoardDBBean.getInstance();
		count = dbPro.getArticleCount(); //전체 글 개수
		
		if(count > 0){
			articleList = dbPro.getArticles(startRow, endRow);
		}else { 
			articleList = Collections.EMPTY_LIST;
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
		
		return "/notice/list.jsp"; //같은 패키지 안이기 때문에 webContents 다음 경로부터
	} //end requestPro()

}
