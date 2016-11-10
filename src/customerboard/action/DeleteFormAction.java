package customerboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;

public class DeleteFormAction implements CommandAction {//疫뀐옙占쎄텣占쎌젫 占쎈쨲

    public String requestPro(HttpServletRequest request,
        HttpServletResponse response) throws Throwable {

        int qNum = Integer.parseInt(request.getParameter("qNum"));
        String pageNum = request.getParameter("pageNum");

	//占쎈퉸占쎈뼣 �뀎怨쀫퓠占쎄퐣 占쎄텢占쎌뒠占쎈막 占쎈꺗占쎄쉐
	request.setAttribute("qNum", new Integer(qNum));
        request.setAttribute("pageNum", new Integer(pageNum));

        return "/customerboard/MVC/deleteForm.jsp";//占쎈퉸占쎈뼣�뀎占�
    }
}