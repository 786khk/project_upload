<%@page import="model1.recipeViewTO"%>
<%@page import="model1.materialTO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model1.stepTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String scrap = (String)request.getAttribute("scrap");
     
      JSONObject obj = new JSONObject();
      
      obj.put("scrap", scrap);
         
   out.println(obj);
   
%>