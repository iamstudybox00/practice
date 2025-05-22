package model2.mvcboard;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import utils.JSFunction;

public class WriteController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException
	{
		req.getRequestDispatcher("/MVCBoard/Write.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		String saveDirectory = req.getServletContext().getRealPath("Uploads");
		System.out.println(saveDirectory);
		String originalFileName = "";
		try
		{
			originalFileName = FileUtil.uploadFile(req, saveDirectory);
		} catch (Exception e)
		{
			JSFunction.alertLocation(resp, "파일 업로드 오류 입니다.", "./mvcboard/write.do");
			return;
		}
		
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setName(req.getParameter("name"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		
		if(originalFileName != "")
		{
			String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
			
			dto.setOfile(originalFileName);
			dto.setSfile(savedFileName);
			
		}
		
		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.insertWrite(dto, req.getSession().getAttribute("UserIdx").toString());
		dao.close();
		
		if(result == 1)
		{
			resp.sendRedirect("/mvcboard/list.do");
		}else
		{
			JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.", "../mvcboard/write.do");
		}
	}
}
