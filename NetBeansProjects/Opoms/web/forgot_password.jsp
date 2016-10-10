
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <title>Forgot Password? Retrieve here</title>
        <script>
            function validate()
            {

                if (document.forgot_password_form.username.value === "")
                {
                    alert("Username cannot be empty!");
                    return false;
                }
                if (document.forgot_password_form.email.value === "")
                {
                    alert("E-mail cannot be empty!");
                    return false;
                }
                if (validateemail() === false)
                {
                    alert("Please enter a valid e-mail address!");
                    return false;
                }
                //document.forms["new_user_form"].reset();
                return true;
            }
            function validateemail()
            {
                var x = document.forgot_password_form.email.value;
                var atposition = x.indexOf("@");
                var dotposition = x.lastIndexOf(".");
                if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= x.length)
                {
                    return false;
                } else
                {
                    return true;
                }
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
                <center><p style="font-size: 30px; font-family: sans-serif; font-weight: bolder;font-style: italic; color: brown ;"><b>Retrieve Password</b></p></center>
                <div id="form">
                <form class="form-group-lg" method="post" name="forgot_password_form" action="gettingTheWord" onsubmit="return validate()">
                    
                        Username: <input class="form-control" type="text" name="username" />
                        E-mail:  <input class="form-control" type="text" name="email" /><br/>
                        <button class="btn btn-success form-control" type="submit" value="Retrieve Password" >Retrieve Password</button>
                    
                </form><br/>
                    <center> <button type="button" class="btn btn-lg btn-danger" onclick="location.href='index.jsp'" value="Cancel">Cancel</button></center>
                </div>
            </div>
            <div id="footer">
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>
    </body>
</html>
