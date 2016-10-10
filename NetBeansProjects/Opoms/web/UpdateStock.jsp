<%@page import="WorkOfTheForms.Stock"%>
<%@page import="java.util.ArrayList"%>
<%@page import="WorkOfTheForms.DBManager"%>
<%@page import="WorkOfTheForms.Product"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("userName")==null){
        response.sendRedirect("login_page.jsp");
    }
   // else if(!session.getAttribute("role").toString().equalsIgnoreCase("admin")){
   //     response.sendRedirect("../login.jsp");
   // }
%>
<%
    int reelNumber = Integer.parseInt(request.getParameter("reelNumber"));
    
  
        double reelSize = Double.parseDouble(request.getParameter("reelSize"));
        int reelType = Integer.parseInt(request.getParameter("reelType"));
        String mill = request.getParameter("mill");
        int bf = Integer.parseInt(request.getParameter("bf"));
        String paperType = request.getParameter("paperType");
        double reelWeight = Double.parseDouble(request.getParameter("reelWeight"));
        
        Stock s = new Stock(reelNumber, reelSize, reelType, mill, bf, paperType, reelWeight);
        
        DBManager.updateStock(s);
    
    
    
    
    response.sendRedirect("ViewStock.jsp");
%>
