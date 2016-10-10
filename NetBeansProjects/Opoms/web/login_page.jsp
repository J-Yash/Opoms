<%-- 
    Document   : login_page
    Created on : May 17, 2016, 4:00:53 PM
    Author     : yash
--%>

<%@page import="WorkOfTheForms.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // int status = 0;
    if (request.getMethod().equalsIgnoreCase("post")) {
        String userName = request.getParameter("username");
        String passwd = request.getParameter("password");
        if (DBManager.loginUser(userName, passwd) == true) {
            //if(DBManager.isUserVerified(userName)==true){
            // status=1;
            //  String role = DBManager.getRole(userName);
            session.setAttribute("userName", userName);
            // session.setAttribute("role", role);
            // if(role.equalsIgnoreCase("admin")){
            //   response.sendRedirect("admin/home.jsp");
            // }else if(role.equalsIgnoreCase("member")){
            response.sendRedirect("user_homepage.jsp");
        }
        // }else{
        //     status=2;
        //  }
        //   }
        // else{
        //       status = 3;
        //  }
    }
%>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="stylesheets/template.css" rel="stylesheet" type="text/css"/>
        <style>
            #form
            {
                margin: auto;
                max-width: 400px;
            }
        </style>
        <title>Login Page</title>
        <script>
            function validate()
            {

                if (document.login_form.username.value === "")
                {
                    alert("Username cannot be empty!");
                    return false;
                }
                if (document.login_form.password.value === "")
                {
                    alert("Please enter the Password!");
                    return false;
                }

                return true;
            }
        </script>
    </head>
    <body>
        <div class="container-fluid">
            <div id="header">
                <%@include file="/WEB-INF/jspf/header.jspf"%>
            </div>
            <div id="menu">

            </div>

            <div id="content">
                <center><p style="font-size: 30px; font-family: sans-serif; font-weight: bolder;font-style: italic; color: brown ;"><b>Login</b></p></center>
                <div id="form">
                <form class="form-group" name="login_form" method="post" action="login_page.jsp" onsubmit="return validate()">
                    Username: <input class="form-control" type="text" name="username" ></input> <br/><br />
                    Password: <input class="form-control" type="password" name="password"> </input> <br /><br />
                    <button class="btn btn-success form-control" type="submit" value="Login" >Login</button>
                </form>
                    <center> <button type="button" class="btn btn-lg btn-danger" onclick="location.href='index.jsp'" value="Cancel">Cancel</button></center>
                <br/>
                <center><p>Forgot Password?</p><br />
                    <a class="btn btn-info active btn" role="button" href="forgot_password.jsp">We can help!</a></center>
                </div>
            </div>
            <div id="footer">
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>
    </body>
</html>
