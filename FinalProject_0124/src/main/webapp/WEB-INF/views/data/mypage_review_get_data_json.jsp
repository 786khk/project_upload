<%@page import="model1.mypageReviewTO"%>
<%@page import="model1.reviewTO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model1.stepTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   ArrayList<mypageReviewTO> lists = (ArrayList<mypageReviewTO>)request.getAttribute("lists");   
   
   JSONArray array = new JSONArray();
   
   for(mypageReviewTO to : lists){
      String nickname = to.getNickname();
      String rvwdate = to.getRvwdate();
      int star = to.getStar();
      String rvcontent = to.getRvcontent();
      String rev = to.getRev();
      String rvfilename = to.getRvfilename();      
      String rcseq = to.getRcseq();
      String rvseq = to.getRvseq();
      //System.out.println(rev);
      
      JSONObject obj = new JSONObject();
      obj.put("nickname", nickname);
      obj.put("rvwdate", rvwdate);
      obj.put("star", star);   
      obj.put("rvcontent", rvcontent);   
      obj.put("rvcontent", rvcontent);   
      obj.put("rvfilename", rvfilename);
      obj.put("rev", rev);
      obj.put("rcseq", rcseq);
      obj.put("rvseq", rvseq);
      
      array.add(obj);
   }   
         
   out.println(array);
%> 