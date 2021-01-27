<%@page import="model1.mypagePublicTO"%>
<%@page import="model1.recipeTO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model1.viewTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
   ArrayList<mypagePublicTO> list = (ArrayList<mypagePublicTO>)request.getAttribute("list");   
   //int totalRecord = (Integer)request.getAttribute("totalRecord");
   //System.out.println(totalRecord);
   JSONArray array = new JSONArray();
   
   for(mypagePublicTO to : list){
      String rcseq = to.getRcseq();
      String nickname = to.getNickname();
      String subject  = to.getSubject();
      String picture = to.getPicture();
      String hit = to.getHit();   
      String rfilename = to.getrfilename();
      String wdate = to.getWdate();
      String rev = to.getRev();
      //System.out.println(filename);
      
      JSONObject obj = new JSONObject();
      obj.put("rcseq", rcseq);
      obj.put("nickname", nickname);
      obj.put("subject", subject);
      obj.put("hit", hit);
      obj.put("picture", picture);
      obj.put("rfilename", rfilename);
      obj.put("wdate", wdate);
      obj.put("rev", rev);
      
      array.add(obj);
   }   
   
   JSONObject result = new JSONObject();
   //result.put("totalRecord", totalRecord);
   result.put("array", array);
   
   out.println(result);
         
%>