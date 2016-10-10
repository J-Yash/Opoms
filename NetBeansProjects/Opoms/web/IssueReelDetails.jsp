
<%@page import="WorkOfTheForms.DBManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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

<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="stylesheets/template.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.1.0.min.js" type="text/javascript"></script>
        <style>
            #form
            {
                margin: auto;
                max-width: 400px;

            }

        </style>
        <title>Issue Reel Details-OPOMS</title>
       

    </head>
    <body>
        <div class="container-fluid">
            <div id="header">
                <%@include file="/WEB-INF/jspf/header.jspf"%>
            </div>
            <div id="menu">
                <%@include file="/WEB-INF/jspf/menu.jspf"%>
            </div>
            <div id="content">
                <center><p style="font-size: 30px; font-family: sans-serif; font-weight: bolder;font-style: italic; color: brown ;"><b>Issue Reel Details</b></p></center>
                <div id="form">
                    <form class="form-group" name="IssueReelDetails" action="IssueReelDetails" method="POST" >

                        Product Name: <input class="form-control" type="text" value="<%=request.getAttribute("productName")%>" name="productName" readonly=""/><br/><br/>
                        Decal: <input type="text" name="decal" value="<%=request.getAttribute("decal")%>" readonly="" class="form-control" /><br/><br/>
                        Sheet Size: <input type="text" name="sheetSize" value="<%=request.getAttribute("sheetSize")%>" readonly="" class="form-control" /><br/><br/>
                        Reel to be Issued:
                        
                        <%
                            for(int i=0;i<(Integer)request.getAttribute("counter");i++)
                            {
                                %>
                                <input type="text" name="reelNumber<%=(i+1)%>" value="<%=request.getAttribute("reelNumber"+(i+1))%> - <%=request.getAttribute("reelPaperType"+(i+1))%>" class="form-control" readonly="" /><br/>
                                
                        
                        <%
                            }
                        %>

                        <br/><br/>
                        Wastage(in inch): <input type="text" class="form-control" name="wastage" value="<%=request.getAttribute("wastage")%>" readonly="" /><br/><br/>
                        
                        <input type="text" name="counter" value="<%=request.getAttribute("counter")%>" readonly="" hidden=""/>
                        <input type="text" name="issueDate" value="<%=request.getAttribute("issueDate")%>" readonly="" hidden=""/>
                        <input type="text" name="quantity" value="<%=request.getAttribute("quantity")%>" readonly="" hidden=""/>
                        
                        <center> <button type="submit" value="Issue" name="Issue" class="btn btn-success btn-lg">Issue</button> </center><br/>
                        <center> <button type="button" value="Cancel" name="Cancel" class="btn btn-danger btn-sm" onclick="location.href='user_homepage.jsp'">Cancel</button> </center>
                    </form>

                </div>
            </div><br/>
            <div id="footer">
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>
    </body>
    
</html>
