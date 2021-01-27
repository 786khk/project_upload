<%@page import="model1.pagingTO"%>
<%@page import="model1.reviewTO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model1.stepTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
	ArrayList<reviewTO> lists = (ArrayList<reviewTO>) request.getAttribute("lists");   
	
	JSONArray array = new JSONArray();
	
	for(reviewTO to : lists){   
	   
	   JSONObject obj = new JSONObject();
	   
	   obj.put("rvseq", to.getRvseq());
	   obj.put("nickname", to.getNickname()); 
	 obj.put("rvwriter", to.getRvwriter()); 
	   obj.put("rvwdate", to.getRvwdate());
	   obj.put("star", to.getStar());   
	   obj.put("rvcontent", to.getRvcontent());   
	   obj.put("rev", to.getRev());   
	   obj.put("rvfilename", to.getRvfilename()); 
	   obj.put("rcseq", to.getRcseq());
	   
	   array.add(obj);
	}   
	
	out.println(array);

%> 