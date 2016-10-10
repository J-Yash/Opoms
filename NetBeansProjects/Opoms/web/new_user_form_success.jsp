<%-- 
    Document   : new_user_form_success
    Created on : May 24, 2016, 6:05:07 PM
    Author     : yash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="stylesheets/template.css" rel="stylesheet" type="text/css"/>
        <title>User Created!</title>
    </head>
    <body>
        <div class="container-fluid">
            <div id="header">
                <%@include file="/WEB-INF/jspf/header.jspf"%>
            </div>
            <div id="menu">

            </div>


            <div id="content">
                <center>  <p style="font-size: 30px"><b>New User Created!</b></p><br/>
                    <a href="login_page.jsp">Login Now!</a></center>

            </div>
            <div id="footer">
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>
    </body>
</html>
