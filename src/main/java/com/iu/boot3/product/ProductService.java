package com.iu.boot3.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.boot3.util.Pager;

@Service
public class ProductService {
	@Autowired
	private ProductMapper productMapper;
	
	public List<ProductVO> getList(Pager pager)throws Exception{
		pager.makeRow();
		//pager.makeNum(0);
		return productMapper.getList(pager);
	}

}
