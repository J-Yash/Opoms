
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
        <title>New Product</title>
        <style>
            td,tr
            {
                border : 1px solid black;
                padding: 1px;
            }
            table 
            {
                width: auto;
                margin-left: auto;
                margin-right: auto;
                border: 1px solid black;
            }
        </style>
                <script>
                var file_count = 0;
                function addFile()
                    {
                //        <!-- Attach File: <input type="file" name="p_file" accept="image/*,.pdf,.cdr" multiple=""/><br/><br/> -->

                    if (file_count < 5)
                    {

                        var container = document.getElementById("file");


                        container.appendChild(document.createElement("br"));



                        var input = document.createElement("input");
                        input.type = "file";
                        input.name = "p_file" + file_count;
                        input.accept = ".jpg,.pdf,.cdr";

                        container.appendChild(input);

                           
                            
                            
                            file_count = file_count + 1;
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
                <br/>
                <table >
                    <tr><td>Product Code :</td><td> <%= request.getAttribute("p_code")%></td></tr>
                    <tr><td>Product Name : </td><td><%= request.getAttribute("p_name")%></td></tr>
                    <tr><td> Product Alias :</td><td> <%= request.getAttribute("p_alias")%></td></tr>
                    <tr><td> Company Name : </td><td><%= request.getAttribute("p_company_name")%></td></tr>
                    <tr><td>Company Code : </td><td><%= request.getAttribute("p_company_code")%></td></tr>
                    <tr><td> Ply :</td><td> <%= request.getAttribute("p_ply")%></td></tr>



                    <!--
                    GSM1 : <%= request.getAttribute("p_gsm1")%><br/>
                    GSM1 : <%= request.getAttribute("p_gsm2")%><br/>
                    GSM1 : <%= request.getAttribute("p_gsm3")%><br/>
                    GSM1 : <%= request.getAttribute("p_gsm4")%><br/>
                    GSM1 : <%= request.getAttribute("p_gsm5")%><br/>
                    GSM1 : <%= request.getAttribute("p_gsm6")%> <br/>
                    GSM1 : <%= request.getAttribute("p_gsm7")%><br/>
                    GSM1 : <%= request.getAttribute("p_gsm8")%><br/>
                    GSM1 : <%= request.getAttribute("p_gsm9")%><br/>
                    Kraft1 : <%= request.getAttribute("p_kraft1")%><br/>
                    Kraft2 : <%= request.getAttribute("p_kraft2")%><br/>
                    Kraft3 : <%= request.getAttribute("p_kraft3")%><br/>
                    Kraft4 : <%= request.getAttribute("p_kraft4")%><br/>
                    Kraft5 : <%= request.getAttribute("p_kraft5")%><br/>
                    Kraft6 : <%= request.getAttribute("p_kraft6")%><br/>
                    Kraft7 : <%= request.getAttribute("p_kraft7")%><br/>
                    Kraft8 : <%= request.getAttribute("p_kraft8")%> <br/>
                    Kraft9 : <%= request.getAttribute("p_kraft9")%><br/>
                    BF1 : <%= request.getAttribute("p_bf1")%><br/>
                    BF2 : <%= request.getAttribute("p_bf2")%><br/>
                    BF3 : <%= request.getAttribute("p_bf3")%><br/>
                    BF4 : <%= request.getAttribute("p_bf4")%><br/>
                    BF5 : <%= request.getAttribute("p_bf5")%> <br/>
                    BF6 : <%= request.getAttribute("p_bf6")%><br/>
                    BF7 : <%= request.getAttribute("p_bf7")%><br/>
                    BF8 : <%= request.getAttribute("p_bf8")%><br/>
                    BF9 : <%= request.getAttribute("p_bf9")%><br/>
                    
                    -->

                    <tr><td> Product Length :</td><td> <%= request.getAttribute("p_length")%></td></tr>
                    <tr><td> Product Width : </td><td><%= request.getAttribute("p_width")%></td></tr>
                    <tr><td> Product Height :</td><td> <%= request.getAttribute("p_height")%></td></tr>
                    <tr><td> ID/OD :</td><td> <%= request.getAttribute("p_decal_type")%></td></tr>
                    <tr><td> Scale :</td><td> <%= request.getAttribute("p_scale")%></td></tr>
                    <tr><td> Unit Price :</td><td> <%= request.getAttribute("p_unit_price")%></td></tr>
                    <tr><td> Type :</td><td> <%= request.getAttribute("p_type")%></td></tr>
                    <tr><td> Flute Percentage :</td><td> <%= request.getAttribute("p_flute_percentage")%></td></tr>
                    <tr><td> Decal :</td><td> <%= request.getAttribute("p_decal")%></td></tr>
                    <tr><td>Sheet Size :</td><td> <%= request.getAttribute("p_sheet_size")%></td></tr>
                    <tr><td>Total GSM : </td><td><%= request.getAttribute("p_total_gsm")%></td></tr>
                    <tr><td> Total Weight :</td><td> <%= request.getAttribute("p_total_weight")%></td></tr>
                    <tr><td> Bursting Strength(BS) : </td><td><%= request.getAttribute("p_bs")%></td></tr> 
                </table>
                <!--Code for product images is [PENDING]!!!!!!!!! -->
                <br/>
                <br/>
                

                
            </div>
            <div id="footer">
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>
    </body>
</html>
