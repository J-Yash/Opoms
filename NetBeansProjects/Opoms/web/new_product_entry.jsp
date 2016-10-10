
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
    int product_code = DBManager.getProductCodeManual();

%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Product-OPOMS</title>
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

            function plyInput()
            {
                var ply = document.getElementById("ply").value;
                var container = document.getElementById("ply_input");
                while (container.hasChildNodes())
                {
                    container.removeChild(container.lastChild);
                }

                container.appendChild(document.createElement("br"));

                for (i = 1; i <= ply; i++)
                {


                    var gsm_input = document.createElement("select");
                    gsm_input.name = "p_gsm" + i;
                    gsm_input.setAttribute("class", "form-control");
                    container.appendChild(gsm_input);

                    var gsm_value_1 = document.createElement("option");
                    gsm_value_1.value = "100";
                    gsm_value_1.text = "100";
                    gsm_input.add(gsm_value_1);

                    var gsm_value_2 = document.createElement("option");
                    gsm_value_2.value = "120";
                    gsm_value_2.text = "120";
                    gsm_input.add(gsm_value_2);

                    var gsm_value_3 = document.createElement("option");
                    gsm_value_3.value = "140";
                    gsm_value_3.text = "140";
                    gsm_input.add(gsm_value_3);

                    var gsm_value_4 = document.createElement("option");
                    gsm_value_4.value = "150";
                    gsm_value_4.text = "150";
                    gsm_input.add(gsm_value_4);

                    var gsm_value_5 = document.createElement("option");
                    gsm_value_5.value = "180";
                    gsm_value_5.text = "180";
                    gsm_input.add(gsm_value_5);

                    var gsm_value_6 = document.createElement("option");
                    gsm_value_6.value = "230";
                    gsm_value_6.text = "230";
                    gsm_input.add(gsm_value_6);

                    var gsm_value_7 = document.createElement("option");
                    gsm_value_7.value = "";
                    gsm_value_7.selected = "true";
                    gsm_value_7.hidden = "true";
                    gsm_value_7.disabled = "true";
                    gsm_value_7.text = "GSM Value";
                    gsm_input.add(gsm_value_7);

                    var kraft_input = document.createElement("select");
                    kraft_input.name = "p_kraft" + i;
                    kraft_input.setAttribute("class", "form-control");
                    container.appendChild(kraft_input);

                    var kraft_value_1 = document.createElement("option");
                    kraft_value_1.value = "";
                    kraft_value_1.selected = "true";
                    kraft_value_1.hidden = "true";
                    kraft_value_1.disabled = "true";
                    kraft_value_1.text = "Type of Paper";
                    kraft_input.add(kraft_value_1);

                    var kraft_value_2 = document.createElement("option");
                    kraft_value_2.value = "Virgin Kraft";
                    kraft_value_2.text = "Virgin Kraft";
                    kraft_input.add(kraft_value_2);

                    var kraft_value_3 = document.createElement("option");
                    kraft_value_3.value = "Semi Kraft";
                    kraft_value_3.text = "Semi Kraft";
                    kraft_input.add(kraft_value_3);

                    var bf_input = document.createElement("select");
                    bf_input.name = "p_bf" + i;
                    bf_input.setAttribute("class", "form-control");
                    container.appendChild(bf_input);
                    var bf_value_1 = document.createElement("option");
                    bf_value_1.value = "";
                    bf_value_1.selected = "true";
                    bf_value_1.hidden = "true";
                    bf_value_1.disabled = "true";
                    bf_value_1.text = "BF";
                    bf_input.add(bf_value_1);

                    var bf_value_2 = document.createElement("option");
                    bf_value_2.value = "16";
                    bf_value_2.text = "16";
                    bf_input.add(bf_value_2);

                    var bf_value_3 = document.createElement("option");
                    bf_value_3.value = "17";
                    bf_value_3.text = "17";
                    bf_input.add(bf_value_3);



                    var bf_value_4 = document.createElement("option");
                    bf_value_4.value = "18";
                    bf_value_4.text = "18";
                    bf_input.add(bf_value_4);

                    var bf_value_5 = document.createElement("option");
                    bf_value_5.value = "19";
                    bf_value_5.text = "19";
                    bf_input.add(bf_value_5);

                    var bf_value_6 = document.createElement("option");
                    bf_value_6.value = "20";
                    bf_value_6.text = "20";
                    bf_input.add(bf_value_6);

                    var bf_value_7 = document.createElement("option");
                    bf_value_7.value = "21";
                    bf_value_7.text = "21";
                    bf_input.add(bf_value_7);

                    var bf_value_8 = document.createElement("option");
                    bf_value_8.value = "22";
                    bf_value_8.text = "22";
                    bf_input.add(bf_value_8);

                    var bf_value_9 = document.createElement("option");
                    bf_value_9.value = "23";
                    bf_value_9.text = "23";
                    bf_input.add(bf_value_9);

                    var bf_value_10 = document.createElement("option");
                    bf_value_10.value = "24";
                    bf_value_10.text = "24";
                    bf_input.add(bf_value_10);

                    var bf_value_11 = document.createElement("option");
                    bf_value_11.value = "25";
                    bf_value_11.text = "25";
                    bf_input.add(bf_value_11);

                    var bf_value_12 = document.createElement("option");
                    bf_value_12.value = "26";
                    bf_value_12.text = "26";
                    bf_input.add(bf_value_12);

                    var bf_value_13 = document.createElement("option");
                    bf_value_13.value = "27";
                    bf_value_13.text = "27";
                    bf_input.add(bf_value_13);

                    var bf_value_14 = document.createElement("option");
                    bf_value_14.value = "28";
                    bf_value_14.text = "28";
                    bf_input.add(bf_value_14);

                    var bf_value_15 = document.createElement("option");
                    bf_value_15.value = "29";
                    bf_value_15.text = "29";
                    bf_input.add(bf_value_15);

                    var bf_value_16 = document.createElement("option");
                    bf_value_16.value = "30";
                    bf_value_16.text = "30";
                    bf_input.add(bf_value_16);

                    var bf_value_17 = document.createElement("option");
                    bf_value_17.value = "31";
                    bf_value_17.text = "31";
                    bf_input.add(bf_value_17);

                    var bf_value_18 = document.createElement("option");
                    bf_value_18.value = "32";
                    bf_value_18.text = "32";
                    bf_input.add(bf_value_18);

                    var bf_value_19 = document.createElement("option");
                    bf_value_19.value = "33";
                    bf_value_19.text = "33";
                    bf_input.add(bf_value_19);

                    var bf_value_20 = document.createElement("option");
                    bf_value_20.value = "34";
                    bf_value_20.text = "34";
                    bf_input.add(bf_value_20);

                    var bf_value_21 = document.createElement("option");
                    bf_value_21.value = "35";
                    bf_value_21.text = "35";
                    bf_input.add(bf_value_21);

                    container.appendChild(document.createElement("br"));
                    container.appendChild(document.createElement("br"));
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

            <div id = "content">
                <center><p style="font-size: 30px; font-family: sans-serif; font-weight: bolder;font-style: italic; color: brown ;"><b>Add New Product</b></p></center>
                <div id="form">
                    <form class="form-group"  name="new_product_entry_form" action="NewProduct" method="POST" onsubmit="return validate()" enctype="multipart/form-data" >
                        Product Name: <input class="form-control" type="text" name="p_name" placeholder="Product Name will be generated Automatically" disabled size="34" /> <br/><br/>
                        Product Code: <input class="form-control" type="text" name="p_code" value="<%=product_code%>"  readonly="" /> <br/><br/>
                        Product Alias: <input class="form-control" type="text" name="p_alias"  placeholder="Product Alias"/><br/><br/>

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
                            <option value="<%=company.get(i)%>" > <%=company.get(i)%> </option> 

                            <% }%>

                        </select> 

                        <input class="form-control btn btn-info" type="button" value="Add New Company" name="p_add_new_company" onclick="location.href = 'NewCompany.jsp'" /><br/><br/>

                        Company Code: <input class="form-control"  type="text" name="p_company_code" placeholder="Company Code will be selected automatically" disabled="" size="32"/><br/><br/>



                        No. of Ply: <select class="form-control" name="p_ply" id="ply" onchange="plyInput()">
                            <option value="" disabled="" hidden="" selected="" >No. of Ply</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                        </select>

                        <div id="ply_input" > </div>

                        <br/>
                        Size: <input class="form-control" type="text" name="p_length" required="" placeholder="length" />
                        <input class="form-control" type="text" name="p_width" required="" placeholder="Width"/>
                        <input class="form-control" type="text" name="p_height" placeholder="height"  />
                        <select class="form-control" name="p_decal_type">
                            <option value="" disabled="" hidden="" selected="">ID/OD</option>
                            <option value="ID">ID</option>
                            <option value="OD">OD</option>
                        </select>
                        <select class="form-control" name="p_scale">
                            <option value="" hidden="" selected="" disabled="">Choose Scale</option>
                            <option value="mm">mm</option>
                            <option value="inch">inch</option>
                        </select><br/><br/>
                        Unit Price: <input class="form-control" type="text" name="p_unit_price" placeholder="Unit Price" required="" /><br/><br/>
                        Product Type: <select class="form-control" name="p_product_type" required="">
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
                        Flute Percentage: <input class="form-control" type="text" name="p_flute_percentage" placeholder="40" /><br/><br/>
                        Bursting Strength(BS):<input class="form-control" type="text" name="p_bs" placeholder="Bursting Strength" /><br/><br/>


                        <input class="form-control" type="file" name="p_file1" accept="image/*,.pdf,.cdr,.zip,.rar" />
                        <input class="form-control" type="file" name="p_file2" accept="image/*,.pdf,.cdr,.zip,.rar" />
                        <input class="form-control" type="file" name="p_file3" accept="image/*,.pdf,.cdr,.zip,.rar" />
                        <input class="form-control" type="file" name="p_file4" accept="image/*,.pdf,.cdr,.zip,.rar" />
                        <input class="form-control" type="file" name="p_file5" accept="image/*,.pdf,.cdr,.zip,.rar" />

                        <center><button class="btn btn-success btn-lg" type="submit" value="Submit Product" >Submit Product</button></center>

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
