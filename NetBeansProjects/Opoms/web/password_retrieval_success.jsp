<%-- 
    Document   : password_retrieval_success
    Created on : May 24, 2016, 8:48:33 PM
    Author     : yash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="stylesheets/template.css" rel="stylesheet" type="text/css"/>
        <title>Password Retrieval!</title>
    </head>
    <body>
        <div class="container-fluid">
            <div id="header">
                <%@include file="/WEB-INF/jspf/header.jspf"%>
            </div>
            <div id="menu">

            </div>


            <div id="content">
                <p style="font-size: 30px"><b>Your Password is : <span style="font-size: 30px"><%= request.getAttribute("pwd")%></span></b></p>

            </div>
            <div id="footer">
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>

    </body>
</html>
