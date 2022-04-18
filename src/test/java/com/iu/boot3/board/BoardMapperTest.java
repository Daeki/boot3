package com.iu.boot3.board;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
@SpringBootTest
class BoardMapperTest {

	@Autowired
	private BoardMapper boardMapper;
	
	@Test
	void setDeleteTest()throws Exception{
		BoardVO boardVO = new BoardVO();
		boardVO.setNum(4L);
		int result = boardMapper.setDelete(boardVO);
		assertEquals(1, result);
	}
	
	@Test
	void setUpdateTest()throws Exception{
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("Title Update");
		boardVO.setContents("Contents Update");
		boardVO.setNum(3L);
		int result = boardMapper.setUpdate(boardVO);
		assertEquals(1, result);
	}
	
	
	@Test
	void setAddTest()throws Exception{
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("addTitle");
		boardVO.setWriter("addWriter");
		boardVO.setContents("addContents");
		int result = boardMapper.setAdd(boardVO);
		assertEquals(1, result);
	}
	
	@Test
	void getListTest()throws Exception{
		List<BoardVO> ar = boardMapper.getList();
		
		assertNotEquals(0, ar.size());
		
	}
	
	@Test
	void test() throws Exception {
		BoardVO boardVO = new BoardVO();
		boardVO.setNum(3L);
		boardVO = boardMapper.getDetail(boardVO);
		System.out.println(boardVO.toString());
		assertNotNull(boardVO);
	}

}
