package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	List<BoardVO> getlist(PagingVO pgvo);

	BoardVO detail(int bno);

	int modify(BoardVO boardVO);

	int delete(int bno);

	int readcount(int bno);

	long selectOneBno();
	
	int getTotalCount(PagingVO pgvo);

	int removeFile(String uuid);

	void updateCommentCount();

	void updateFileCount();


}
