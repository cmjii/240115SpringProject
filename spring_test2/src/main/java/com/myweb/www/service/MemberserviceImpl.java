package com.myweb.www.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.myweb.www.repository.MemberDAO;
import com.myweb.www.security.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class MemberserviceImpl implements MemberService {
	private final MemberDAO mdao;
	private BCryptPasswordEncoder passwordencode;


	@Override
	public int register(MemberVO mvo) {
		// TODO Auto-generated method stub
		int isok= mdao.insert(mvo);
		return mdao.insertAuthInit(mvo.getEmail());
	}


	@Override
	public boolean updateLastLogin(String authEmail) {
		
		return mdao.updateLastLogin(authEmail) >0? true:false;
	}
}
