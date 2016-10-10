<%@page import="WorkOfTheForms.Stock"%>
<%@page import="WorkOfTheForms.DBManager"%>
<%@page import="WorkOfTheForms.Product"%>
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
    int reelNumber = Integer.parseInt(request.getParameter("reelNumber"));
    Stock stock = DBManager.findStock(reelNumber);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Stock Reel</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="stylesheets/template.css" rel="stylesheet" type="text/css"/>
        <style>
            #form
            {
                margin: auto;
                max-width: 400px;
            }
        </style>
    </head>
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
    <body>
        <div class="container-fluid">
            <div id="header">
                <%@include file="/WEB-INF/jspf/header.jspf"%>

            </div>
            <div id="menu">
                <%@include file="/WEB-INF/jspf/menu.jspf"%>
            </div>


            <hr>

            <div id = "content"> 
                <center><p style="font-size: 30px; font-family: sans-serif; font-weight: bolder;font-style: italic; color: brown ;"><b>Edit Product</b></p></center>
                <div id="form">
                <form class="form-group" name="new_product_entry_form" action="UpdateStock.jsp" method="POST" onsubmit="return validate()" >

                    Reel Number: <input type="text" name="reelNumber" required="" class="form-control" value="<%=stock.getReelNumber()%>" readonly=""/><br/><br/>
                    Reel Size: <input type="text" name="reelSize" required="" class="form-control" value="<%=stock.getReelSize() %>"/><br/><br/>
                        Reel Type: <input type="text" name="reelType" required="" class="form-control" value="<%=stock.getReelType() %>"/><br/><br/>
                        Mill: <input type="text" name="mill" required="" class="form-control" value="<%=stock.getMill() %>"/><br/><br/>
                        Bursting Factor: <input type="text" name="bf" required="" class="form-control" value="<%=stock.getBf() %>"/><br/><br/>
                        Type of paper: 
                        <select name="paperType" class="form-control">
                            <option value="VK" <% if (stock.getPaperType().equals("VK")) { %> selected="selected" <% } %>>VK</option>
                            <option value="SK" <% if (stock.getPaperType().equals("SK")) { %> selected="selected" <% } %>>SK</option>
                        </select><br/><br/>
                        Reel Weight(in KGS): <input type="text" name="reelWeight" required="" class="form-control" value="<%=stock.getReelWeight() %>"/><br/><br/>



                    
                    <center><button class="btn btn-lg btn-success" type="submit" value="Edit Reel" >Edit Reel</button><br/><br/></center>

                </form>
                    
                </div> 
                    <center> <input class="btn btn-danger" type="button" value="Cancel" name="Cancel" onclick="location.href = 'ViewStock.jsp'"/></center>
           <br/> </div><br/>
            <div id="footer">
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>
    </body>
</html>       