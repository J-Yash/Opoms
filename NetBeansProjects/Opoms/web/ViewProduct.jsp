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
    ArrayList<Product> list = DBManager.getAllProducts();

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="stylesheets/template.css" rel="stylesheet" type="text/css"/>
        
        <title>All Products</title>

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
    <body >
        <div class="container-fluid">
            <div id="header">
                <%@include file="/WEB-INF/jspf/header.jspf"%>
            </div>
            <div id="menu">
                <%@include file="/WEB-INF/jspf/menu.jspf"%>
            </div>
            <div id="content" >
                <center><p style="font-size: 30px; font-family: sans-serif; font-weight: bolder;font-style: italic; color: brown ;"><b>All Products</b></p></center>

              
                <table class="table table-bordered table-responsive table-hover">
                    <thead>
                        <tr>
                            
                            <th>Code</th>
                            <th style="max-width: 160px; word-wrap: break-word;">Product Name</th>
                            <th>Product Alias</th>
                            <th>Company Name</th>
                            <th>Ply</th>
                            <th>Length</th>
                            <th>Width</th>
                            <th>Height</th>
                            <th>ID/OD</th>
                            <th>Scale</th>
                            <th>Unit Price</th>
                            <th style="max-width: 60px; word-wrap: break-word;">Type</th>
                            <th>Flute %age</th>
                            <th>Decal</th>
                            <th>Sheet Size</th>
                            <th>Total GSM</th>
                            <th style="max-width: 80px; word-wrap: break-word;">Total Weight (in gms)</th>
                            <th>GSM 1-Paper-BF</th>
                            <th>GSM 2-Paper-BF</th>
                            <th>GSM 3-Paper-BF</th>
                            <th>GSM 4-Paper-BF</th>
                            <th>GSM 5-Paper-BF</th>
                            <th>GSM 6-Paper-BF</th>
                            <th>GSM 7-Paper-BF</th>
                            <th>GSM 8-Paper-BF</th>
                            <th>GSM 9-Paper-BF</th>
                            <th>BS</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Product product : list) {%>

                        <tr>
                            
                            <td><%=product.getProduct_code()%></td>
                            <td style="max-width: 160px; word-wrap: break-word;"><a href="ViewOneProduct.jsp?Product_code=<%=product.getProduct_code()%>"><%=product.getProduct_name()%></a><br/>
                            <input class="btn btn-sm btn-success" type="button" value="Edit" name="editProduct" onclick="location.href = 'EditProduct.jsp?Product_code=<%=product.getProduct_code()%>'"  />
                                <input class="btn btn-sm btn-danger" type="button" value="Delete" name="deleteProduct" onclick="validatedelete(<%=product.getProduct_code()%>)" />
                            </td>
                            <td><%=product.getProduct_alias()%></td>
                            <td><%=product.getCompany_name()%></td>
                            
                            <td><%=product.getPly()%></td>
                            <td><%=product.getProduct_length()%></td>
                            <td><%=product.getProduct_width()%></td>
                            <td><%=product.getProduct_height()%></td>
                            <td><%=product.getProduct_decal_type()%></td>
                            <td><%=product.getProduct_scale()%></td>
                            <td><%=product.getProduct_unit_price()%></td>
                            <td style="max-width: 60px; word-wrap: break-word;"><%=product.getProduct_type()%></td>
                            <td><%=product.getProduct_flute_percentage()%></td>
                            <td><%=product.getProduct_decal()%></td>
                            <td><%=product.getProduct_sheet_size()%></td>
                            <td><%=product.getProduct_total_gsm()%></td>
                            <td style="max-width: 80px; word-wrap: break-word;"><%=product.getProduct_total_weight()%></td>
                            <td><%=product.getP_gsm().get(0)%>-<%if (product.getP_kraft().get(0) == null) {
                            out.print("null");
                        } else if (product.getP_kraft().get(0).equalsIgnoreCase("Virgin Kraft")) {
                            out.print("VK");
                        } else {
                            out.print("SK");
                        }%>-<%=product.getP_bf().get(0)%></td>
                            <td><%=product.getP_gsm().get(1)%>-<%if (product.getP_kraft().get(1) == null) {
                            out.print("null");
                        } else if (product.getP_kraft().get(1).equalsIgnoreCase("Virgin Kraft")) {
                            out.print("VK");
                        } else {
                            out.print("SK");
                        }%>-<%=product.getP_bf().get(1)%> </td>
                            <td><%=product.getP_gsm().get(2)%>-<%if (product.getP_kraft().get(2) == null) {
                            out.print("null");
                        } else if (product.getP_kraft().get(2).equalsIgnoreCase("Virgin Kraft")) {
                            out.print("VK");
                        } else {
                            out.print("SK");
                        }%>-<%=product.getP_bf().get(2)%></td>
                            <td><%=product.getP_gsm().get(3)%>-<%if (product.getP_kraft().get(3) == null) {
                            out.print("null");
                        } else if (product.getP_kraft().get(3).equalsIgnoreCase("Virgin Kraft")) {
                            out.print("VK");
                        } else {
                            out.print("SK");
                        }%>-<%=product.getP_bf().get(3)%></td>
                            <td><%=product.getP_gsm().get(4)%>-<%if (product.getP_kraft().get(4) == null) {
                            out.print("null");
                        } else if (product.getP_kraft().get(4).equalsIgnoreCase("Virgin Kraft")) {
                            out.print("VK");
                        } else {
                            out.print("SK");
                        }%>-<%=product.getP_bf().get(4)%></td>
                            <td><%=product.getP_gsm().get(5)%>-<%if (product.getP_kraft().get(5) == null) {
                            out.print("null");
                        } else if (product.getP_kraft().get(5).equalsIgnoreCase("Virgin Kraft")) {
                            out.print("VK");
                        } else {
                            out.print("SK");
                        }%>-<%=product.getP_bf().get(5)%></td>
                            <td><%=product.getP_gsm().get(6)%>-<%if (product.getP_kraft().get(6) == null) {
                            out.print("null");
                        } else if (product.getP_kraft().get(6).equalsIgnoreCase("Virgin Kraft")) {
                            out.print("VK");
                        } else {
                            out.print("SK");
                        }%>-<%=product.getP_bf().get(6)%></td>
                            <td><%=product.getP_gsm().get(7)%>-<%if (product.getP_kraft().get(7) == null) {
                            out.print("null");
                        } else if (product.getP_kraft().get(7).equalsIgnoreCase("Virgin Kraft")) {
                            out.print("VK");
                        } else {
                            out.print("SK");
                        }%>-<%=product.getP_bf().get(7)%></td>
                            <td><%=product.getP_gsm().get(8)%>-<%if (product.getP_kraft().get(8) == null) {
                            out.print("null");
                        } else if (product.getP_kraft().get(8).equalsIgnoreCase("Virgin Kraft")) {
                            out.print("VK");
                        } else {
                            out.print("SK");
                        }%>-<%=product.getP_bf().get(8)%></td>                    
                            <td><%=product.getP_bs()%></td>
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
