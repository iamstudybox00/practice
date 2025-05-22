package model2.mvcmember;

import common.DBConnPool;

public class MVCMemberDAO extends DBConnPool
{
	public MVCMemberDAO() {}
	
	public MVCMemberDTO selectUser(String id, String pass)
	{
		MVCMemberDTO dto = new MVCMemberDTO();
		
		String query = " SELECT * FROM mymvcmember WHERE "
					+ " id=? AND pass=?";
		try
		{
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			
			if(rs.next())
			{
				dto.setUser_idx(rs.getString("user_idx"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
			}
		} catch (Exception e)
		{
			System.out.println("유저를 찾는 도중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int insertWrite(MVCMemberDTO dto)
	{
		int result = 0;
		
		try
		{
			String query = "INSERT INTO mymvcmember ( "
					+ " user_idx, id, name, pass) " 
					+ " VALUES ( "
					+ " seq_board_num.NEXTVAL, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getPass());			
			result = psmt.executeUpdate();
		} catch (Exception e)
		{
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deleteUser(MVCMemberDTO dto) 
	{
		int result = 0;
		
		try
		{
			String query = "DELETE FROM mymvcmember WHERE id=? AND pass=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			result = psmt.executeUpdate();
		} catch (Exception e)
		{
			System.out.println("유저 탈퇴 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int updateUserPass(MVCMemberDTO dto)
	{
		int result = 0;
		try
		{
			String query = "UPDATE mymvcmember "
					+ " SET pass=? "
					+ " WHERE id=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			
			result = psmt.executeUpdate();
		} catch (Exception e)
		{
			System.out.println("유저 비밀번호 변경 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
