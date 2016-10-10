<%@page import="WorkOfTheForms.IssuedReels"%>
<%@page import="WorkOfTheForms.Stock"%>
<%@page import="WorkOfTheForms.DBManager"%>
<%@page import="WorkOfTheForms.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userName") == null) {
        response.sendRedirect("login_page.jsp");
    }
    // else if(!session.getAttribute("role").toString().equalsIgnoreCase("admin")){
    //     response.sendRedirect("../login.jsp");
    // }
%>
<%
    ArrayList<IssuedReels> list = DBManager.getAllIssuedReels();

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="stylesheets/template.css" rel="stylesheet" type="text/css"/>
        
        <title>All Issued Reels</title>

        
    </head>
    <body >
        <div class="container-fluid">
            <div id="header">
                <%@include file="/WEB-INF/jspf/header.jspf"%>
            </div>
            <div id="menu">
                <%@include file="/WEB-INF/jspf/menu.jspf"%>
            </div>
            <div id="content" >
                <center><p style="font-size: 30px; font-family: sans-serif; font-weight: bolder;font-style: italic; color: brown ;"><b>All Issued Reels</b></p></center>

              
                <table class="table table-bordered table-responsive table-hover">
                    <thead>
                        <tr>
                            
                            <th>Date</th>
                            <th>Product Name</th>
                            <th>Reel Number</th>
                            <th>Wastage</th>
                            <th>Quantity</th>
                            
                            
                        </tr>
                    </thead>
                    <tbody>
                        <% for (IssuedReels reel : list) {%>

                        <tr>
                            
                            
                            <td><%=reel.getIssueDate()%></td>
                            <td><%=reel.getProductName()%></td>
                            <td><%=reel.getReelNumber()%></td>
                            <td><%=reel.getWastage()%></td>
                            <td><%=reel.getQuantity()%></td>
                            
                        </tr>
                        <% }%>
                    </tbody>
                </table>
              
            </div>
            <div id="footer">
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>

    </body>
</html>
