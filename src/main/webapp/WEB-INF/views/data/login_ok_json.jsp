<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="model1.recipeTO"%>
<%@page import="model1.recipeDAO"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%
	int flag = (int) request.getAttribute("flag");
	String id = (String) request.getAttribute("id");
	
	JSONObject obj = new JSONObject();
	obj.put("flag", flag);
	obj.put("id", id);
			
	out.println(obj);
%>
