<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model1.stepTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
   ArrayList<stepTO> lists = (ArrayList<stepTO>)request.getAttribute("lists");   
   
   JSONArray array = new JSONArray();
   
   for(stepTO to : lists){
      JSONObject obj = new JSONObject();
      
      obj.put("rcseq", to.getRcseq());
      obj.put("storder", to.getStorder());
      obj.put("filename", to.getFilename());
      obj.put("content", to.getContent());      
      
      array.add(obj);
   }   
         
   out.println(array);
   
%>