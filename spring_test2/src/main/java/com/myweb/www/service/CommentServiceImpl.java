package com.myweb.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.repository.CommentDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Service
public class CommentServiceImpl implements CommentService {

	private final CommentDAO cdao;

	@Override
	public int post(CommentVO cvo) {
		// TODO Auto-generated method stub
		
		return cdao.insert(cvo);
	}

	@Override
	public PagingHandler getList(long bno, PagingVO pgvo) {
		// TODOuto-generated method stub
		//commentList로 setting
		int totlaCount = cdao.selectOneBnoTotalCount(bno);
		List<CommentVO>list = cdao.getList(bno, pgvo);
		PagingHandler ph = new PagingHandler(pgvo, totlaCount,list);
		return ph;
	}

	@Override
	public int modify(CommentVO cvo) {
		// TODO Auto-generated method stub
		return cdao.modify(cvo);
	}

	@Override
	public int remove(long cno) {
		// TODO Auto-generated method stub
		return cdao.delete(cno);
	}
}
