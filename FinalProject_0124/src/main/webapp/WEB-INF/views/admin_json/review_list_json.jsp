<%@page import="model1.adminTO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model1.reviewTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 ArrayList<adminTO> lists = (ArrayList<adminTO>)request.getAttribute("lists");
 
 JSONArray jarr = new JSONArray();
 
 for(adminTO to : lists){ 
 String rvseq = to.getRvseq();
 String rcseq = to.getRcseq();
 String rvwriter = to.getRvwriter();
 int star = to.getStar();
 String rvcontent = to.getRvcontent();
 String rvwdate = to.getRvwdate();
 //String nickname = to.getNickname();
 JSONObject obj = new JSONObject();
 obj.put("rvseq", rvseq);
 obj.put("rcseq", rcseq);
 //obj.put("nickname", nickname);
 obj.put("rvwriter", rvwriter);
 obj.put("star", star);
 obj.put("rvwdate", rvwdate);
 obj.put("rvcontent", rvcontent);
 
 jarr.add(obj);
 
 }

 out.println(jarr);
 
 
 %>   