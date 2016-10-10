
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

        </style>
        <title>Issue Reel-OPOMS</title>
        <script>
            function validate()
            {
                var letters = /^[A-Za-z]+$/;
                var numbers = /^[0-9]+$/;
                var numbers_bs = /^-?\d+(\.\d+)?$/;
                var numbers_height = /^-?\d*\.?\d*$/;
                var numbers_flute = /^[0-9]*$/;


               

                if (!document.IssueReel.decal.value.match(numbers_bs))
                {
                    alert("Decal must be Numeric!");
                    return false;
                }
                
                if (!document.IssueReel.quantity.value.match(numbers_bs))
                {
                    alert("Quantity must be Numeric!");
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
            <div id="content">
                <center><p style="font-size: 30px; font-family: sans-serif; font-weight: bolder;font-style: italic; color: brown ;"><b>Issue Reel</b></p></center>
                <div id="form">
                    <form class="form-group" name="IssueReel" action="IssueReel" method="POST" onsubmit="return validate()">

                        Product Name : <select id="pnames" class="form-control"  name="productName" onchange="getValues()" autofocus="">
                            <%
                                ArrayList<String> product = new ArrayList<String>();

                                Connection con = null;
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Opoms?autoReconnect=true&useSSL=false", "root", "root");
                                    String qry = "Select product_name from Product";
                                    PreparedStatement st = con.prepareStatement(qry);

                                    ResultSet rs = st.executeQuery();

                                    while (rs.next()) {
                                        product.add(rs.getString("product_name"));

                                    }

                                } catch (Exception ex) {
                                    System.out.print("Error in Database Connection!");
                                    ex.printStackTrace();
                                } finally {
                                    con.close();
                                }

                                int size = product.size();

                                for (int i = 0; i < size; i++) {

                            %>
                            <option value="<%=product.get(i)%>" > <%=product.get(i)%> </option> 

                            <% }%>

                        </select> <br/><br/>


                        <div class="pdecal "></div>
                        <div class="psheetsize "></div>
                        <div class="pgsmandbf "></div>

                        Quantity: <input class="form-control " type="text" value="" name="quantity" required=""/><br/><br/>

                        Paper Required: <input class="form-control " type="text" name="paperRequired" value="125" readonly=""/><br/><br/>



                        <center> <button type="submit" value="Proceed" name="Proceed" class="btn btn-success btn-lg">Proceed</button> </center><br/>
                        <center> <button type="button" value="Cancel" name="Cancel" class="btn btn-danger btn-sm" onclick="location.href='user_homepage.jsp'">Cancel</button> </center>
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
            $category = $('#pnames');
            var select = document.getElementById("pnames");
            var selectedString = select.options[select.selectedIndex].value;



            $.ajax({
                type: "GET",
                url: "GetDecalForReel",
                data: {category: selectedString},
                success: function (data) {
                    $(".pdecal").html(data);
                }
            });

            $.ajax({
                type: "GET",
                url: "GetSheetSizeForReel",
                data: {category: selectedString},
                success: function (data) {
                    $(".psheetsize").html(data);
                }
            });

            $.ajax({
                type: "GET",
                url: "GetGsmAndBf",
                data: {category: selectedString},
                success: function (data) {
                    $(".pgsmandbf").html(data);
                }
            });



        }
    </script>
</html>
