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
    int product_code = Integer.parseInt(request.getParameter("Product_code"));
    DBManager.deleteProduct(product_code);
    //Redirection
    response.sendRedirect("ViewProduct.jsp");
%>
