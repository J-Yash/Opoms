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
    ArrayList<Product> list = new ArrayList<Product>();
    if (request.getMethod().equalsIgnoreCase("post")) {
        String Company_name = request.getParameter("Company_name");
        String Product_type = request.getParameter("Product_type");
        String Search_key = request.getParameter("Search_key");
        String Product_length = null;
        String Product_width = null;
        String Product_height = null;
        String Key_value = null;

        if (Search_key.equalsIgnoreCase("Size")) {
            Product_length = request.getParameter("Product_length");
            Product_width = request.getParameter("Product_width");
            Product_height = request.getParameter("Product_height");
            list = DBManager.SearchProductsOne(Company_name, Product_type, Product_length, Product_width, Product_height);

        } else if (Search_key.equalsIgnoreCase("None")) {
            list = DBManager.SearchProductsOne(Company_name, Product_type);
        } else {
            Key_value = request.getParameter("Criteria_value");
            list = DBManager.SearchProductsOne(Company_name, Product_type, Search_key, Key_value);
        }

    }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Product</title>
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
            function valueCreate()
            {
                var choice = document.getElementById("search_key").value;
                var container = document.getElementById("value");
                while (container.hasChildNodes())
                {
                    container.removeChild(container.lastChild);
                }

                if (choice === "Size")
                {
                    var input1 = document.createElement("input");
                    input1.type = "text";
                    input1.name = "Product_length";
                    input1.value = "";
                    input1.placeholder = "Length";
                    input1.setAttribute("class","form-control");
                    container.appendChild(input1);

                    var input2 = document.createElement("input");
                    input2.type = "text";
                    input2.name = "Product_width";
                    input2.value = "";
                    input2.placeholder = "Width";
                    input2.setAttribute("class","form-control");
                    container.appendChild(input2);

                    var input3 = document.createElement("input");
                    input3.type = "text";
                    input3.name = "Product_height";
                    input3.value = "";
                    input3.placeholder = "Height";
                    input3.setAttribute("class","form-control");
                    container.appendChild(input3);

                } else if (choice === "None")
                {

                } else
                {
                    var input1 = document.createElement("input");
                    input1.type = "text";
                    input1.name = "Criteria_value";
                    input1.placeholder = "Value";
                    input1.setAttribute("class","form-control");
                    container.appendChild(input1);
                }
            }
       
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
                <center><p style="font-size: 30px; font-family: sans-serif; font-weight: bolder;font-style: italic; color: brown ;"><b>Search Product / Purchase Order</b></p></center>

                <div id="form">
                <form class="form-group-sm" name="searchProductForm" action="SearchPoFromProduct.jsp" method="POST">
                    Company Name : <select class="form-control"  name="Company_name" required="">
                        <%                   ArrayList<String> company = new ArrayList<String>();

                            Connection con = null;
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Opoms?autoReconnect=true&useSSL=false", "root", "root");
                                String qry = "Select company_name,company_code from Companies";
                                PreparedStatement st = con.prepareStatement(qry);

                                ResultSet rs = st.executeQuery();

                                while (rs.next()) {
                                    company.add(rs.getString("company_name"));

                                }

                            } catch (Exception ex) {
                                System.out.print("Error in Database Connection!");
                                ex.printStackTrace();
                            } finally {
                                con.close();
                            }

                            int size = company.size();

                            for (int i = 0; i < size; i++) {

                        %>
                        <option value="<%=company.get(i)%>" > <%=company.get(i)%> </option> 

                        <% } %>

                    </select><br/><br/>
                    Product Type: <select class="form-control" name="Product_type" required="">
                        <option value="" selected="" disabled="" hidden="">Select Product Type</option>
                        <option value="Box">Box</option>
                        <option value="CenterPlate">Center Plate</option>
                        <option value="Inner">Inner</option>
                        <option value="Jaali">Jaali</option>
                        <option value="Outer">Outer</option>
                        <option value="Pad">Pad</option>
                        <option value="Palette">Palette</option>
                        <option value="Pillar">Pillar</option>
                        <option value="Plate">Plate</option>
                        <option value="Separator">Separator</option>
                        <option value="Sheet">Sheet</option>
                        <option value="Top Cover">Top Cover</option>
                        <option value="Tray">Tray</option>
                    </select><br/><br/>
                    Additional Search Criteria: 
                    <select class="form-control" name="Search_key" id="search_key" onchange="valueCreate()">
                        <option value="None" selected="" >None</option>
                        <option value="product_alias">Product Alias</option>
                        <option value="product_code">Product Code</option>
                        <option value="product_unit_price">Unit Price</option>
                        <option value="product_decal">Decal</option>
                        <option value="Size">Size</option>
                    </select><br/><br/>
                    <div id="value"></div>
                    <br/>

                    <center><button class="btn btn-primary btn-success" type="submit" value="Search">Search</button></center>

                </form>
                </div>
                        <br/>



                <table class="table table-bordered table-responsive table-hover">
                    <thead>
                        <tr>
                            
                            <th>Product Name</th>
                            <th>PO Numbers</th>
                            <th>Total Quantity</th>
                            <th>Quantity Dispatched</th>
                            <th>Quantity Remaining</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Product product : list) {%>

                        <tr>
                            
                            <td><a href="ViewOneProduct.jsp?Product_code=<%=product.getProduct_code()%>"><%=product.getProduct_name()%></a></td>
                            
                            <td><%for(int i=0;i<DBManager.getPoNumberFromProductCode(product.getProduct_code()).size();i++){out.print(DBManager.getPoNumberFromProductCode(product.getProduct_code()).get(i)+";");} %></td>
                            <td><%=DBManager.getTotalQuantityFromProductCode(product.getProduct_code())%></td>
                            <td><%=DBManager.getDispatchedQuantityFromProductCode(product.getProduct_code())%></td>
                            <td><%=DBManager.getRemainingQuantityFromProductCode(product.getProduct_code())%></td>
                            
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
