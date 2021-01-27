<%@page import="java.util.HashMap"%>
<%@page import="model1.recipeViewTO"%>
<%@page import="model1.materialTO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model1.stepTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   HashMap<String, String> fileList = (HashMap<String, String>)request.getAttribute("rcFileNames");
     
      JSONArray array = new JSONArray();
      
      for (String key : fileList.keySet()){
    	  JSONObject obj = new JSONObject();	
    	  obj.put("rcseq", key);  
    	  obj.put("filename", fileList.get(key));
    	  
    	  array.add(obj);
      }
      
         
   out.println(array);
   
%>