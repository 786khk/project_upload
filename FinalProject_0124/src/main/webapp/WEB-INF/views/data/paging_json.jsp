<%@page import="model1.pagingTO"%>
<%@page import="model1.reviewTO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model1.stepTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pagingTO to = (pagingTO) request.getAttribute("pagingTO");
	       
    JSONObject obj = new JSONObject();
    
      obj.put("cpage", to.getCpage());
      obj.put("recordPerPage", to.getRecordPerPage());
      obj.put("blockPerPage", to.getBlockPerPage());
      obj.put("totalPage", to.getTotalPage());   
      obj.put("totalRecord", to.getTotalRecord());   
      obj.put("startBlock", to.getStartBlock());   
      obj.put("endBlock", to.getEndBlock()); 

      out.println(obj);
%> 