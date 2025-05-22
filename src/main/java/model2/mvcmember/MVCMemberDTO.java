package model2.mvcmember;

public class MVCMemberDTO
{
	private String user_idx;
	private String id;
	private String name;
	private String pass;
	public String getUser_idx()
	{
		return user_idx;
	}
	public void setUser_idx(String user_idx)
	{
		this.user_idx = user_idx;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getPass()
	{
		return pass;
	}
	public void setPass(String pass)
	{
		this.pass = pass;
	}
}
