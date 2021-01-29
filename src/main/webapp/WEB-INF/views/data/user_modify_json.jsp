<%@page import="model1.userModifyTO"%>
<%@page import="model1.mypageMemberTO"%>
<%@page import="model1.mypagePublicTO"%>
<%@page import="model1.recipeTO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model1.viewTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
   ArrayList<userModifyTO> lists = (ArrayList<userModifyTO>)request.getAttribute("lists");   

   JSONArray array = new JSONArray();
   
   for(userModifyTO to : lists){
      String nickname = to.getNickname();
      String email = to.getEmail();
      
      JSONObject obj = new JSONObject();
      obj.put("nickname", nickname);
      obj.put("email", email);
     
      
      array.add(obj);
   }   
      
   out.println(array);
         
%>