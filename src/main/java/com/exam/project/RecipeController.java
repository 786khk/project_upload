package com.exam.project;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import mailSender.MailSender;
import model1.stepImgDAO;
import model1.divisionViewTO;
import model1.materialDAO;
import model1.materialTO;
import model1.memberDAO;
import model1.memberTO;
import model1.mypageMemberDAO;
import model1.mypageMemberTO;
import model1.mypagePublicDAO;
import model1.mypagePublicTO;
import model1.mypageReviewDAO;
import model1.mypageReviewTO;
import model1.rankingDAO;
import model1.rankingTO;
import model1.recipeDAO;
import model1.recipeTO;
import model1.recipeViewDAO;
import model1.recipeViewTO;
import model1.reviewDAO;
import model1.pagingTO;
import model1.reviewTO;
import model1.scrapDAO;
import model1.scrapTO;
import model1.stepDAO;
import model1.stepTO;
import model1.userModifyDAO;
import model1.userModifyTO;
import model1.viewDAO;
import model1.viewTO;

@Controller
public class RecipeController {
	
	@Autowired
	private DataSource dataSource;
	public String uploadPath = "C:/workspace2/FinalProject_0122/src/main/webapp/picture/";
	// 메인페이지
	@RequestMapping("/main.do")
	public String mainHome(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {
		
		if(request.getParameter("id") != null) {
			model.addAttribute("id", request.getParameter("id"));
		}
			
		return "modoo_main";
	}

	// 로그인
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "login";
	}
	
	@RequestMapping("/login_ok.do")
	public String login_ok(HttpServletRequest request, HttpServletResponse response, Model model) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");

		memberTO to = new memberTO();
		to.setId(id);
		to.setPassword(password);

		memberDAO dao = new memberDAO(dataSource);

		int flag = dao.login_ok(to);

		model.addAttribute("flag", flag);

		if (flag == 1) {
			HttpSession session = request.getSession(true);
			session.setAttribute("id", id);
		} else {

		}
		return "login_ok_json";
	}
	
	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {
		
		session.invalidate();
		
		session = request.getSession(true);
		session.setAttribute("id", request.getRemoteAddr());
		
		model.addAttribute("logout", "true");
		
		return "logout_ok";
	}

	// 이메일
	@RequestMapping(value = "/email.do", method = RequestMethod.POST)
	@ResponseBody
	public String email(HttpServletRequest request, HttpServletResponse response, Model model) {

		String email = request.getParameter("email");
		String inNum = request.getParameter("inNum");

		String toEmail = email;
		String toName = "modoo_admin";
		String subject = "모두의 레시피(인증번호 발송)";

		StringBuffer content = new StringBuffer();
		content.append("<html>");
		content.append("<head>");
		content.append("<meta charset='utf-8'/>");
		content.append("</head>");
		content.append("<body>");
		content.append("<h4><font color='black'>인증번호</font></h4>");
		content.append("인증번호는");
		content.append("<div id=cnum>");
		content.append(inNum);
		content.append("</div>");
		content.append("입니다.");
		content.append("</body>");
		content.append("</html>");

		MailSender mailSender = new MailSender();
		mailSender.sendMail(toEmail, toName, subject, content.toString());

		
		String result = "o";

		return result;
	}

	// 아이디 중복검사
	@RequestMapping("/idCheck.do")
	public String idCheck(HttpServletRequest request, HttpServletResponse response, Model model) {

		String id = request.getParameter("id");

		memberTO to = new memberTO();
		to.setId(id);

		memberDAO dao = new memberDAO(dataSource);
		int flag = dao.idCheck(to);

		model.addAttribute("flag", flag);

		return "data/idCheck_json";
	}

	// 닉네임 체크
	@RequestMapping("/nameCheck.do")
	public String nameCheck(HttpServletRequest request, HttpServletResponse response, Model model) {

		String nickname = request.getParameter("name");

		memberTO to = new memberTO();
		to.setNickname(nickname);

		memberDAO dao = new memberDAO(dataSource);
		int flag = dao.nameCheck(to);

		model.addAttribute("flag", flag);

		return "data/nameCheck_json";
	}

	// 회원가입 동의
	@RequestMapping("/agree.do")
	public String agree(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "agree";
	}

	@RequestMapping("/join.do")
	public String join(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "join";
	}

	@RequestMapping("/join_ok.do")
	public String join_ok(HttpServletRequest request, HttpServletResponse response, Model model) {
		memberTO to = new memberTO();
		to.setId(request.getParameter("id"));
		to.setPassword(request.getParameter("password"));
		to.setNickname(request.getParameter("nickname"));
		to.setEmail(request.getParameter("email"));
		to.setGender(request.getParameter("gender"));
		to.setPhone(request.getParameter("phone"));
		to.setIntroduce("안녕하세요? " + request.getParameter("id") + " 입니다.");
		to.setPicture("");
		to.setAllview(0);

		memberDAO dao = new memberDAO(dataSource);
		int flag = dao.join_ok(to);
		model.addAttribute("flag", flag);

		return "data/joinOk_json";
	}

	// 레시피 등록
	@RequestMapping("/recipe_write.do")
	public String recipe_write(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "modoo_recipe_write";
	}
	
	 // 분류
	 @RequestMapping("/division.do") public String division(HttpServletRequest
	 request, HttpServletResponse response, Model model) {
		int divPage = 1;
			
		if(request.getParameter("divPage") != null) {
			divPage = Integer.parseInt(request.getParameter("divPage"));
		}
			
		model.addAttribute("divPage", divPage);
		return "modoo_division"; 
	}

	// 랭킹
	@RequestMapping("/ranking.do")
	public String ranking(HttpServletRequest request, HttpServletResponse response, Model model) {
		int rankPage = 1;
		
		if(request.getParameter("rankPage") != null) {
			rankPage = Integer.parseInt(request.getParameter("rankPage"));
		}
		
		
    	rankingDAO dao = new rankingDAO(dataSource);
    	
    	rankingTO  to = new rankingTO();
    			
    	to = 	dao.rankinglistr(to);
		
    	model.addAttribute("to", to);
		model.addAttribute("rankPage", rankPage);
		return "modoo_ranking";
	}
	@RequestMapping("/ranking_top3.do")
	public String rankingTop(HttpServletRequest request, HttpServletResponse response, Model model) {
		/*
		 * int rankPage = 1;
		 * 
		 * if(request.getParameter("rankPage") != null) { rankPage =
		 * Integer.parseInt(request.getParameter("rankPage")); }
		 */
		
    	rankingDAO  dao = new rankingDAO(dataSource);
    	
    	ArrayList<rankingTO> list = dao.recipetop3();
		
    	model.addAttribute("list", list);
	//	model.addAttribute("rankPage", rankPage);
		return "data/rankTop3";
	}
	
	

	// 프린트
	@RequestMapping("/recipe_print.do")
	public String recipe_print(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "print";
	}

	// 마이페이지
	// 레시피 > 공개중
	@RequestMapping("/mypage_public.do")
	public String mypage_public(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "mypage_public";
	}
	
	// 레시피 > 공개중
		@RequestMapping("/mypage_public_data.do")
		public String mypage_public_data(HttpServletRequest request, HttpServletResponse response, Model model) {

			String id = request.getParameter("id");
			

			mypagePublicTO mpto = new mypagePublicTO();
			
			mpto.setId(id);
			
			mypagePublicDAO dao = new mypagePublicDAO(dataSource);
			
			ArrayList<mypagePublicTO> list = dao.mypagePublicList(mpto);
			
			model.addAttribute("list", list);
			
			return "data/mypage_public_data_json";
		}

	// 레시피 > 스크랩seq
			@RequestMapping("/mypage_scrapseq_data.do")
			public String mypage_scrapseq_data(HttpServletRequest request, HttpServletResponse response, Model model) {
				String id = request.getParameter("id");
				
				
				mypagePublicTO mpto = new mypagePublicTO();
				
				mpto.setId(id);
				
				mypagePublicDAO dao = new mypagePublicDAO(dataSource);
				
				String scrapseq = dao.mypageScrapseq(mpto);
				
				model.addAttribute("scrapseq", scrapseq);
				
				return "data/mypage_scrapseq_data_json";
			}	
			
	// 레시피 > 스크랩List
			@RequestMapping("/mypage_scrapList_data.do")
			public String mypage_scrapList_data(HttpServletRequest request, HttpServletResponse response, Model model) {
				String rcseq = request.getParameter("rcseq");

				mypagePublicTO mpto = new mypagePublicTO();
				
				mpto.setRcseq(rcseq);
				
				mypagePublicDAO dao = new mypagePublicDAO(dataSource);
			
				ArrayList<mypagePublicTO> list = dao.mypageScrapList(mpto);
					
				model.addAttribute("list", list);
				
				return "data/mypage_public_data_json";
			}			
		
	// 레시피 > 작성중
	@RequestMapping("/mypage_scrap.do")
	public String mypage_ing(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "mypage_scrap";
	}

	// 요리후기 > 내가 쓴 요리 후기
	@RequestMapping("/mypage_review_write.do")
	public String mypage_review_write(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "mypage_review_write";
	}

	// 요리후기 > 내가 쓴 요리 후기
	@RequestMapping("/mypage_review_get.do")
	public String mypage_review_send(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "mypage_review_get";
	}

	// 댓글 > 받은 댓글
	@RequestMapping("/mypage_reply_get.do")
	public String mypage_reply_get(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "mypage_reply_get";
	}

	// 댓글 > 내가 쓴 댓글
	@RequestMapping("/mypage_reply_write.do")
	public String mypage_reply_write(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "mypage_reply_write";
	}
	//레시피 파일업로드
	@RequestMapping(value = "recipeUpload.do", method = RequestMethod.POST)
	public ModelAndView fileUpload(MultipartHttpServletRequest mRequest) {
		stepImgDAO boardService = new stepImgDAO(); 
		ModelAndView mav = new ModelAndView();
		
		String uploadPath = "C:/workspace2/FinalProject_0122/src/main/webapp/picture";
		int maxFileSize = 1024 * 1024 * 5;
		String encType = "utf-8";
		
		
		
		String stepNum = mRequest.getParameter("stepNum");
		String materialNum = mRequest.getParameter("materialNum");
		
		int stnum = Integer.parseInt(stepNum);		
		int mtnum = Integer.parseInt(materialNum);
						
		recipeTO to = new recipeTO();
		
		to.setRcwriter(mRequest.getParameter("rcwriter"));
		to.setSubject(mRequest.getParameter("cok_title"));
		to.setIntroduce(mRequest.getParameter("cok_intro"));
		to.setrfilename("");
		to.setUrl(mRequest.getParameter("cok_video_url"));
		to.setTip(mRequest.getParameter("cok_tip"));
		to.setCategory1(mRequest.getParameter("cok_sq_category_1"));
		to.setCategory2(mRequest.getParameter("cok_sq_category_2"));
		
		recipeDAO rdao = new recipeDAO(dataSource);
		
		int rcseq = rdao.recipeWriteOk(to);
			
		rdao.setRfileName(rcseq);

		ArrayList<materialTO> mtList = new ArrayList<materialTO>();
		
		for (int i = 1 ; i <= mtnum ; i++) {
			materialTO mto = new materialTO();
			mto.setRcseq(rcseq);
			mto.setName(mRequest.getParameter("cok_material_nm_"+i+"[]"));
			mto.setAmount(mRequest.getParameter("cok_material_amt_"+i+"[]"));
			mto.setId(mRequest.getParameter("rcwriter"));
			mtList.add(mto);
		}
		
		materialDAO mtdao = new materialDAO(dataSource);
		int mtResult = mtdao.mtWriteOk(mtList);
		
		ArrayList<stepTO> stList = new ArrayList<stepTO>();
		
		String stepFileName = "";
		
		for (int j = 1 ; j < stnum ; j++) {
			stepFileName = rcseq + "_step_"+ j + ".jpg";
			stepTO sto = new stepTO();
			sto.setRcseq(rcseq);
			sto.setStorder(j);
			sto.setFilename(stepFileName);
			sto.setContent(mRequest.getParameter("step_text_"+j+"[]"));
			sto.setId(mRequest.getParameter("rcwriter"));
			//여기 id추가.
			stList.add(sto);
		}
		
		stepDAO stdao = new stepDAO(dataSource);
		int stResult = stdao.stWriteOk(stList);
				
		if (boardService.recipeUpload(rcseq, stepNum, mRequest)) {
			mav.addObject("Result", "레시피가 등록되었습니다!");
			mav.addObject("mtResult", mtResult);
			mav.addObject("stResult", stResult);
		} else {
			mav.addObject("Result", "레시피 등록에 실패하였습니다..");
		}

		mav.setViewName("modoo_recipe_write_ok");

		return mav;
	}
	
	//분류_데이터
	 @RequestMapping("/division_view.do")
	 public String division_view(HttpServletRequest request, HttpServletResponse response, Model model) {
		 
		int divPage = Integer.parseInt(request.getParameter("divPage"));
   		int skip = ( divPage - 1 ) * 8;
   		
		viewDAO divDAO = new viewDAO(dataSource);
   		
   		ArrayList<viewTO> lists = divDAO.viewlist(skip);   	
	    int totalRecord = divDAO.getTotalRecord();
		    
	    model.addAttribute("lists", lists);
	    model.addAttribute("totalRecord", totalRecord);

	    return "data/division_view_json";
	 }   
	 
		/*
		 * @RequestMapping("/main_total.do") public String main_total(HttpServletRequest
		 * request, HttpServletResponse response, Model model) {
		 * 
		 * //int divPage = Integer.parseInt(request.getParameter("divPage")); //int skip
		 * = ( divPage - 1 ) * 8; recipeTO to = new recipeTO(); recipeDAO dao = new
		 * recipeDAO(dataSource); recipeTO rto = dao.mainCount(to);
		 * 
		 * model.addAttribute("rto", rto);
		 * 
		 * return "data/main_total_json"; }
		 */
	 

	@RequestMapping("/review_ok.do")
	public String reviewOK(HttpServletRequest request, HttpServletResponse response, Model model) {

		String rcseq = request.getParameter("rcseq");
		String rvwriter = request.getParameter("rvwriter");
		String strStar = request.getParameter("star");
		int star = Integer.parseInt(strStar);		
		String rvcontent = request.getParameter("rvcontent");
	
		reviewTO to = new reviewTO();
		to.setRcseq(rcseq);
		to.setRvwriter(rvwriter);
		to.setStar(star);
		to.setRvcontent(rvcontent);
		
		reviewDAO dao = new reviewDAO(dataSource);
		
		int rvseq = dao.reviewOK(to);

		
		model.addAttribute("rvseq", rvseq);
		
		return "data/review_ok_json";
	}

// 후기_review	
	@RequestMapping("/review_data.do")
	public String reviewData(HttpServletRequest request, HttpServletResponse response, Model model) {
	   String rcseq = request.getParameter("rcseq");
	   
	   reviewTO rvto = new reviewTO();
	   rvto.setRcseq(rcseq);
	   
	   reviewDAO dao = new reviewDAO(dataSource);
	   ArrayList<reviewTO> lists = dao.reviewData(rvto);
	   
	   model.addAttribute("lists", lists);         
	   return "data/review_data_json";   
	}   

// 레시피 뷰
	@SuppressWarnings("unchecked")
	@RequestMapping("/recipe_view.do")
	public String recipe_view(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {
		String rcseq = request.getParameter("rcseq");
		
		ArrayList<String> rcList = null;
		
		if(session.getAttribute("rcList") == null){
			rcList = new ArrayList<String>();
			rcList.add(rcseq);
			session.setAttribute("rcList", rcList);
		}else{
			rcList = (ArrayList<String>) session.getAttribute("rcList");
			
			if(rcList.size()>=6){
				rcList.remove(0);
				rcList.add(rcseq);
			}else{
				rcList.add(rcseq);
			}
			session.setAttribute("rcList", rcList);
		}
		
		model.addAttribute("rcseq", rcseq);
		return "modoo_recipe_view";
	}
	
	// 레시피뷰_스텝
	 @RequestMapping("/recipe_view_step.do")
	 public String step_view(HttpServletRequest request, HttpServletResponse response, Model model) {
		      
		String rcseq = request.getParameter("rcseq");
		stepTO sto = new stepTO();
		sto.setRcseq(Integer.parseInt(rcseq));
		
		stepDAO dao = new stepDAO(dataSource);		
	    
	    ArrayList<stepTO> lists = dao.steplist(sto);
		    
	    model.addAttribute("lists", lists);
      
	    return "data/recipe_view_step_json";
	 }  
	 
	// 레시피뷰_재료
	 @RequestMapping("/recipe_view_material.do")
	 public String material_view(HttpServletRequest request, HttpServletResponse response, Model model) {
			      
		String rcseq = request.getParameter("rcseq");

		materialTO mto = new materialTO();
		mto.setRcseq(Integer.parseInt(rcseq));
			
		materialDAO dao = new materialDAO(dataSource);	
		    
	    ArrayList<materialTO> lists = dao.materialList(mto);

	    model.addAttribute("lists", lists);
	      
	    return "data/recipe_view_material_json";
	 }  
	 
	// 레시피뷰_레시피
	 @RequestMapping("/recipe_view_recipeView.do")
	 public String recipeView_view(HttpServletRequest request, HttpServletResponse response, Model model) {
				      
		String rcseq = request.getParameter("rcseq");
		
		recipeViewTO rto = new recipeViewTO();
		rto.setRcseq(rcseq);
				
		recipeViewDAO dao = new recipeViewDAO(dataSource);	
			    
	    ArrayList<recipeViewTO> lists = dao.recipeViewList(rto);
	    
	    model.addAttribute("lists", lists);
		      
	    return "data/recipe_view_recipeView_json";
	 } 
	
	 @RequestMapping("/division_detail_view.do")
		public String division_detail_view(HttpServletRequest request, HttpServletResponse response, Model model) {

			return "modoo_division_detail";
		}
	 
	//분류_디테일_데이터
		 @RequestMapping("/division_detail.do")
		 public String division_detail(HttpServletRequest request, HttpServletResponse response, Model model) {
			       
			 String cat1 = request.getParameter("");
			 String cat2 = request.getParameter("");			
			
			 if(request.getParameter("cat1")!=null) {
				 cat1 = request.getParameter("cat1");	 
			 }
			 
			 if(request.getParameter("cat2")!=null) {
				 cat2 = request.getParameter("cat2");	 
			 }
			 									 						
			 viewDAO dao = new viewDAO(dataSource); 	
		    
		    divisionViewTO dvto = dao.viewlist_detail(cat1, cat2);
		    model.addAttribute("dvto", dvto);
		    return "data/division_view_detail_json";
		 }  
		 
		//랭킹_데이터_조회
		 //랭킹리스트
		    @RequestMapping("/ranking_view.do")
		    public String ranking_view_hit(HttpServletRequest request, HttpServletResponse response, Model model) {
		    	String listKind = request.getParameter("listKind");
		    	int rankPage = Integer.parseInt(request.getParameter("rankPage"));
		    	
		    	int skip = ( rankPage - 1 ) * 8;
		   		
		    	ArrayList<rankingTO> lists = null;
		    	
		    	rankingDAO dao = new rankingDAO(dataSource);
		    	int totalRecord = dao.getTotalRecord();
		    	model.addAttribute("totalRecord", totalRecord);
		    	
		    	if(listKind.equals("hit")) {
		    		
		    		lists = dao.rankinglistHit(skip);
		    		model.addAttribute("lists", lists);
			    	
		    	}else if(listKind.equals("star")) {
		    	
		    		lists = dao.rankinglistStar(skip);
		    		model.addAttribute("lists", lists);		    	
		    	}	
		    	
		    	return "data/ranking_view_json";
		    } 
		    
		    @RequestMapping("/ranking_side.do")
		    public String ranking_side(HttpServletRequest request, HttpServletResponse response, Model model) {
		    	ArrayList<rankingTO> lists = new ArrayList<rankingTO>();
		    	rankingDAO dao = new rankingDAO(dataSource);
		    	
	    		lists = dao.rankinglistSide();
	    		model.addAttribute("lists", lists);
			    		    		
		    	return "data/ranking_side_json";
		    } 
		    
	       
	       @RequestMapping("/review_img_ok.do")
	       public String reviewImgOk(@RequestParam(value="review_img", required=false) MultipartFile multi, HttpServletRequest request,HttpServletResponse response, Model model) {
	    	   
	    	   int flag = 0;
	    	   String rvseq = request.getParameter("rvseq");

	    	   //경로
	    	   String revImgPath = "C:/workspace2/FinalProject_0122/src/main/webapp/picture/"+rvseq+"/";
	    	   
	    	
	    	   File revImgDir = new File(revImgPath);

	    	   if (!revImgDir.isDirectory()) {
	    		   revImgDir.mkdirs();
	    		   }
	           
	           try {
	    
	               String uploadpath = revImgPath ;
	               
	               String originFilename = "";
	               String extName = "";
	               String saveFileName = originFilename + extName;
	               int max_size = 1024 * 1024 * 10;
	               
	               if(!multi.isEmpty()) {
	               originFilename = multi.getOriginalFilename();
	               extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
	               saveFileName = "rev_"+ rvseq + "_img" + extName;
	              
	               }
	               
	               if(!multi.isEmpty())
	               {
	                   File file = new File(uploadpath, saveFileName);
	                   multi.transferTo(file);
	                   reviewDAO rdao = new reviewDAO(dataSource);
	                   flag = rdao.setRevImgFileName(rvseq, saveFileName);	                                     
	               }
	           }catch(Exception e){
	               
	               reviewDAO rdao = new reviewDAO(dataSource);
                   flag = rdao.setRevImgFileName(rvseq, "noImage");	 
	           }
	           	           
	           model.addAttribute("flag", flag);
	           return "data/review_img_ok_json";
	       }  
	       
//	       @RequestMapping("/admin_main.do")
//			public String admin_main(HttpServletRequest request, HttpServletResponse response, Model model) {
//
//				return "admin/admin_main";
//			}
//
//			@RequestMapping("/admin_member.do")
//			public String admin_member(HttpServletRequest request, HttpServletResponse response, Model model) {
//				return "admin/admin_member";
//			}
//
//			// 회원리스트
//			@RequestMapping("/admin_member_list.do")
//			public String admin_member_list(HttpServletRequest request, HttpServletResponse response, Model model) {
//				memberDAO dao = new memberDAO(dataSource);
//				ArrayList<memberTO> lists = dao.memberList(); 
//
//				model.addAttribute("lists", lists);
//
//				return "data/member_list_json";
//			}
//			
//			  @RequestMapping("/admin_member_modify_ok.do") 
//			  public String admin_member_modify_ok(HttpServletRequest request, HttpServletResponse response, Model model) {
//				  
//				  //입력하는 값를 DB로 가져가기 
//				  memberTO to = new memberTO();
//				  to.setPassword(request.getParameter("password"));
//				  to.setNickname(request.getParameter("nickname"));
//				  to.setEmail(request.getParameter("email"));
//				  to.setPhone(request.getParameter("phone"));
//				  to.setIntroduce(request.getParameter("introduce"));
//				  to.setPicture(request.getParameter("picture"));
//			  
//			  
//			  memberDAO dao = new memberDAO(dataSource); 
//			  int flag = dao.memberModifyOk(to);
//			  
//			  
//			  model.addAttribute("flag", flag);
//			  
//			  return "data/member_modify_json"; }
//			 
//			// 회원삭제
//				@RequestMapping("/admin_member_delete.do")
//				public String admin_member_delete(HttpServletRequest request, HttpServletResponse response, Model model) {
//
//					memberTO mto = new memberTO();
//					mto.setId(request.getParameter("id"));
//					mto.setPassword(request.getParameter("password"));
//
//					recipeTO rcto = new recipeTO();
//					rcto.setRcwriter(request.getParameter("id"));
//					
//					reviewTO rvto = new reviewTO();
//					rvto.setRvwriter(request.getParameter("id"));
//					
//					memberDAO dao = new memberDAO(dataSource);
//
//					int flag = dao.memberDeleteOK(mto, rcto, rvto);
//
//					model.addAttribute("flag", flag);
//					return "data/member_delete_json";
//				}
//
//			@RequestMapping("/admin_recipe.do")
//			public String admin_recipe(HttpServletRequest request, HttpServletResponse response, Model model) {
//
//				return "admin/admin_recipe";
//			}
//
//			//관리자 - 레시피 리스트
//			@RequestMapping("/admin_recipe_list.do")
//			public String admin_recipe_list(HttpServletRequest request, HttpServletResponse response, Model model) {
//				recipeDAO dao = new recipeDAO(dataSource);
//				ArrayList<recipeTO> lists = dao.recipelist();
//
//				model.addAttribute("lists", lists);
//
//				return "data/recipe_list_json";
//			}
//			//관리자 - 레시피 수정
//			@RequestMapping("/admin_recipe_modify.do")
//			public String admin_recipe_modify(HttpServletRequest request, HttpServletResponse response, Model model) {
//				
//				recipeTO to = new recipeTO();
//				to.setRcseq(request.getParameter("rcseq"));
//				to.setSubject(request.getParameter("subject"));
//				to.setIntroduce(request.getParameter("introduce"));
//				to.setrfilename(request.getParameter("rfilename"));
//				to.setUrl(request.getParameter("url"));
//				to.setTip(request.getParameter("tip"));
//
//				recipeDAO dao = new recipeDAO(dataSource);
//				int flag = dao.recipeModifyOK(to);
//
//				model.addAttribute("flag", flag);
//				return "data/recipe_modify_json";
//			}
//			@RequestMapping("/admin_recipe_delete.do")
//			public String admin_recipe_delete(HttpServletRequest request, HttpServletResponse response, Model model) {
//				String subject = request.getParameter("subject");
//				String rcseq = request.getParameter("rcseq");
//
//				recipeTO to = new recipeTO();
//				to.setRcseq(rcseq);
//				to.setSubject(subject);
//
//				recipeDAO dao = new recipeDAO(dataSource);
//				int flag = dao.recipeDeleteOK(to);
//
//				model.addAttribute("flag", flag);
//				return "data/recipe_delete_json";
//			}
//
//			@RequestMapping("/admin_review.do")
//			public String admin_review(HttpServletRequest request, HttpServletResponse response, Model model) {
//			
//				
//				return "admin/admin_review";
//			}
//
//			// 후기리스트
//			@RequestMapping("/admin_review_list.do")
//			public String admin_review_list(HttpServletRequest request, HttpServletResponse response, Model model) {
//				reviewDAO dao = new reviewDAO(dataSource);
//				ArrayList<reviewTO> lists = dao.reviewList();
//				model.addAttribute("lists", lists);
//				return "data/review_list_json";
//			}
//
//			@RequestMapping("/admin_review_modify.do")
//			public String admin_review_modify(HttpServletRequest request, HttpServletResponse response, Model model) {
//
//				reviewTO to = new reviewTO();
//				to.setRvcontent(request.getParameter("rvcontent"));
//				to.setRvseq(request.getParameter("rvseq"));
//
//				reviewDAO dao = new reviewDAO(dataSource);
//				int flag = dao.reviewModifyOK(to); 
//
//				model.addAttribute("flag", flag);
//				return "data/review_modify_json";
//			}
//
//			@RequestMapping("/admin_review_delete.do")
//			public String admin_review_delete(HttpServletRequest request, HttpServletResponse response, Model model) {
//				String rvseq = request.getParameter("rvseq");
//				String rcseq = request.getParameter("rcseq");
//
//				reviewTO to = new reviewTO();
//				to.setRcseq(rcseq);
//				to.setRvseq(rvseq);
//
//				reviewDAO dao = new reviewDAO(dataSource);
//				int flag = dao.reviewDeleteOK(to);
//
//				model.addAttribute("to", to);
//				model.addAttribute("flag", flag);
//				return "data/review_delete_json";
//			}
			
			// 레시피 뷰_스크랩 +1
		   @RequestMapping("/recipe_scrapPlus.do")
		   public String recipe_scrapPlus(HttpServletRequest request, HttpServletResponse response, Model model) {
		      String rcseq = request.getParameter("rcseq");
		      String id = request.getParameter("id");
		                  
		      scrapTO sto = new scrapTO();
		      sto.setRcseq(rcseq);
		      sto.setId(id);
		      
		      int flag = 0;      
		      scrapDAO dao = new scrapDAO(dataSource);
		            
		      if(!dao.checkScrapExist(sto)) { 
		
		         flag = dao.scrapPlus(sto); 
		         }
		      
		      
		      
		      model.addAttribute("flag", flag);
		      return "data/scrap_json";
		   }
			   
			 // 레시피 뷰_스크랩get
			 @RequestMapping("/recipe_getScrapCount.do")
			 public String recipe_getScrapCount(HttpServletRequest request, HttpServletResponse response, Model model) {
			     String rcseq = request.getParameter("rcseq");
			 
			 scrapTO sto = new scrapTO();
			 sto.setRcseq(rcseq);
			 
			 scrapDAO dao = new scrapDAO(dataSource);
			 String scrap = dao.getScrapCount(sto);
			 
			 model.addAttribute("scrap", scrap);
			 return "data/scrap_data_json";
			  }
			      
			      // 후기
	   		@RequestMapping("/review.do")
	   		public String review(HttpServletRequest request, HttpServletResponse response, Model model) {
	   			int revPage = 1;
	   			
	   			if(request.getParameter("revPage") != null) {
	   				revPage = Integer.parseInt(request.getParameter("revPage"));
	   			}
	   			
	   			model.addAttribute("revPage", revPage);
	   			
	   			return "modoo_review";
	   		}
	       
	       @RequestMapping("/all_review_data.do")
	       public String divcisionReviewData(HttpServletRequest request, HttpServletResponse response, Model model) {
	    	   
	    	   int revPage = Integer.parseInt(request.getParameter("revPage")); 
	    	   	    	   
	   			reviewDAO revDAO = new reviewDAO(dataSource);
	   			pagingTO listTO = new pagingTO();
		   				   		
		   		listTO.setCpage(revPage);
		   		listTO.setTotalRecord(revDAO.getRevCount());
		   		listTO.setTotalPage( ( ( listTO.getTotalRecord() - 1 ) / listTO.getRecordPerPage() ) + 1 );
		   		listTO.setStartBlock( ( ( listTO.getCpage() - 1) / listTO.getBlockPerPage() ) * listTO.getBlockPerPage() + 1 );
		   		listTO.setEndBlock( ( ( listTO.getCpage() - 1) / listTO.getBlockPerPage() ) * listTO.getBlockPerPage() + listTO.getBlockPerPage() );
		   		if( listTO.getEndBlock() >= listTO.getTotalPage() ) {
		   			listTO.setEndBlock(listTO.getTotalPage() );
		   		}
		   		
		   		int skip = ( listTO.getCpage() - 1 ) * listTO.getRecordPerPage();	
		   		
		   		ArrayList<reviewTO> revList = revDAO.getRevList(skip);   	
		   		
		   		model.addAttribute("revList", revList);
	        
		   		return "data/all_review_data_json";
	       } 
			       
	       @RequestMapping("/all_review_page.do")
	       public String ReviewPaging(HttpServletRequest request, HttpServletResponse response, Model model) {
	    	   
	    	    pagingTO listTO = new pagingTO();
	   			reviewDAO revDAO = new reviewDAO(dataSource);
	   			   			
   				int revPage = Integer.parseInt(request.getParameter("revPage"));
	   					   				   		
		   		listTO.setCpage(revPage);
		   		listTO.setTotalRecord(revDAO.getRevCount());
		   		listTO.setTotalPage( ( ( listTO.getTotalRecord() - 1 ) / listTO.getRecordPerPage() ) + 1 );
		   		listTO.setStartBlock( ( ( listTO.getCpage() - 1) / listTO.getBlockPerPage() ) * listTO.getBlockPerPage() + 1 );
		   		listTO.setEndBlock( ( ( listTO.getCpage() - 1) / listTO.getBlockPerPage() ) * listTO.getBlockPerPage() + listTO.getBlockPerPage() );
		   		if( listTO.getEndBlock() >= listTO.getTotalPage() ) {
		   			listTO.setEndBlock(listTO.getTotalPage() );
		   		}
		   				   		
		   		model.addAttribute("pagingTO", listTO);		   		
	        
		   		return "data/paging_json";   
	       } 
			       
	       @RequestMapping("/division_page.do")
	       public String DivisionPaging(HttpServletRequest request, HttpServletResponse response, Model model) {
	    	   
	    	    pagingTO listTO = new pagingTO();
	   			viewDAO divDAO = new viewDAO(dataSource);
	   			   			
   				int divPage = Integer.parseInt(request.getParameter("divPage"));
   							   					   				   		
		   		listTO.setCpage(divPage);
		   		listTO.setTotalRecord(divDAO.getTotalRecord());
		   		listTO.setTotalPage( ( ( listTO.getTotalRecord() - 1 ) / listTO.getRecordPerPage() ) + 1 );
		   		listTO.setStartBlock( ( ( listTO.getCpage() - 1) / listTO.getBlockPerPage() ) * listTO.getBlockPerPage() + 1 );
		   		listTO.setEndBlock( ( ( listTO.getCpage() - 1) / listTO.getBlockPerPage() ) * listTO.getBlockPerPage() + listTO.getBlockPerPage() );
		   		if( listTO.getEndBlock() >= listTO.getTotalPage() ) {
		   			listTO.setEndBlock(listTO.getTotalPage() );
		   		}
		   				   		
		   		model.addAttribute("pagingTO", listTO);		   		
	        
		   		return "data/paging_json";   
	       } 
	       
	       @RequestMapping("/ranking_page.do")
	       public String RankPaging(HttpServletRequest request, HttpServletResponse response, Model model) {
	    	   
	    	    pagingTO listTO = new pagingTO();
	   			viewDAO divDAO = new viewDAO(dataSource);
	   			   			
   				int rankPage = Integer.parseInt(request.getParameter("rankPage"));
   							   					   				   		
		   		listTO.setCpage(rankPage);
		   		listTO.setTotalRecord(divDAO.getTotalRecord());
		   		listTO.setTotalPage( ( ( listTO.getTotalRecord() - 1 ) / listTO.getRecordPerPage() ) + 1 );
		   		listTO.setStartBlock( ( ( listTO.getCpage() - 1) / listTO.getBlockPerPage() ) * listTO.getBlockPerPage() + 1 );
		   		listTO.setEndBlock( ( ( listTO.getCpage() - 1) / listTO.getBlockPerPage() ) * listTO.getBlockPerPage() + listTO.getBlockPerPage() );
		   		if( listTO.getEndBlock() >= listTO.getTotalPage() ) {
		   			listTO.setEndBlock(listTO.getTotalPage() );
		   		}
		   				   		
		   		model.addAttribute("pagingTO", listTO);		   		
	        
		   		return "data/paging_json";   
	       } 
			       
			       
	    @SuppressWarnings("unchecked")
		@RequestMapping("/seenRecipe.do")
	       public String seenRecipe(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {
	    	   
	    	   ArrayList<String> rcList = (ArrayList<String>) session.getAttribute("rcList");
	    	   		    	   
	   			recipeDAO rcDAO = new recipeDAO(dataSource);
	   			HashMap<String, String> rcFileNames = rcDAO.getFileName(rcList);
	   			
	   			model.addAttribute("rcFileNames", rcFileNames);		   		
	        
		   		return "data/rcFileNames_json";  
	       } 
	       
	    // 요리후기 > 내가 쓴 요리 후기_데이터
	       @RequestMapping("/mypage_review_write_data.do")
	       public String mypage_review_write_data(HttpServletRequest request, HttpServletResponse response, Model model) {

	          String id = request.getParameter("id");
	             
	          mypageReviewTO mprwTO = new mypageReviewTO();
	          mprwTO.setId(id);
	             
	          mypageReviewDAO dao = new mypageReviewDAO(dataSource);
	          ArrayList<mypageReviewTO> lists = dao.mypageReplyWriteList(mprwTO);
	             
	          model.addAttribute("lists", lists);
	             
	          return "data/mypage_review_write_data_json";
	       }
			       
	    // 요리후기 > 내가 받은 요리 후기_데이터
	       @RequestMapping("/mypage_review_get_data.do")
	       public String mypage_review_get_data(HttpServletRequest request, HttpServletResponse response, Model model) {
	             
	          String id = request.getParameter("id");
	             
	          mypageReviewTO mrTO = new mypageReviewTO();
	          mrTO.setId(id);
	             
	          mypageReviewDAO dao = new mypageReviewDAO(dataSource);
	          ArrayList<mypageReviewTO> lists = dao.mypageReplyGetList(mrTO);
	          
	          model.addAttribute("lists", lists);
	          
	          return "data/mypage_review_get_data_json";
	       }
	       
	    // 마이페이지 > 회원정보
	       @RequestMapping("/mypage_memberData.do")
	       public String mypage_memberData(HttpServletRequest request, HttpServletResponse response, Model model) {
	             
	          String id = request.getParameter("id");
	          String kind = request.getParameter("kind");
	          
	          mypageMemberDAO dao = new mypageMemberDAO(dataSource);
	          
	          if(kind.equals("allview")) {
	                               
	             int allview = dao.mypageAllview(id);
	             
	             model.addAttribute("allview", allview);
	             
	             return "data/mypage_allview_json";   
	          }else if(kind.equals("allrev")) {
	             
	             int allrev = dao.mypageRev(id);
	             
	             model.addAttribute("allrev", allrev);
	             
	             return "data/mypage_allrev_json";
	          }else if(kind.equals("allscrap")) {
	             
	             int allscrap = dao.mypageAllscrap(id);
	             
	             model.addAttribute("allscrap", allscrap);
	             return "data/mypage_allscrap_json";
	          }else {
	             ArrayList<mypageMemberTO> lists = dao.mypageMemberList(id);
	             
	             model.addAttribute("lists", lists);
	             return "data/mypage_memberInfo_json";
	          }
	          
	       }
			       
	     //사용자 - 회원정보 수정페이지 이동
           @RequestMapping("/user_modify.do")
           public String info_modify(HttpServletRequest request, HttpServletResponse response, Model model) {
              String id = request.getParameter("id");   
              
              model.addAttribute("id", id);
              return "user_modify";
           }
           
       //사용자 - 회원정보 수정페이지 데이터
           @RequestMapping("/user_modify_data.do")
           public String info_modify_data(HttpServletRequest request, HttpServletResponse response, Model model) {
              String id = request.getParameter("id");   
              
              userModifyDAO dao = new userModifyDAO(dataSource);
              
              ArrayList<userModifyTO> lists = dao.userModifyInfo(id);
              model.addAttribute("lists", lists);
              
              return "data/user_modify_json";
           }
           
       //사용자 - 회원정보 수정페이지 데이터_닉네임
           @RequestMapping("/user_modify_nickname.do")
           public String info_modify_nickname(HttpServletRequest request, HttpServletResponse response, Model model) {
              String nickname = request.getParameter("nickname");   
              String id = request.getParameter("id");   
              
              userModifyDAO dao = new userModifyDAO(dataSource);
              
              int flag = dao.nickModify(nickname, id);
              model.addAttribute("flag", flag);
              
              return "data/user_modify_flag";
           }
           
       //사용자 - 회원정보 수정페이지 데이터_이메일
           @RequestMapping("/user_modify_email.do")
           public String info_modify_email(HttpServletRequest request, HttpServletResponse response, Model model) {
              String email = request.getParameter("email");   
              String id = request.getParameter("id");   
              
              userModifyDAO dao = new userModifyDAO(dataSource);
              
              int flag = dao.nickModify(email, id);
              model.addAttribute("flag", flag);
              
              return "data/user_modify_flag";
           }

       //사용자 - 회원정보 수정페이지 삭제
           @RequestMapping("/user_del.do")
           public String info_del(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {
                                
              String id = request.getParameter("id");   
              
              userModifyDAO dao = new userModifyDAO(dataSource);
              
              int flag = dao.userDel(id);
              
              if(flag == 1) {
                 
                 session.invalidate();
              }
              
              model.addAttribute("flag", flag);
              
              return "data/user_modify_flag";
           }

}
