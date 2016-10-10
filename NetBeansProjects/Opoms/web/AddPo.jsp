
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="stylesheets/template.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.1.0.min.js" type="text/javascript"></script>
        <style>
            #form
            {
                margin: auto;
                max-width: 400px;

            }
            #addbutton
            {
                position: fixed;
                bottom: 450px;
                right: 550px;
            }
        </style>
        <title>User Home Page</title>

        <script type="text/javascript">
            var namecount = 1;
            var ratecount = 1;
            var qtycount = 1;
            function AddFields()
            {

                document.getElementById("counter").value = namecount;

                var container = document.getElementById("morefields");


                container.appendChild(document.createElement("br"));




                container.appendChild(document.createTextNode("Product Name:"));

                var gsm_input = document.createElement("select");
                gsm_input.name = "productName" + namecount;
                gsm_input.setAttribute("class", "form-control pnames");

                container.appendChild(gsm_input);




                container.appendChild(document.createTextNode("Rate:"));
                var kraft_input = document.createElement("input");
                kraft_input.type = "text";
                kraft_input.name = "productRate" + ratecount;
                kraft_input.required = "";
                kraft_input.value = "";
                kraft_input.setAttribute("class", "form-control");
                container.appendChild(kraft_input);


                container.appendChild(document.createTextNode("Quantity:"));
                var bf_input = document.createElement("input");
                bf_input.name = "productQuantity" + qtycount;
                bf_input.type = "text";
                bf_input.value = "";
                bf_input.required = "";
                bf_input.setAttribute("class", "form-control");
                container.appendChild(bf_input);

                namecount = namecount + 1;
                ratecount = ratecount + 1;
                qtycount = qtycount + 1;



                container.appendChild(document.createElement("br"));
                container.appendChild(document.createElement("br"));





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
                <center><p style="font-size: 30px; font-family: sans-serif; font-weight: bolder;font-style: italic; color: brown ;"><b>Add New PO</b></p></center>
                <div id="form">
                    <form class="form-group" name="AddPo" action="AddPo" method="POST">


                        <input id="counter" type="text" name="counter" value="0" hidden=""/>

                        Company Name : <select id="cnames" class="form-control"  name="companyName" onchange="getValues()">
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

                        PO No. : <input class="form-control" type="text" required="" name="poNumber"/>
                        PO Date : <input class="form-control" type="date" required="" name="poDate" />
                        <br/>
                        <center><button id="addbutton" class="btn btn-default btn-lg" type="button" value="Add Product" onclick="AddFields();getValues()">Add Product</button></center>
                        <div id="morefields"></div>

                        <br/>
                        <center> <button type="submit" value="Add PO" name="Add PO" class="btn btn-success btn-lg">Add PO</button> </center>
                    </form>

                </div>
            </div><br/>
            <div id="footer">
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>
    </body>
    <script type="text/javascript">
        function getValues()
        {
            $category = $('#cnames');
            var select = document.getElementById("cnames");
            var selectedString = select.options[select.selectedIndex].value;



            $.ajax({
                type: "GET",
                url: "GetProductName",
                data: {category: selectedString},
                success: function (data) {
                    $(".pnames").html(data);
                }
            });


        }
    </script>
</html>
