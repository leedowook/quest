package kr.co.pro.dao;

import java.util.List;
import java.util.Map;

import kr.co.pro.vo.userVo;

public interface userDao {

	public int userRegister(userVo user);
	public void userAthority(userVo user);
	public List<userVo> userList();
	public userVo userInfo(String user_ID);
	public int userCount();
	public int idOverlap(String id);
	

}
