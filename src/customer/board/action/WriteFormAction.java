package customer.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction; 

public class WriteFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

//		System.out.println(request.getParameter("num")+" : "+(request.getParameter("num") instanceof String));
//		System.out.println(request.getParameter("ref")+" : "+(request.getParameter("ref") instanceof String));
//		System.out.println(request.getParameter("re_step")+" : "+(request.getParameter("re_step") instanceof String));
//		System.out.println(request.getParameter("re_level")+" : "+(request.getParameter("re_level") instanceof String));
		
		int num = 0, ref = 1, re_step = 0, re_level = 0; //���� ���� �ʱ�ȭ
		try{
			if(request.getParameter("num") != null){ //������ ������ �ִٸ� (=�亯�� �̶��)
				num = Integer.parseInt(request.getParameter("num")); //�� ������ ���
				if(request.getParameter("ref") != null) ref = Integer.parseInt(request.getParameter("ref"));
				re_step = Integer.parseInt(request.getParameter("re_step"));
				re_level = Integer.parseInt(request.getParameter("re_level"));
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		//request��ü�� ����
		request.setAttribute("num", new Integer(num));
		request.setAttribute("ref", new Integer(ref));
		request.setAttribute("re_step", new Integer(re_step));
		request.setAttribute("re_level", new Integer(re_level));
				
		return "/customer/writeForm.jsp";
	} //end requestPro()
	
}