<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	  
	String result = (String) request.getAttribute("Result");
	
	out.println("<script type='text/javascript'>");
	out.println("alert('"+result+"');");
	out.println("location.href='./main.do';");
	out.println("</script>");
%>