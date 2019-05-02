package kr.co.pro.dao;

import java.util.List;
import java.util.Map;

import kr.co.pro.vo.*;

public interface userDao {

	public int userRegister(userVo user);
	public void userAthority(userVo user);
	public List<userVo> userList();
	public userVo userInfo(String user_ID);
	public int userCount();
	public int idOverlap(String id);
	public void userUpdate(userVo user);
	public void userUpdatePw(userVo user);
	public int userDelete(String id);
	public void authorityDelete(String id);
	public List<userVo> userSelectTable(selectVo select);
	public int userSelectCount(selectVo select);
}
