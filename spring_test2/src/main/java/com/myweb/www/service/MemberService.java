package com.myweb.www.service;

import java.util.List;

import com.myweb.www.security.MemberVO;

public interface MemberService {

	int register(MemberVO mvo);

	boolean updateLastLogin(String authEmail);

	MemberVO detail(String email);

	List<MemberVO> list();

	int update(MemberVO mvo);

	int passupdate(MemberVO mvo);

	void delete(String email);

}
