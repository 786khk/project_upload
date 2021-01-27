<%@page import="model1.rankingTO"%>
<%@page import="model1.recipeTO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model1.viewTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
   ArrayList<rankingTO> lists = (ArrayList<rankingTO>)request.getAttribute("lists"); 
   JSONArray array = new JSONArray();
   
   for(rankingTO to : lists){
      JSONObject obj = new JSONObject();
      obj.put("rcseq", to.getRcseq());
      obj.put("subject", to.getSubject());
      obj.put("rfilename", to.getrfilename());
      array.add(obj);
   }   
   out.println(array);  
%>