package com.myweb.www.service;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.repository.MemberDAO;
import com.myweb.www.security.AuthVO;
import com.myweb.www.security.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class MemberserviceImpl implements MemberService {
	private final MemberDAO mdao;

	@Transactional
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

	
	// authVO는 항상 같이 가져와야함 서비스Impl에서
	
	@Transactional
	@Override
	public MemberVO detail(String email) {
		MemberVO mvo = mdao.selectEmail(email);
		mvo.setAuthList(mdao.selectAuths(email));
		return mvo;
		
	}

	@Transactional
	@Override
	public List<MemberVO> list() {
		// TODO Auto-generated method stub
		List<MemberVO> list = mdao.selectAllList();
		 for(MemberVO mvo : list) {
			 mvo.setAuthList(mdao.selectAuths(mvo.getEmail()));
		 }
		 
		return list;
	}


	@Override
	public int update(MemberVO mvo) {
		// TODO Auto-generated method stub
		return mdao.update(mvo);
	}


	@Override
	public int passupdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		return mdao.passupdate(mvo);
	}


	@Override
	public void delete(String email) {
		mdao.deleteAuth(email);
		mdao.deleteMem(email);
		
	}



}
