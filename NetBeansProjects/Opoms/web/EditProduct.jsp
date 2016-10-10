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
    int product_code = DBManager.getProductCodeManual();

%>
<%    int j = 0;
    int Product_code = Integer.parseInt(request.getParameter("Product_code"));
    Product product = DBManager.findProduct(Product_code);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Product</title>
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


            if (!document.new_product_entry_form.p_unit_price.value.match(numbers_bs))
            {
                alert("Unit Price must be Numeric!");
                return false;
            }

            // if(document.new_product_entry_form.p_unit_price.value < '0')
            //{
            //    alert("Unit Price must be Positive!");
            //   return false;
            //}

            if (!document.new_product_entry_form.p_length.value.match(numbers_bs))
            {
                alert("Length must be Numeric!");
                return false;
            }
            if (!document.new_product_entry_form.p_width.value.match(numbers_bs))
            {
                alert("Width must be Numeric!");
                return false;
            }
            if (!document.new_product_entry_form.p_height.value.match(numbers_height))
            {
                alert("Height must be Numeric!");
                return false;
            }

            if (!document.new_product_entry_form.p_flute_percentage.value.match(numbers_flute))
            {
                alert("Flute Percentage must be Numeric!");
                return false;
            }

            if (!document.new_product_entry_form.p_bs.value.match(numbers_height))
            {
                alert("BS must be Numeric!");
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
                <form class="form-group" name="new_product_entry_form" action="updateProduct.jsp" method="POST" onsubmit="return validate()" >

                    Product Name: <input class="form-control" type="text" name="p_name" value="<%=product.getProduct_name()%>" size="40" readonly="" /> <br/><br/>
                    Product Code: <input class="form-control" type="text" name="p_code" value="<%=product.getProduct_code()%>"  readonly="" /> <br/><br/>
                    Product Alias: <input class="form-control" type="text" name="p_alias"  value="<%=product.getProduct_alias()%>"/><br/><br/>

                    <!-- Company Name: <input type="text" name="p_company_name"  required="" placeholder="Company Name"/>
                    -->
                    Company Name : <select class="form-control"  name="p_company_name" >
                        <%
                            ArrayList<String> company = new ArrayList<String>();

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
                        <option value="<%=company.get(i)%>" <% if (product.getCompany_name().equals(company.get(i))) { %> selected="selected" <% }%>> <%=company.get(i)%> </option> 

                        <% }%>

                    </select> 

                    <input class="form-control btn btn-info" type="button" value="Add New Company" name="p_add_new_company" onclick="location.href = 'NewCompany.jsp'" /><br/><br/>

                    Company Code: <input class="form-control"  type="text" name="p_company_code" value="<%=product.getCompany_code()%>"/><br/><br/>

                    <!--
                    No. of Ply: <input type="text" id="ply" name="p_ply" placeholder="No. of Ply" min="2" max="9" required="" onchange="plyInput()"/>
                    -->

                    No. of Ply: <select class="form-control" name="p_ply" id="ply"  >

                        <option value="2"<% if (product.getPly() == 2) { %> selected="selected" <% } %>>2</option>
                        <option value="3"<% if (product.getPly() == 3) { %> selected="selected" <% } %>>3</option>
                        <option value="4"<% if (product.getPly() == 4) { %> selected="selected" <% } %>>4</option>
                        <option value="5"<% if (product.getPly() == 5) { %> selected="selected" <% } %>>5</option>
                        <option value="6"<% if (product.getPly() == 6) { %> selected="selected" <% } %>>6</option>
                        <option value="7"<% if (product.getPly() == 7) { %> selected="selected" <% } %>>7</option>
                        <option value="8"<% if (product.getPly() == 8) { %> selected="selected" <% } %>>8</option>
                        <option value="9"<% if (product.getPly() == 9) { %> selected="selected" <% } %>>9</option>
                    </select>
                    <table  >
                        <thead>
                            <tr>
                                <th>GSM</th>
                                <th>ID/OD</th>
                                <th>BF</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 1; i <= product.getPly(); i++) {%>
                            <tr>

                                <td>
                                    <select class="form-control" name="p_gsm<%=i%>">
                                        <option value="100"<% if (product.getP_gsm().get(i - 1) == 100) { %> selected="selected" <% } %>>100</option>
                                        <option value="120"<% if (product.getP_gsm().get(i - 1) == 120) { %> selected="selected" <% } %>>120</option>
                                        <option value="140"<% if (product.getP_gsm().get(i - 1) == 140) { %> selected="selected" <% } %>>140</option>
                                        <option value="150"<% if (product.getP_gsm().get(i - 1) == 150) { %> selected="selected" <% } %>>150</option>
                                        <option value="180"<% if (product.getP_gsm().get(i - 1) == 180) { %> selected="selected" <% } %>>180</option>
                                        <option value="230"<% if (product.getP_gsm().get(i - 1) == 230) { %> selected="selected" <% }%>>230</option>
                                    </select>
                                </td>
                                <td><select class="form-control" name="p_kraft<%=i%>">
                                        <option value="Virgin Kraft"<% if (product.getP_kraft().get(i - 1).equals("Virgin Kraft")) { %> selected="selected" <% } %>>Virgin Kraft</option>
                                        <option value="Super Kraft"<% if (product.getP_kraft().get(i - 1).equals("Semi Kraft")) { %> selected="selected" <% }%>>Semi Kraft</option>
                                    </select></td>

                                <td><select class="form-control" name="p_bf<%=i%>">
                                            
                                        <option value="16"<% if (product.getP_bf().get(i - 1) == 16) { %> selected="selected" <% } %>>16</option>
                                        <option value="17"<% if (product.getP_bf().get(i - 1) == 17) { %> selected="selected" <% } %>>17</option>
                                        <option value="18"<% if (product.getP_bf().get(i - 1) == 18) { %> selected="selected" <% } %>>18</option>
                                        <option value="19"<% if (product.getP_bf().get(i - 1) == 19) { %> selected="selected" <% } %>>19</option>
                                        <option value="20"<% if (product.getP_bf().get(i - 1) == 20) { %> selected="selected" <% } %>>20</option>
                                        <option value="21"<% if (product.getP_bf().get(i - 1) == 21) { %> selected="selected" <% } %>>21</option>
                                        <option value="22"<% if (product.getP_bf().get(i - 1) == 22) { %> selected="selected" <% } %>>22</option>
                                        <option value="23"<% if (product.getP_bf().get(i - 1) == 23) { %> selected="selected" <% } %>>23</option>
                                        <option value="24"<% if (product.getP_bf().get(i - 1) == 24) { %> selected="selected" <% } %>>24</option>
                                        <option value="25"<% if (product.getP_bf().get(i - 1) == 25) { %> selected="selected" <% } %>>25</option>
                                        <option value="26"<% if (product.getP_bf().get(i - 1) == 26) { %> selected="selected" <% } %>>26</option>
                                        <option value="27"<% if (product.getP_bf().get(i - 1) == 27) { %> selected="selected" <% } %>>27</option>
                                        <option value="28"<% if (product.getP_bf().get(i - 1) == 28) { %> selected="selected" <% } %>>28</option>
                                        <option value="29"<% if (product.getP_bf().get(i - 1) == 29) { %> selected="selected" <% } %>>29</option>
                                        <option value="30"<% if (product.getP_bf().get(i - 1) == 30) { %> selected="selected" <% } %>>30</option>
                                        <option value="31"<% if (product.getP_bf().get(i - 1) == 31) { %> selected="selected" <% } %>>31</option>
                                        <option value="32"<% if (product.getP_bf().get(i - 1) == 32) { %> selected="selected" <% } %>>32</option>
                                        <option value="33"<% if (product.getP_bf().get(i - 1) == 33) { %> selected="selected" <% } %>>33</option>
                                        <option value="34"<% if (product.getP_bf().get(i - 1) == 34) { %> selected="selected" <% } %>>34</option>
                                        <option value="35"<% if (product.getP_bf().get(i - 1) == 35) { %> selected="selected" <% } %>>35</option>


                                    </select></td>
                            </tr>
                            <% }%>

                        </tbody>
                    </table>


                    <!--<span id="ply_input" >
                        <input type="text" name="p_gsm" placeholder="GSM" required="" />
                        <select name="p_kraft">
                            <option value="Virgin Kraft">Virgin Kraft</option>
                            <option value="Super Kraft">Super Kraft</option>
                        </select>
                        <select name="p_bf">
                            <option value="" selected="" disabled="" hidden="">BF</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                        </select>
                    </span>
                    <br/><br/>
                    -->
                    <br/>
                    Size: <input class="form-control" type="text" name="p_length" required="" value="<%=product.getProduct_length()%>" />
                    <input class="form-control" type="text" name="p_width" required="" value="<%=product.getProduct_width()%>" />
                    <input class="form-control" type="text" name="p_height" value="<%=product.getProduct_height()%>"  />
                    <select class="form-control" name="p_decal_type">

                        <option value="ID"<% if (product.getProduct_decal_type().equals("ID")) { %> selected="selected" <% } %>>ID</option>
                        <option value="OD"<% if (product.getProduct_decal_type().equals("OD")) { %> selected="selected" <% } %>>OD</option>
                    </select>
                    <select class="form-control" name="p_scale">

                        <option value="mm" <% if (product.getProduct_scale().equals("mm")) { %> selected="selected" <% } %>>mm</option>
                        <option value="inch"<% if (product.getProduct_scale().equals("inch")) { %> selected="selected" <% }%>>inch</option>
                    </select><br/><br/>
                    Unit Price: <input class="form-control" type="text" name="p_unit_price" value="<%=product.getProduct_unit_price()%>" required="" /><br/><br/>
                    Product Type: <select class="form-control" name="p_product_type" required="">

                        <option value="Box"<% if (product.getProduct_type().equals("Box")) { %> selected="selected" <% } %>>Box</option>
                        <option value="CenterPlate"<% if (product.getProduct_type().equals("CenterPlate")) { %> selected="selected" <% } %>>Center Plate</option>
                        <option value="Inner"<% if (product.getProduct_type().equals("Inner")) { %> selected="selected" <% } %>>Inner</option>
                        <option value="Jaali"<% if (product.getProduct_type().equals("Jaali")) { %> selected="selected" <% } %>>Jaali</option>
                        <option value="Outer"<% if (product.getProduct_type().equals("Outer")) { %> selected="selected" <% } %>>Outer</option>
                        <option value="Pad"<% if (product.getProduct_type().equals("Pad")) { %> selected="selected" <% } %>>Pad</option>
                        <option value="Palette"<% if (product.getProduct_type().equals("Palette")) { %> selected="selected" <% } %>>Palette</option>
                        <option value="Pillar"<% if (product.getProduct_type().equals("Pillar")) { %> selected="selected" <% } %>>Pillar</option>
                        <option value="Plate"<% if (product.getProduct_type().equals("Plate")) { %> selected="selected" <% } %>>Plate</option>
                        <option value="Separator"<% if (product.getProduct_type().equals("Separator")) { %> selected="selected" <% } %>>Separator</option>
                        <option value="Sheet"<% if (product.getProduct_type().equals("Sheet")) { %> selected="selected" <% } %>>Sheet</option>
                        <option value="Top Cover"<% if (product.getProduct_type().equals("Top Cover")) { %> selected="selected" <% } %>>Top Cover</option>
                        <option value="Tray"<% if (product.getProduct_type().equals("Tray")) { %> selected="selected" <% }%>>Tray</option>
                    </select><br/><br/>
                    Flute Percentage: <input class="form-control" type="text" name="p_flute_percentage" value="<%=product.getProduct_flute_percentage()%>" /><br/><br/>
                    Bursting Strength(BS):<input class="form-control" type="text" name="p_bs" value="<%=product.getP_bs()%>" /><br/><br/>
                    Sheet Size:<input class="form-control" type="text" name="p_sheet_size" value="<%=product.getProduct_sheet_size()%>" /><br/><br/>
                    Decal:<input class="form-control" type="text" name="p_decal" value="<%=product.getProduct_decal()%>" /><br/><br/>
                    Total GSM:<input class="form-control" type="text" name="p_total_gsm" value="<%=product.getProduct_total_gsm()%>" /><br/><br/>
                    Total Weight:<input class="form-control" type="text" name="p_total_weight" value="<%=product.getProduct_total_weight()%>" /><br/><br/>



                    <!-- Attach File: <input type="file" name="p_file" accept="image/*,.pdf,.cdr" multiple=""/><br/><br/> -->
                    <center><button class="btn btn-lg btn-success" type="submit" value="Edit Product" >Edit Product</button><br/><br/></center>

                </form>
                    
                </div> 
                    <center> <input class="btn btn-danger" type="button" value="Cancel" name="Cancel" onclick="location.href = 'ViewProduct.jsp'"/></center>
           <br/> </div><br/>
            <div id="footer">
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>
    </body>
</html>       