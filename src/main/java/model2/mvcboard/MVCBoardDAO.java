package model2.mvcboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import model2.mvcmember.MVCMemberDTO;

public class MVCBoardDAO extends DBConnPool
{
	public MVCBoardDAO() 
	{
		super();
	}

	
	public int selectCount(Map<String, Object>map)
	{
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM mymvcboard";
		
		if(map.get("searchWord") != null) 
		{
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		
		try
		{
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e)
		{
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	public List<MVCBoardDTO> selectListPage(Map<String, Object> map)
	{
		List<MVCBoardDTO> board = new Vector<MVCBoardDTO>();
		
		String query = "SELECT * FROM ( "
				+ "     SELECT Tb.*, ROWNUM rNum FROM ( "
				+ "         SELECT * FROM mymvcboard ";
		if(map.get("searchWord") != null) 
		{
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += "      ORDER BY board_idx DESC "
				+ "     ) Tb "
				+ "  )  "
				+ " WHERE rNum BETWEEN ? AND ?";
		
		try
		{
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next())
			{
				MVCBoardDTO dto = new MVCBoardDTO();

				dto.setBoard_idx(rs.getString(1));
				dto.setUser_idx(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setTitle(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setPostDate(rs.getDate(6));
				dto.setOfile(rs.getString(7));
				dto.setSfile(rs.getString(8));
				dto.setDownCount(rs.getInt(9));
				dto.setVisitCount(rs.getInt(10));
				
				board.add(dto);
			}
		} catch (Exception e)
		{
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return board;
	}
	
	public int insertWrite(MVCBoardDTO dto, String user_idx)
	{
		int result = 0;
		
		try
		{
			String query = "INSERT INTO mymvcboard ( "
					+ " board_idx, user_idx, name, title, content, ofile, sfile) "
					+ " VALUES ( "
					+ " seq_board_num.NEXTVAL, ?, ?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setInt(1, Integer.parseInt(user_idx));
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getOfile());
			psmt.setString(6, dto.getSfile());
			
			result = psmt.executeUpdate();
		} catch (Exception e)
		{
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public MVCBoardDTO selectView(String board_idx) 
	{
		MVCBoardDTO dto = new MVCBoardDTO();
		
		String query = "SELECT * FROM mymvcboard WHERE board_idx=?";
		
		try
		{
			psmt = con.prepareStatement(query);
			psmt.setString(1, board_idx);
			rs = psmt.executeQuery();
			
			if(rs.next())
			{
				dto.setBoard_idx(rs.getString(1));
				dto.setUser_idx(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setTitle(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setPostDate(rs.getDate(6));
				dto.setOfile(rs.getString(7));
				dto.setSfile(rs.getString(8));
				dto.setDownCount(rs.getInt(9));
				dto.setVisitCount(rs.getInt(10));
			}
		} catch (Exception e)
		{
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	public void updateVisitCount(String idx)
	{
		String query = "UPDATE mymvcboard SET "
				+ " visitcount=visitcount+1 "
				+ " WHERE board_idx=?";
		
		try
		{
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery();
		} catch (Exception e)
		{
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	public void downCountPlus(String idx)
	{
		String sql = "UPDATE mymvcboard SET "
				+ " downcount=downcount+1 "
				+ " WHERE board_idx=? ";
		
		try
		{
			System.out.println(idx);
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeQuery();
		} catch (Exception e)
		{
			System.out.println("다운로드 카운트 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	public int deletePost(MVCBoardDTO dto) 
	{
		int result = 0;
		
		try
		{
			String query = "DELETE FROM mymvcboard WHERE board_idx=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getBoard_idx());
			result = psmt.executeUpdate();
		} catch (Exception e)
		{
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int updatePost(MVCBoardDTO dto)
	{
		int result = 0;
		try
		{
			String query = "UPDATE mymvcboard "
					+ " SET title=?, name=?, content=?, ofile=?, sfile=? "
					+ " WHERE board_idx=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getBoard_idx());
			
			result = psmt.executeUpdate();
		} catch (Exception e)
		{
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}