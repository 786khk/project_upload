<%@page import="model1.adminTO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>


<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	JSONArray jarr = new JSONArray();
	ArrayList<adminTO> lists = (ArrayList<adminTO>)request.getAttribute("lists");

	for(adminTO to : lists){
		String id = to.getId();
		String password = to.getPassword();
		String nickname = to.getNickname();
		String email = to.getEmail();
		String gender = to.getGender();
		String phone = to.getPhone();
		String introduce = to.getIntroduce();
		
		JSONObject obj = new JSONObject();
		obj.put("id", id);
		obj.put("password", password);
		obj.put("nickname", nickname);
		obj.put("email", email);
		obj.put("gender", gender);
		obj.put("phone", phone);
		obj.put("introduce", introduce);
		
	
		jarr.add(obj);
	}
	out.println(jarr);
	



%>    
