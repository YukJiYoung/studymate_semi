package notice.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;

public class WriteFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
//		int noticeNum = 0, ref = 1, re_step = 0, re_level = 0; //원글 정보 초기화
//		try{
//			if(request.getParameter("num") != null){ //원글의 정보가 있다면 (=답변글 이라면)
//				num = Integer.parseInt(request.getParameter("num")); //각 변수에 담고
//				if(request.getParameter("ref") != null) ref = Integer.parseInt(request.getParameter("ref"));
//				re_step = Integer.parseInt(request.getParameter("re_step"));
//				re_level = Integer.parseInt(request.getParameter("re_level"));
//				
//			}
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		
//		//request객체에 저장
//		request.setAttribute("noticeNum", new Integer(noticeNum));
//		request.setAttribute("ref", new Integer(ref));
//		request.setAttribute("re_step", new Integer(re_step));
//		request.setAttribute("re_level", new Integer(re_level));
				
		return "/notice/writeForm.jsp";
	} //end requestPro()
	
}
