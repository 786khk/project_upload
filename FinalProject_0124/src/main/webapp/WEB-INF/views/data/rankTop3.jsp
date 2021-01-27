<%@page import="model1.rankingTO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="model1.recipeViewTO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/json; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
    JSONArray arr = new JSONArray();
    ArrayList<rankingTO> list = (ArrayList<rankingTO>)request.getAttribute("list");
    
    for(rankingTO to : list){
    	String rcseq = to.getRcseq();
    	String rfilename = to.getrfilename();
    	String subject = to. getSubject();
    	
    	
    	JSONObject obj = new JSONObject();
    	obj.put("rcseq", rcseq);
    	obj.put("rfilename", rfilename);
    	obj.put("subject", subject);
    	
    	arr.add(obj);
    	
    }
    
    out.println(arr);
    
    
    %>
