
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="stylesheets/template.css" rel="stylesheet" type="text/css"/>
        <title>Online Purchase Order Management System-HomePage</title>
        <style>
            #content
            {
                background-image: url("images/imageindex.jpg");
                max-height: 700px;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
                color: black;
                text-align: right;
                  
            }
            
            
        </style>

    </head>
    <body>
        <div class="container-fluid">
            <div id="header" class="well-lg">
                <%@include file="/WEB-INF/jspf/header.jspf"%>
                
            </div>
            <div id="menu">            
            </div>
            <div id="content" class="jumbotron " >
                

                <a href="login_page.jsp" class="btn btn-primary btn-lg active btn" role="button">Login</a> <br/><br/> 
                <br/><br/>
                <p>Don't have an account yet?<br />
                    <a href="new_user_form.jsp" class="btn btn-danger btn-lg active btn" role="button">Create Account</a>            
                </p>  

            </div>

            <div id="footer" class="well-lg" >
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>

    </body>
</html>