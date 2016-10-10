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
    int product_code = Integer.parseInt(request.getParameter("Product_code"));
    Product product = DBManager.findProduct(product_code);

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

                    <tr>

                    <tr><td>Product code</td><td><%=product.getProduct_code()%></td></tr>
                    <tr><td>Product Name</td><td><%=product.getProduct_name()%></td></tr>
                    <tr><td>Product Alias</td><td><%=product.getProduct_alias()%></td></tr>
                    <tr><td>Company Name</td><td><%=product.getCompany_name()%></td></tr>
                    <tr><td>Company Code</td><td><%=product.getCompany_code()%></td></tr>
                    <tr><td>Ply</td><td><%=product.getPly()%></td></tr>
                    <tr><td>Length</td><td><%=product.getProduct_length()%></td></tr>
                    <tr><td>Width</td><td><%=product.getProduct_width()%></td></tr>
                    <tr><td>Height</td><td><%=product.getProduct_height()%></td></tr>
                    <tr><td>ID/OD</td><td><%=product.getProduct_decal_type()%></td></tr>
                    <tr><td>Scale</td><td><%=product.getProduct_scale()%></td></tr>
                    <tr><td>Unit Price</td><td><%=product.getProduct_unit_price()%></td></tr>
                    <tr><td>Type</td><td><%=product.getProduct_type()%></td></tr>
                    <tr><td>Flute Percentage</td><td><%=product.getProduct_flute_percentage()%></td></tr>
                    <tr><td>Decal</td><td><%=product.getProduct_decal()%></td></tr>
                    <tr><td>Sheet Size</td><td><%=product.getProduct_sheet_size()%></td></tr>
                    <tr><td>Total GSM</td><td><%=product.getProduct_total_gsm()%></td></tr>
                    <tr><td>Total Weight</td><td><%=product.getProduct_total_weight()%></td></tr>
                    <%
                        for (int i = 0; i < product.getPly(); i++) {
                    %>
                    <tr><td>GSM <%out.print(i+1);%></td><td><%=product.getP_gsm().get(i)%></td></tr>
                    <%}%>
                    <%
                        for (int i = 0; i < product.getPly(); i++) {
                    %>
                    <tr><td>Type of paper <%out.print(i+1);%></td><td><%=product.getP_kraft().get(i)%></td></tr>
                    <%}%>

                    <%
                        for (int i = 0; i < product.getPly(); i++) {
                    %>
                    <tr><td>BF <%out.print(i+1);%></td><td><%=product.getP_bf().get(i)%></td></tr>
                    <%}%>

                    <tr><td>BS</td><td><%=product.getP_bs()%></td></tr>
                    <tr><td>Attachments</td><td>
                    <%
                        String filesall = product.getPhoto();
                        String[] file = new String[5];
                        file = filesall.split(";");
                        int size = file.length;
                        
                        for(int i=0; i< size; i++)
                        {
                            %>
                           
                            <a href="<%out.print(file[i]);%>" target="_blank">
                                <%
                                    int index = file[i].lastIndexOf(".");
                                    if(file[i].substring(index).equalsIgnoreCase(".jpg") || file[i].substring(index).equalsIgnoreCase(".png") )
                                    {
                                        %>
                                        Image
                                   <% }
                                       else if (file[i].substring(index).equalsIgnoreCase(".zip") || file[i].substring(index).equalsIgnoreCase(".rar"))
                                               {
                                   %>
                                   RAR/ZIP file
                                   <%}
                                       else if (file[i].substring(index).equalsIgnoreCase(".pdf"))
                                               {
                                   %>
                                    PDF file
                                   <%}
                                       else if (file[i].substring(index).equalsIgnoreCase(".cdr"))
                                               {
                                   %>
                                    Corel Draw file
                                   <%}%>
                               
                            </a><br/>
                            
                            <%  }%></td></tr>
                   
                    
                </tr>

                
                </table><br/>
                    <center><input class="btn btn-info" type="button" value="Edit" name="editProduct" onclick="location.href = 'EditProduct.jsp?Product_code=<%=product.getProduct_code()%>'"  />
                        <input class="btn btn-danger" type="button" value="Delete" name="deleteProduct" onclick="validatedelete(<%=product.getProduct_code()%>)" /></center>
                        <br/><br/>
                
            </div><br/>
            <div id="footer">
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>
    </body>
</html>