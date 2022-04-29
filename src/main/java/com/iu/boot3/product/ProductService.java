package com.iu.boot3.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.iu.boot3.util.FileManger;
import com.iu.boot3.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class ProductService {
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private FileManger fileManger;
	
	public int setUpdate(ProductVO productVO, MultipartFile [] multipartFiles)throws Exception{
		int result = productMapper.setUpdate(productVO);
		
		if(multipartFiles != null) {
			
			for(MultipartFile multipartFile: multipartFiles) {
				if(multipartFile.isEmpty()) {
					continue;
				}
				
				ProductFilesVO productFilesVO = new ProductFilesVO();
						
				String fileName =fileManger.fileSave(multipartFile, "/resources/upload/product/");
				productFilesVO.setFileName(fileName);
				productFilesVO.setOriName(multipartFile.getOriginalFilename());
				productFilesVO.setProductNum(productVO.getProductNum());
				result = productMapper.setFileAdd(productFilesVO);
				
			}
			
			
		}
		
		
		return result;
	}
	
	
	public int setFileDelete(ProductFilesVO productFilesVO)throws Exception{
		
		//DB에서 조회
		productFilesVO = productMapper.getFileDetail(productFilesVO);
		
		//HDD에서 삭제
		//boolean result = fileManger.fileDelete(productFilesVO.getFileName(), "/resources/upload/product/");
		
		//DB 삭제
//		if(result) {
//			productMapper.setFileDelete(productFilesVO);
//		}
		
		int check = productMapper.setFileDelete(productFilesVO);
		if(check>0) {
			boolean result = fileManger.fileDelete(productFilesVO.getFileName(), "/resources/upload/product/");
		}
		
		return check;
	}
	
	public ProductVO getDetail(ProductVO productVO)throws Exception{
		
		return productMapper.getDetail(productVO);
	}
	
	
	
	public int setAdd(ProductVO productVO, MultipartFile [] files)throws Exception{
		int result = productMapper.setAdd(productVO);
		
		if(files != null) {
			for(MultipartFile f : files) {
				if(f.isEmpty()) {
					continue;
				}
				
				String fileName= fileManger.fileSave(f, "resources/upload/product/");
				ProductFilesVO productFilesVO = new ProductFilesVO();
				productFilesVO.setProductNum(productVO.getProductNum());
				productFilesVO.setFileName(fileName);
				productFilesVO.setOriName(f.getOriginalFilename());
				result = productMapper.setFileAdd(productFilesVO);
			}
		}
		return result;
	}
	
	public List<ProductVO> getList(Pager pager)throws Exception{
		pager.makeRow();
		pager.makeNum(productMapper.getTotalCount(pager));
		return productMapper.getList(pager);
	}

}
