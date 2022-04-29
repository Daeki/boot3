package com.iu.boot3.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.iu.boot3.board.BoardMapper;
import com.iu.boot3.board.BoardVO;
import com.iu.boot3.member.MemberVO;

@Component
public class WriterCheckInterceptor implements HandlerInterceptor{
	
	@Autowired
	private BoardMapper boardMapper;
	
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		
//		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
//		
//		Map<String, Object> map = modelAndView.getModel();
//		BoardVO boardVO = (BoardVO)map.get("vo");
//		
//		if(!boardVO.getWriter().equals(memberVO.getId())) {
//			//modelAndView.setViewName("redirect:./list");
//			modelAndView.addObject("msg", "작성자만 가능");
//			modelAndView.addObject("path", "./list");
//			modelAndView.setViewName("common/getResult");
//		}
//		
//		
//		
//	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String method = request.getMethod();
		System.out.println(method);
		
		// TODO Auto-generated method stub
		String num = request.getParameter("num");
		BoardVO boardVO = new BoardVO();
		boardVO.setNum(Long.parseLong(num));
		boardVO = boardMapper.getDetail(boardVO);
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		
		//boolean check=false;
		//작성자와 로그인 한 사용자의 id가 일치하면 통과
		if(boardVO.getWriter().equals(memberVO.getId())) {
			//check=true;
			return true;
		}else {
			//일치하지 않으면 list 로 redirect
		
			response.sendRedirect("./list");
			
			return false;
		}
			
		
	}

}
