<%@page import="model1.adminTO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model1.recipeTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
ArrayList<adminTO> lists = (ArrayList<adminTO>)request.getAttribute("lists");


JSONArray jarr = new JSONArray();

for(adminTO to : lists){
	String rcseq = to.getRcseq();
	String rcwriter = to.getRcwriter();
	String subject = to.getSubject();
	String introduce = to.getIntroduce();
	String url = to.getUrl();
	String tip = to.getTip();
	String category1 = to.getCategory1();
	String category2 = to.getCategory2();
	String wdate = to.getWdate();
	String hit = to.getHit();
	String rev = to.getRev();
	
	
	JSONObject obj = new JSONObject();
	obj.put("rcseq", rcseq);
	obj.put("rcwriter", rcwriter);
	obj.put("subject", subject);
	obj.put("introduce", introduce);
	obj.put("url", url);
	obj.put("tip", tip);
	obj.put("category1",category1);
	obj.put("category2",category2);
	obj.put("wdate", wdate);
	obj.put("hit", hit);
	obj.put("rev", rev);
	jarr.add(obj);
}
out.println(jarr);


%>