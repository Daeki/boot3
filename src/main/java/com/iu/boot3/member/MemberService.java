package com.iu.boot3.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.boot3.util.FileManger;

@Service
public class MemberService {
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private FileManger fileManger;
	
	//properties 파일의 member.role.member 속성값 반환
	@Value("${member.role.member}")
	private String memberRole; 
	
	public int setUpdate(MemberVO memberVO)throws Exception{
		return memberMapper.setUpdate(memberVO);
	}
	
	public MemberVO getDetail(MemberVO memberVO)throws Exception{
		return memberMapper.getDetail(memberVO);
	}
	
	public MemberVO getLogin(MemberVO memberVO)throws Exception{
		return memberMapper.getLogin(memberVO);
	}
	
	public int setDelete(MemberVO memberVO)throws Exception{
		MemberFilesVO memberFilesVO = memberMapper.getFileDetail(memberVO);
		
		int result = memberMapper.setDelete(memberVO);
		
		boolean fileResult = fileManger.fileDelete(memberFilesVO.getFileName(), "resources/upload/member/");
						
		
		return result;
	}
	
	public int setAdd(MemberVO memberVO, MultipartFile file)throws Exception{
		
		int result = memberMapper.setAdd(memberVO);
		
		Map<String, String> map = new HashMap<>();
		map.put("id", memberVO.getId());
		map.put("roleName", memberRole);
		
		result = memberMapper.setRoleAdd(map);
		
		//MEMBERROLE TABLE INSERT
		
		if(!file.isEmpty()) {
			String fileName = fileManger.fileSave(file, "resources/upload/member/");
			
			MemberFilesVO memberFilesVO = new MemberFilesVO();
			memberFilesVO.setId(memberVO.getId());
			memberFilesVO.setFileName(fileName);
			memberFilesVO.setOriName(file.getOriginalFilename());
			
			result = memberMapper.setFileAdd(memberFilesVO);
		}
		return result;
	}
}
