package model2.mvcmember;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mvcboard/login.do")
public class LoginController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		//로그인 폼에서 입력한 아이디, 패스워드를 받는다.
		String userId = req.getParameter("user_id");
		String userPwd = req.getParameter("user_pw");

		//위 정보를 통해 DAO객체를 생성하고 이때 오라클에 연결된다. 
		MVCMemberDAO dao = new MVCMemberDAO();
		//폼값으로 받은 아이디, 패스워드를 인수로 전달하여 로그인 처리를 위한 쿼리를 
		//실행한다. getMemberDTO()를 호출
		MVCMemberDTO dto = dao.selectUser(userId, userPwd);
		//자원 해제
		dao.close();

		if(dto.getId() != null){
			// 로그인에 성공한 경우라면...
			// 세션영역에 회원아이디와 이름을 저장한다.
			req.getSession().setAttribute("Id", dto.getId());
			req.getSession().setAttribute("Name", dto.getName());
			req.getSession().setAttribute("UserIdx", dto.getUser_idx());
			// 그리고 로그인 페이지로 '이동'한다.
			resp.sendRedirect("../mvcboard/list.do");
		}
		else{
			// 로그인에 실패한 경우라면...
			// 리퀘스트 영역에 에러메세지를 저장한다.
			req.setAttribute("LoginErrMsg", "로그인 오류입니다.");
			// 그리고 로그인 페이지로 '포워드'한다.
			req.getRequestDispatcher("../MVCMember/LoginForm.jsp").forward(req, resp);
		}
	}
}
