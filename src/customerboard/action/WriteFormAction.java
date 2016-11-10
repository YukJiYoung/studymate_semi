package customerboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;

public class WriteFormAction implements CommandAction {//疫뀐옙 占쎌뿯占쎌젾 占쎈쨲 筌ｌ꼶�봺

    public String requestPro(HttpServletRequest request, HttpServletResponse response)throws Throwable {
       //占쎌젫筌뤴뫕占썸�⑨옙 占쎈뼗癰귨옙疫뀐옙占쎌벥 �뤃�됲뀋
        int qNum=0,ref=1,refStep=0,refLevel=0; 
        try{ 
          if(request.getParameter("qNum")!=null){
		 qNum=Integer.parseInt(request.getParameter("qNum"));
		 ref=Integer.parseInt(request.getParameter("ref"));
		 refStep=Integer.parseInt(request.getParameter("refStep"));
		 refLevel=Integer.parseInt(request.getParameter("refLevel"));
	   }
	}catch(Exception e){e.printStackTrace();}
		//占쎈퉸占쎈뼣 �뀎怨쀫퓠占쎄퐣 占쎄텢占쎌뒠占쎈막 占쎈꺗占쎄쉐
		request.setAttribute("qNum", new Integer(qNum));
		request.setAttribute("ref", new Integer(ref));
		request.setAttribute("refStep", new Integer(refStep));
		request.setAttribute("refLevel", new Integer(refLevel));

		return "/customerboard/MVC/question/writeForm.jsp";//占쎈퉸占쎈뼣 �뀎占�
	}
}