package com.sds.icto.guestbook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sds.icto.guestbook.dao.GuestbookDao;
import com.sds.icto.guestbook.vo.GuestbookVo;

@Controller
public class GuestbookController {

	@Autowired
	GuestbookDao guestbookDao;

	@RequestMapping("/index")
	public String index(Model model) {
		
		List<GuestbookVo> list = guestbookDao.fetchList();
		model.addAttribute("list", list);
	return "/views/list.jsp";
}
	/*@RequestMapping("/form")
	public String form(){
		return "/views/list.jsp";
	}*/
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(
			@RequestParam("name") String name,
			@RequestParam("password") String password,
			@RequestParam("message") String message){
		
		GuestbookVo vo = new GuestbookVo();
		vo.setName(name);
		vo.setPassword(password);
		vo.setMessage(message);
		
		guestbookDao.insert(vo);
		
		return "redirect:/index";
	}
}
