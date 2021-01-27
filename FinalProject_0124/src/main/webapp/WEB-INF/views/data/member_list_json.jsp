<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%@page import="model1.memberDAO"%>
<%@page import="model1.memberTO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	JSONArray jarr = new JSONArray();
	ArrayList<memberTO> lists = (ArrayList<memberTO>)request.getAttribute("lists");

	for(memberTO to : lists){
		String id = to.getId();
		String password = to.getPassword();
		String nickname = to.getNickname();
		String email = to.getEmail();
		String gender = to.getGender();
		String phone = to.getPhone();
		String introduce = to.getIntroduce();
		String picture = to.getPicture();
		int allview = to.getAllview();
	
		JSONObject obj = new JSONObject();
		obj.put("id", id);
		obj.put("password", password);
		obj.put("nickname", nickname);
		obj.put("email", email);
		obj.put("gender", gender);
		obj.put("phone", phone);
		obj.put("introduce", introduce);
		obj.put("picture", picture);
		obj.put("allview", allview);
		jarr.add(obj);
	}
	out.println(jarr);




%>    
