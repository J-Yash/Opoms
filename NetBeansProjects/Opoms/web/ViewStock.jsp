<%@page import="WorkOfTheForms.Stock"%>
<%@page import="WorkOfTheForms.DBManager"%>
<%@page import="WorkOfTheForms.Product"%>
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
    ArrayList<Stock> list = DBManager.getAllStock();

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="stylesheets/template.css" rel="stylesheet" type="text/css"/>
        
        <title>All Reel Stock</title>

        <script>
            function validatedelete(ReelNumber)
            {
                var choice = window.confirm("Do you really want to delete this product?");
                if (choice === true)
                {
                    var ref = "DeleteStock.jsp?reelNumber="+ReelNumber;
                    location.href = ref;
                } else
                {

                }
            }
        </script>
    </head>
    <body >
        <div class="container-fluid">
            <div id="header">
                <%@include file="/WEB-INF/jspf/header.jspf"%>
            </div>
            <div id="menu">
                <%@include file="/WEB-INF/jspf/menu.jspf"%>
            </div>
            <div id="content" >
                <center><p style="font-size: 30px; font-family: sans-serif; font-weight: bolder;font-style: italic; color: brown ;"><b>All Stock</b></p></center>

              
                <table class="table table-bordered table-responsive table-hover">
                    <thead>
                        <tr>
                            
                            <th>Reel Number</th>
                            <th>Reel Size</th>
                            <th>Reel Type</th>
                            <th>Mill</th>
                            <th>Bursting Factor</th>
                            <th>Paper Type</th>
                            <th>Reel Weight(in KGS)</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Stock stock : list) {%>

                        <tr>
                            
                            <td><%=stock.getReelNumber()%><br/>
                                <input class="btn btn-sm btn-success" type="button" value="Edit" name="editProduct" onclick="location.href = 'EditStock.jsp?reelNumber=<%=stock.getReelNumber()%>'" />
                                <input class="btn btn-sm btn-danger" type="button" value="Delete" name="deleteProduct" onclick="validatedelete(<%=stock.getReelNumber()%>)" />
                            </td>
                            <td><%=stock.getReelSize()%></td>
                            
                            
                            
                            <td><%=stock.getReelType()%></td>
                            <td><%=stock.getMill()%></td>
                            
                            <td><%=stock.getBf()%></td>
                            <td><%=stock.getPaperType()%></td>
                            <td><%=stock.getReelWeight()%></td>
                            
                        </tr>
                        <% }%>
                    </tbody>
                </table>
              
            </div>
            <div id="footer">
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>

    </body>
</html>
