<%@page import="model1.materialTO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model1.stepTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
   ArrayList<materialTO> lists = (ArrayList<materialTO>)request.getAttribute("lists");   
   
   JSONArray array = new JSONArray();
   
   for(materialTO to : lists){
      String name = to.getName(); 
      String amount = to.getAmount();      
      
      JSONObject obj = new JSONObject();
      obj.put("name", name);
      obj.put("amount", amount);
      
      array.add(obj);
   }   
         
   out.println(array);
   
%>