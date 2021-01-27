<%@page import="model1.recipeViewTO"%>
<%@page import="model1.materialTO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model1.stepTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
   ArrayList<recipeViewTO> lists = (ArrayList<recipeViewTO>)request.getAttribute("lists");   
   
   JSONArray array = new JSONArray();

   for(recipeViewTO to : lists){
	  
      JSONObject obj = new JSONObject();
      
      obj.put("rcseq", to.getRcseq());
      obj.put("nickname", to.getNickname());
      obj.put("subject", to.getSubject());
      obj.put("rintroduce", to.getRintroduce());
      obj.put("mintroduce", to.getMintroduce());
      obj.put("rfilename", to.getrfilename());
      obj.put("url", to.getUrl());
      obj.put("tip", to.getTip());
      obj.put("wdate", to.getWdate());
      obj.put("hit", to.getHit());
      obj.put("rev", to.getRev());
      obj.put("picture", to.getPicture());
      obj.put("allview", to.getAllview());      
      
      array.add(obj);
   }   
         
   out.println(array);
   
%>