<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@page import="model1.materialTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model1.materialDAO"%>
<% 
	JSONObject jsonObject = new JSONObject();
	int flag = (int) request.getAttribute("flag");	
	jsonObject.put("flag", flag);
	
	out.println(jsonObject);
%>