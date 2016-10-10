
<%@page import="WorkOfTheForms.Stock"%>
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

<%  
    
    if(request.getMethod().equalsIgnoreCase("POST"))
    {
        
        double reelSize = Double.parseDouble(request.getParameter("reelSize"));
        int reelType = Integer.parseInt(request.getParameter("reelType"));
        String mill = request.getParameter("mill");
        int bf = Integer.parseInt(request.getParameter("bf"));
        String paperType = request.getParameter("paperType");
        double reelWeight = Double.parseDouble(request.getParameter("reelWeight"));
        
        Stock s = new Stock(reelSize, reelType, mill, bf, paperType, reelWeight);
        
        DBManager.insertStock(s);
%><script>alert("Successful!");</script><%

    }

%>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Stock-OPOMS</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="stylesheets/template.css" rel="stylesheet" type="text/css"/>
        <style>
            #form
            {
                margin: auto;
                max-width: 400px;

            }
        </style>
        <script>

            function validate()
            {
                var letters = /^[A-Za-z]+$/;
                var numbers = /^[0-9]+$/;
                var numbers_bs = /^-?\d+(\.\d+)?$/;
                var numbers_height = /^-?\d*\.?\d*$/;
                var numbers_flute = /^[0-9]*$/;


               

                if (!document.new_product_entry_form.reelSize.value.match(numbers_bs))
                {
                    alert("Reel Size must be Numeric!");
                    return false;
                }
                
                if (!document.new_product_entry_form.reelType.value.match(numbers_bs))
                {
                    alert("Reel Type must be Numeric!");
                    return false;
                }
                if (!document.new_product_entry_form.bf.value.match(numbers_bs))
                {
                    alert("Bursting Factor must be Numeric!");
                    return false;
                }
                if (!document.new_product_entry_form.reelWeight.value.match(numbers_bs))
                {
                    alert("Reel Weight must be Numeric!");
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
                <%@include file="/WEB-INF/jspf/menu.jspf"%>
            </div>

            <div id = "content">
               
                <center><p style="font-size: 30px; font-family: sans-serif; font-weight: bolder;font-style: italic; color: brown ;"><b>Add Reel Stock</b></p></center>
                <div id="form">
                    <form class="form-group"  name="new_product_entry_form" action="AddStock.jsp" method="POST" onsubmit="return validate()" >
                        Reel Size: <input type="text" name="reelSize" required="" class="form-control" /><br/><br/>
                        Reel Type: <input type="text" name="reelType" required="" class="form-control" /><br/><br/>
                        Mill: <input type="text" name="mill" required="" class="form-control" /><br/><br/>
                        Bursting Factor: <input type="text" name="bf" required="" class="form-control" /><br/><br/>
                        Type of paper: 
                        <select name="paperType" class="form-control">
                            <option value="VK">VK</option>
                            <option value="SK">SK</option>
                        </select><br/><br/>
                        Reel Weight(in KGS): <input type="text" name="reelWeight" required="" class="form-control" /><br/><br/>
                        <center><button type="submit" class="btn btn-lg btn-success" name="Submit">Submit</button></center>
                        
                    </form>
                </div>       <br/>
                <center> <button type="button" class="btn btn-lg btn-danger" onclick="location.href = 'user_homepage.jsp'" value="Cancel">Cancel</button></center>
                <br/></div><br/>
                        
                      
                      
            <div id="footer">
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>
    </body>
</html>
