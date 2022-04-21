package com.iu.boot3.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.boot3.util.FileManger;
import com.iu.boot3.util.Pager;

@Service
public class BoardService {
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private FileManger fileManger;
	
	public BoardFilesVO getFileDetail(BoardFilesVO boardFilesVO)throws Exception{
		return boardMapper.getFileDetail(boardFilesVO);
	}

	public int setDelete(BoardVO boardVO)throws Exception{
				
		List<BoardFilesVO> ar = boardMapper.getFileList(boardVO);
		int result = boardMapper.setDelete(boardVO);
		
		System.out.println("file size : "+ar.size());
		for(BoardFilesVO f : ar) {
			fileManger.fileDelete(f.getFileName(), "resources/upload/board");
		}
		
		return result;
	}
	
	public int setUpdate(BoardVO boardVO)throws Exception{
		return boardMapper.setUpdate(boardVO);
	}
	
	public BoardVO getDetail(BoardVO boardVO)throws Exception{
		return boardMapper.getDetail(boardVO);
	}
	
	public int setAdd(BoardVO boardVO, MultipartFile [] files)throws Exception{
		System.out.println("Insert 전 : "+boardVO.getNum());
		int result = boardMapper.setAdd(boardVO);
		System.out.println("Insert 후 : "+boardVO.getNum());
		
		
		for(MultipartFile mf : files) {
			
			if(mf.isEmpty()) {
				continue;
			}
			
			//1. File을 HDD에 저장
			 String fileName = fileManger.fileSave(mf, "resources/upload/board/");
			 System.out.println(fileName);
			//2. 저장된 정보를 DB에 저장
			 BoardFilesVO boardFilesVO = new BoardFilesVO();
			 boardFilesVO.setNum(boardVO.getNum());
			 boardFilesVO.setFileName(fileName);
			 boardFilesVO.setOriName(mf.getOriginalFilename());
			 boardMapper.setFileAdd(boardFilesVO);
		}
		
		return result;//
	}
	
	public List<BoardVO> getList(Pager pager)throws Exception{
		pager.makeRow();
		pager.makeNum(boardMapper.getTotalCount(pager));
		
		return boardMapper.getList(pager);
	}

}
