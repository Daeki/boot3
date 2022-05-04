package com.iu.boot3.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.iu.boot3.member.MemberVO;
import com.iu.boot3.util.Pager;

//@Controller
@RestController //모든 메서드가 @Responsebody 가 있으면 선언
public class CartController {
	@Autowired
	private CartService cartService;
	
	@PostMapping("/cart/{productNum}/{count}")
	//@ResponseBody : @RestController가 선언되어 있다면 생략 가능
	public int setAdd(HttpSession session,@PathVariable Long productNum, @PathVariable Long count)throws Exception{
		System.out.println("ProductNum : "+productNum);
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		CartVO cartVO = new CartVO();
		cartVO.setProductNum(productNum);
		cartVO.setId(memberVO.getId());
		cartVO.setCount(count);
		int result = cartService.setAdd(cartVO);
		System.out.println("Result : "+result);
		//result를 JSON 형태로 바꿔주는 라이브러리를 사용
		
		return result;
	}
	
	@DeleteMapping("/cart/{cartNum}")
	//@ResponseBody
	public ModelAndView setDelete(@PathVariable Long cartNum)throws Exception{
		System.out.println("CartNum : "+cartNum);
		return null;
	}
	
	@GetMapping("/cart/{pn}")
	//@ResponseBody
	public CartVO getList(@PathVariable Long pn, HttpSession session)throws Exception{
		System.out.println("PN : "+pn);
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		CartVO cartVO = new CartVO();
		cartVO.setId(memberVO.getId());
		
		List<CartVO> ar = cartService.getList(cartVO);
		System.out.println(ar);
		return ar.get(0);
	}

}
