<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="model1.recipeTO"%>
<%@page import="model1.recipeDAO"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%
	int rvseq = (int) request.getAttribute("rvseq");
	
	JSONObject obj = new JSONObject();
	obj.put("rvseq", rvseq);
			
	out.println(obj);
%>
