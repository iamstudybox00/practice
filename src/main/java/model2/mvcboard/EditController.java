package model2.mvcboard;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/mvcboard/edit.do")
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 1,
		maxRequestSize = 1024 * 1024 * 10
		)
public class EditController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		String board_idx = req.getParameter("board_idx");
		MVCBoardDAO dao = new MVCBoardDAO();
		MVCBoardDTO dto = dao.selectView(board_idx);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/MVCBoard/Edit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		
		String originalFileName = "";
		try
		{
			originalFileName = FileUtil.uploadFile(req, saveDirectory);
		} catch (Exception e)
		{
			JSFunction.alertBack(resp, "파일 업로드 오류입니다.");
			return;
		}
		
		String board_idx = req.getParameter("board_idx");
		String user_idx = req.getParameter("user_idx");
		String prevOfile = req.getParameter("prevOfile");
		String prevSfile = req.getParameter("prevSfile");
		
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		MVCBoardDTO dto = new MVCBoardDTO();
		System.out.println(board_idx);
		dto.setBoard_idx(board_idx);
		dto.setUser_idx(user_idx);
		dto.setName(name);
		dto.setTitle(title);
		dto.setContent(content);
		
		if(originalFileName != "")
		{
			String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
			
			dto.setOfile(originalFileName);
			dto.setSfile(savedFileName);
			
			FileUtil.deleteFile(req, "/Uploads", prevSfile);
		} else
		{
			dto.setOfile(prevOfile);
			dto.setSfile(prevSfile);
		}
		
		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.updatePost(dto);
		dao.close();
		
		if(result == 1)
		{
			resp.sendRedirect("../mvcboard/view.do?board_idx=" + board_idx);
		}else
		{
			JSFunction.alertLocation(resp, "수정 실패", 
					"../mvcboard/view.do?idx=" + board_idx);
		}
	}
}
