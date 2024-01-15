package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.FileVO;

public interface FileDAO {

	int insertfile(FileVO fvo);

	List<FileVO> getFileList(int bno);

	int removeFile(String uuid);

	List<FileVO> selectListAllFile();

}
