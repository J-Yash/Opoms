<%-- 
    Document   : new_user_form
    Created on : May 18, 2016, 4:10:02 PM
    Author     : yash
--%>

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
        <title>Create New User</title>
        <script>
            function validate()
            {
                var letters = /^[A-Za-z]+$/;
                if (document.new_user_form.fname.value === "")
                {
                    alert("Name cannot be empty!");
                    return false;
                }
                if (!document.new_user_form.fname.value.match(letters))
                {
                    alert("Name cannot be Numeric!");
                    return false;
                }
                if (document.new_user_form.lname.value === "")
                {
                    alert("Name cannot be empty!");
                    return false;
                }
                if (!document.new_user_form.lname.value.match(letters))
                {
                    alert("Name cannot be Numeric!");
                    return false;
                }
                if (document.new_user_form.uname.value === "")
                {
                    alert("Username cannot be empty!");
                    return false;
                }
                if (document.new_user_form.uname.value.length < 8)
                {
                    alert("Username must be greater than 7 characters");
                    return false;
                }
                if (document.new_user_form.password.value === "")
                {
                    alert("Password cannot be empty!");
                    return false;
                }
                if (document.new_user_form.password.value.length < 10)
                {
                    alert("Password must be greater than 9 characters!");
                    return false;
                }
                if (document.new_user_form.rpassword.value === "")
                {
                    alert("Please re-enter password!");
                    return false;
                }
                if (document.new_user_form.rpassword.value !== document.new_user_form.password.value)
                {
                    alert("Password does not match");
                    return false;
                }
                if (document.new_user_form.email.value === "")
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
                var x = document.new_user_form.email.value;
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
                
                <center><p style="font-size: 30px; font-family: sans-serif; font-weight: bolder;font-style: italic; color: brown ;"><b>Create New User</b></p></center>
                <div id="form">
                <form class="form-group" method="post" name="new_user_form" action="NewUser" onsubmit="return validate()">
                    
                        First Name:<input class="form-control" type="text" name="fname" required=""/><span id="fn"></span>
                        Last Name:<input class="form-control" type="text" name="lname" required=""/><span id="ln"></span>
                        Username: <input class="form-control" type="text" name="uname" required=""/><span id="un"></span>
                        Password:<input class="form-control" type="password" name="password" required=""/><span id="pwd"></span>
                        Re-enter Password: <input class="form-control" type="password" name="rpassword" required=""/><span id="rpwd"></span>
                        E-mail:<input class="form-control" type="text" name="email" required=""/><span id="email"></span><br/>
                        <button class="btn btn-success form-control" type="submit" value="Create New User" >Create New User</button>
                   
                </form>
                    <center> <button type="button" class="btn btn-lg btn-danger" onclick="location.href='index.jsp'" value="Cancel">Cancel</button></center>
                </div>
            </div>
            <div id="footer">
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>
    </body>
</html>
