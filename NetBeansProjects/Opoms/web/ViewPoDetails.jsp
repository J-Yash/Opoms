<%@page import="WorkOfTheForms.Dispatch"%>
<%@page import="WorkOfTheForms.PurchaseOrder"%>
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
    int poNumber = Integer.parseInt(request.getParameter("poNumber"));
    PurchaseOrder po = DBManager.getPurchaseOrderDetails(poNumber);
    
   
    
    
    int size = po.getProductName().size();

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Overview</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="stylesheets/template.css" rel="stylesheet" type="text/css"/>
        <style>
            #content table{
                margin: auto;
                padding: auto;
                font-weight: bold;
                max-width: 600px;
            }
           
        </style>
        
        <script>
            function validatedelete(product_code)
            {
                var choice = window.confirm("Do you really want to delete this product?");
                if (choice === true)
                {
                    var ref = "DeleteProduct.jsp?Product_code=" + product_code;
                    location.href = ref;
                } else
                {

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
                <%@include file="/WEB-INF/jspf/menu.jspf"%>
            </div>

            <div id="content">
                <center><p style="font-size: 30px; font-family: sans-serif; font-weight: bolder;font-style: italic; color: brown ;"><b>Product Details</b></p></center>
                <table class="table table-bordered table-striped table-responsive" style="text-align: center">
                    
                    <thead>
                        <tr>
                            
                            <th>Product Name</th>
                            <th>Total Quantity</th>
                            <th>Quantity Dispatched</th>
                            <th>Quantity Remaining</th>
                            <th>Rate</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <%
                            for(int i =0;i<size;i++)
                            {
                        %>
                        <tr>
                            <td><%=po.getProductName().get(i)%></td>
                            <td><%=po.getProductQuantity().get(i)%></td>
                            <td><%=DBManager.getDispatchedQuantity(po.getPoNumber(),po.getProductName().get(i),po.getCompany())%></td>
                            <td><%=DBManager.getRemainingQuantity(po.getPoNumber(),po.getProductName().get(i),po.getCompany())%></td>
                            <td><%=po.getProductRate().get(i)%></td>
                           
                        </tr>
                        <%}%>
                        
                    </tbody>

                
                </table><br/>
                    
                
            </div><br/>
            <div id="footer">
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>
    </body>
</html>