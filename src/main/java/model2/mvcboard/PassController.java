//package model2.mvcboard;
//
//import java.io.IOException;
//
//import fileupload.FileUtil;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import utils.JSFunction;
//
//@WebServlet("/mvcboard/pass.do")
//public class PassController extends HttpServlet
//{
//	private static final long serialVersionUID = 1L;
//	
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
//			throws ServletException, IOException
//	{
//		req.setAttribute("mode", req.getParameter("mode"));
//		req.getRequestDispatcher("/MVCBoard/Pass.jsp").forward(req, resp);
//	}
//	
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
//			throws ServletException, IOException
//	{
//		String board_idx = req.getParameter("board_idx");
//		String mode = req.getParameter("mode");
//		String pass = req.getParameter("pass");
//		MVCBoardDAO dao = new MVCBoardDAO();
////		boolean confirmed = dao.confirmPassword(pass, board_idx);
//		dao.close();
//		
//		if(confirmed)
//		{
//			if(mode.equals("edit"))
//			{
//				HttpSession session = req.getSession();
//				session.setAttribute("pass", pass);
//				resp.sendRedirect("../mvcboard/edit.do?board_idx=" + board_idx);
//			} else if(mode.equals("delete"))
//			{
//				dao = new MVCBoardDAO();
//				MVCBoardDTO dto = dao.selectView(board_idx);
//				if(dto.getUser_i  dx().equals(req.getParameter("UserId")))
//				{
//					int result = dao.deletePost(dto);
//				}
//				dao.close();
//				
//				if(result == 1)
//				{
//					String saveFileName = dto.getSfile();
//					FileUtil.deleteFile(req, "/Uploads", saveFileName);
//				}
//				JSFunction.alertLocation(resp, "삭제되었습니다", "../mvcboard/list.do");
//			}
//		} else
//		{
//			JSFunction.alertBack(resp, "비밀번호 검증에 실패했습니다.");
//		}
//	}
//}