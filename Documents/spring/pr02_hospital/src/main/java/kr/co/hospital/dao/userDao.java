package kr.co.hospital.dao;

import java.util.List;


import kr.co.hospital.vo.userVo;


public interface userDao {
	public void	userInput(userVo user);
	public userVo userSelect(String name);
}
