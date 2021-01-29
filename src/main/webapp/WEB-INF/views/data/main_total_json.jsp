<%@page import="org.json.simple.JSONObject"%>
<%@page import="model1.recipeTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/json; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
  <%
  //ArrayList<recipeTO> lists = (ArrayList<recipeTO>)request.getAttribute("lists");
 recipeTO rto = (recipeTO)request.getAttribute("to");
  String rcseq = rto.getRcseq();
  String hit = rto.getHit();
  JSONObject obj = new JSONObject();
  obj.put("rcseq", rcseq);
  obj.put("hit", hit);
  
 // arr.add(obj);
  
  
  out.println(obj);
  
  %>
