<%@page import="model1.recipeTO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model1.viewTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
   ArrayList<viewTO> lists = (ArrayList<viewTO>)request.getAttribute("lists");   
   int totalRecord = (Integer)request.getAttribute("totalRecord");
   JSONArray array = new JSONArray();
   
   for(viewTO to : lists){
          
      JSONObject obj = new JSONObject();
      obj.put("rcseq", to.getRcseq());
      obj.put("nickname", to.getNickname());
      obj.put("subject",  to.getSubject());
      obj.put("hit", to.getHit());
      obj.put("picture", to.getPicture());
      obj.put("rfilename", to.getrfilename());
      obj.put("wdate", to.getWdate());
      obj.put("rev", to.getRev());
      
      array.add(obj);
   }   
   
   JSONObject result = new JSONObject();
   result.put("totalRecord", totalRecord);
   result.put("array", array);
   
   out.println(result);
         
%>