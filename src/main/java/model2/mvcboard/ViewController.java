package model2.mvcboard;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		MVCBoardDAO dao = new MVCBoardDAO();
		String board_idx = req.getParameter("board_idx");
		dao.updateVisitCount(board_idx);
		MVCBoardDTO dto = dao.selectView(board_idx);
		dto.getBoard_idx();
		dao.close();
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
		
		String ext = null, fileName = dto.getSfile();
		if(fileName != null)
		{
			ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		}
		String[] mimeStr = { "png", "jpg", "gif", "PNG", "JPG", "GIF" };
		List<String> mimeList = Arrays.asList(mimeStr);
		boolean isImage = false;
		if(mimeList.contains(ext))
		{
			isImage = true;
		}
		req.setAttribute("permission", havePermission(dto.getUser_idx(), req.getSession().getAttribute("UserIdx")));

		req.setAttribute("dto", dto);
		req.setAttribute("isImage", isImage);
		req.getRequestDispatcher("/MVCBoard/View.jsp").forward(req, resp);
	}
	
	String havePermission(String boardUserIdx, Object currUserIdx) {
		// 자기가 쓴 게시물일 경우
		String currUser = currUserIdx == null ? "noPer" : currUserIdx.toString();
		if(currUser.equals(boardUserIdx)) {	
			return "havePer";
		}
		
		return "noPer";
	}
}