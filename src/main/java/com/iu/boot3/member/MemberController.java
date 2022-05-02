package com.iu.boot3.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@ModelAttribute("board")
	public String getBoard() {
		return "member";
	}
	
	@PostMapping("findId")
	public ModelAndView getFindId(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO = memberService.getFindId(memberVO);
		mv.addObject("idResult", memberVO);
		mv.setViewName("member/findIdResult");
		return mv;
	}
	
	@GetMapping("findId")
	public ModelAndView getFindId()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/findId");
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setUpdate(MemberVO memberVO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		memberVO.setId(vo.getId());
		int result = memberService.setUpdate(memberVO);
		mv.setViewName("redirect:./mypage");
		return mv;
	}
	
	
	@GetMapping("update")
	public ModelAndView setUpdate(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO =(MemberVO)session.getAttribute("member");
		memberVO = memberService.getDetail(memberVO);
		
		mv.addObject("vo", memberVO);
		mv.setViewName("member/update");
		return mv;
	}
	
	@GetMapping("mypage")
	public ModelAndView getMypage(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO =(MemberVO)session.getAttribute("member");
		memberVO = memberService.getDetail(memberVO);
		
		mv.addObject("vo", memberVO);
		mv.setViewName("member/mypage");
		return mv;
	}
	
	@GetMapping("logout")
	public ModelAndView getLogout(HttpSession session)throws Exception{
		session.invalidate();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:../");
		return mv;
	}
	
	@PostMapping("login")
	public ModelAndView getLogin(MemberVO memberVO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO = memberService.getLogin(memberVO);
		mv.setViewName("member/login");
		
		if(memberVO!=null) {
			session.setAttribute("member", memberVO);
			mv.setViewName("redirect:../");
		}
		
		return mv;
	}
	
	@GetMapping("login")
	public ModelAndView getLogin(@ModelAttribute MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		//mv.addObject("vo", new MemberVO());
		mv.setViewName("member/login");
		return mv;
	}
	
	@GetMapping("delete")
	public ModelAndView setDelete(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO =(MemberVO)session.getAttribute("member");
		int result = memberService.setDelete(memberVO);
		
		session.invalidate();
		
		mv.setViewName("redirect:../");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setAdd(MemberVO memberVO, MultipartFile files)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberService.setAdd(memberVO, files);
		
		
		mv.setViewName("redirect:../");
		return mv;
	}
 
	
	
	@GetMapping("add")
	public ModelAndView setAdd()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/add");
		return mv;
	}
}
