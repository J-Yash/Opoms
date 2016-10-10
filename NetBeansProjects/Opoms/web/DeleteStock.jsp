<%@page import="WorkOfTheForms.DBManager"%>
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
    DBManager.deleteStock(reelNumber);
    //Redirection
    response.sendRedirect("ViewStock.jsp");
%>
