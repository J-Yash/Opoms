
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
         <style>
            #form
            {
                margin: auto;
                max-width: 400px;
            }
        </style>
        <title>Add New Company</title>
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
                <div id="form">
                <form class="form-group" name="add_new_company_form" action="NewCompany" method="post">
                    Company Name : <input class="form-control" type="text" name="company_name" value="" size="25" required=""/><br/><br/>
                    Company Code : <input class="form-control" type="text" name="company_code" value="" size="15" required=""/><br/><br/>
                    <button class="btn btn-success" type="submit" value="Add Company" >Add Company</button>
                </form><br/>
                </div>
                
            </div>
            <div id="footer">
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>
    </body>
</html>
