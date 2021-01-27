package com.exam.project;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model1.adminDAO;
import model1.adminTO;
import model1.materialTO;
import model1.reviewTO;
import model1.stepTO;

@Controller
public class adminController {
	@Autowired
	private DataSource dataSource;
	
 	// 관리자 페이지
		// 메인
		@RequestMapping("/admin_main.do")
		public String admin_main(HttpServletRequest request, HttpServletResponse response, Model model) {

			return "admin/admin_main";
		}

		@RequestMapping("/admin_member.do")
		public String admin_member(HttpServletRequest request, HttpServletResponse response, Model model) {
			return "admin/admin_member";
		}
		

		// 관리자 - 회원리스트
		@RequestMapping("/admin_member_list.do")
		public String admin_member_list(HttpServletRequest request, HttpServletResponse response, Model model) {
			adminDAO dao = new adminDAO(dataSource);
			ArrayList<adminTO> lists = dao.memberList();

			model.addAttribute("lists", lists);

			return "admin_json/member_list_json";
		}

		//관리자 - 회원정보 수정
		  @RequestMapping("/admin_member_modify_ok.do") 
		  public String admin_member_modify_ok(HttpServletRequest request, HttpServletResponse response, Model model) {
			  
			  //입력하는 값를 DB로 가져가기 
			  adminTO to = new adminTO();
			  to.setId(request.getParameter("id"));
			  to.setPassword(request.getParameter("password"));
			  to.setNickname(request.getParameter("nickname"));
			  to.setEmail(request.getParameter("email"));
			  to.setPhone(request.getParameter("phone"));
			  to.setIntroduce(request.getParameter("introduce"));
			  to.setPicture(request.getParameter("picture"));
		  
		  
			adminDAO dao = new adminDAO(dataSource);
		  int flag = dao.memberModifyOk(to);
		  
		  
		  model.addAttribute("flag", flag);
		  
		  return "admin_json/member_modify_json";
		  }
		 
		//관리자 - 회원삭제
		@RequestMapping("/admin_member_delete.do")
		public String admin_member_delete(HttpServletRequest request, HttpServletResponse response, Model model) {
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			//String rcseq = request.getParameter("rcseq");
			adminTO to = new adminTO();
			to.setId(id);
			to.setRvwriter(id);
			to.setRcwriter(id);
		//	to.setRcseq(rcseq);
			to.setPassword(password);

				   			
			adminDAO dao = new adminDAO(dataSource);
			int flag = dao.memberDeleteOK(to);

			model.addAttribute("flag", flag);
			return "admin_json/member_delete_json";
		}
		//레시피 UI
		@RequestMapping("/admin_recipe.do")
		public String admin_recipe(HttpServletRequest request, HttpServletResponse response, Model model) {

			return "admin/admin_recipe";
		}

		//관리자 - 레시피 리스트
		@RequestMapping("/admin_recipe_list.do")
		public String admin_recipe_list(HttpServletRequest request, HttpServletResponse response, Model model) {
			adminDAO dao = new adminDAO(dataSource);
			ArrayList<adminTO> lists = dao.recipelist();

			model.addAttribute("lists", lists);

			return "admin_json/recipe_list_json";
		}
		//관리자 - 레시피 수정
		@RequestMapping("/admin_recipe_modify.do")
		public String admin_recipe_modify(HttpServletRequest request, HttpServletResponse response, Model model) {
			
			adminTO to = new adminTO();
			to.setRcseq(request.getParameter("rcseq"));
			to.setSubject(request.getParameter("subject"));
			to.setIntroduce(request.getParameter("introduce"));
			//to.setrfilename(request.getParameter("rfilename"));
			to.setUrl(request.getParameter("url"));
			to.setTip(request.getParameter("tip"));

			adminDAO dao = new adminDAO(dataSource);
			int flag = dao.recipeModifyOK(to);

			model.addAttribute("flag", flag);
			return "admin_json/recipe_modify_json";
		}
		
		
		//관리자 - 레시피 삭제
		@RequestMapping("/admin_recipe_delete.do")
		public String admin_recipe_delete(HttpServletRequest request, HttpServletResponse response, Model model) {
			//String subject = request.getParameter("subject");
			String rcseq = request.getParameter("rcseq");
			//int ircseq = Integer.parseInt(request.getParameter("rcseq"));
			adminTO to = new adminTO();
			to.setRcseq(rcseq);
			//to.setSubject(subject);
			
//			materialTO mto = new materialTO();
//			mto.setMtseq(rcseq);
//			
//			stepTO sto = new stepTO();
//			sto.setRcseq(ircseq);
//						
			//System.out.println("recipe subject : " + to.getSubject());
			//System.out.println("recipe rcseq :" + to.getRcseq());
			adminDAO dao = new adminDAO(dataSource);
			int flag = dao.recipeDeleteOK(to);

			model.addAttribute("flag", flag);
			return "admin_json/recipe_delete_json";
		}
		//reviewUI
		@RequestMapping("/admin_review.do")
		public String admin_review(HttpServletRequest request, HttpServletResponse response, Model model) {

			return "admin/admin_review";
		}

		//  관리자 - 후기리스트
		@RequestMapping("/admin_review_list.do")
		public String admin_review_list(HttpServletRequest request, HttpServletResponse response, Model model) {
			adminDAO dao = new adminDAO(dataSource);
			ArrayList<adminTO> lists = dao.reviewList();

			model.addAttribute("lists", lists);

			return "admin_json/review_list_json";
		}
		//  관리자 - 후기수정
		@RequestMapping("/admin_review_modify.do")
		public String admin_review_modify(HttpServletRequest request, HttpServletResponse response, Model model) {

			adminTO to = new adminTO();
			to.setRvcontent(request.getParameter("rvcontent"));
			to.setRvseq(request.getParameter("rvseq"));

			adminDAO dao = new adminDAO(dataSource);
			int flag = dao.reviewModifyOK(to);

			model.addAttribute("flag", flag);
			return "admin_json/review_modify_json";
		}
		//  관리자 - 후기삭제
		@RequestMapping("/admin_review_delete.do")
		public String admin_review_delete(HttpServletRequest request, HttpServletResponse response, Model model) {
			String rvseq = request.getParameter("rvseq");
			String rcseq = request.getParameter("rcseq");

			adminTO to = new adminTO();
			to.setRcseq(rcseq);
			to.setRvseq(rvseq);

			adminDAO dao = new adminDAO(dataSource);
			int flag = dao.reviewDeleteOK(to);

			model.addAttribute("to", to);
			model.addAttribute("flag", flag);
			return "admin_json/review_delete_json";
		}
		// 관리자 페이지 끝
	
}
