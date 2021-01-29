<%@page import="model1.memberDAO"%>
<%@page import="model1.memberTO"%>
<%@page import="org.json.simple.JSONObject"%>

<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
   int flag = (Integer)request.getAttribute("flag");
   
   JSONObject obj = new JSONObject();
   
   obj.put("flag", flag);
   
   out.println(obj);
%>