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
   
   ArrayList<mypageMemberTO> lists = (ArrayList<mypageMemberTO>)request.getAttribute("lists");   

   JSONArray array = new JSONArray();
   
   for(mypageMemberTO to : lists){
      String nickname = to.getNickname();
      String picture = to.getPicture();
      String introduce = to.getIntroduce();
      String scrap = to.getScrap();
      
      JSONObject obj = new JSONObject();
      obj.put("nickname", nickname);
      obj.put("picture", picture);
      obj.put("introduce", introduce);
      obj.put("scrap", scrap);
      
      array.add(obj);
   }   
      
   out.println(array);
         
%>