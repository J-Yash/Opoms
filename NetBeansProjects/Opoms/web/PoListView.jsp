
<%@page import="WorkOfTheForms.DBManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="WorkOfTheForms.PurchaseOrder"%>
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
    ArrayList<PurchaseOrder> list = new ArrayList<PurchaseOrder>();
    if (request.getMethod().equalsIgnoreCase("post")) {
        String Company_name = request.getParameter("Company_name");
        

        
            list = DBManager.SearchPurchaseOrderPending(Company_name);
            

        
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="stylesheets/template.css" rel="stylesheet" type="text/css"/>
        <style>
            #form
            {
                margin: auto;
                max-width: 400px;
            }
        </style>
        <title>User Home Page</title>
        <script>
        function validatedelete(poNumber)
            {
                var choice = window.confirm("Do you really want to remove this purchase order from pending?");
                if (choice === true)
                {
                    var ref = "PoPendingToAll.jsp?poNumber=" + poNumber;
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
               <center><p style="font-size: 30px; font-family: sans-serif; font-weight: bolder;font-style: italic; color: brown ;"><b>Pending Purchase Orders</b></p></center>
              <center><input style="margin-right: 10px ;" class="btn btn-lg btn-warning" type="button" value="View All Purchase Orders" name="View All Purchase Orders" onclick="location.href = 'PoListViewAll.jsp'"  /></center>
               <br/> 
              <div id="form">
                <form class="form-group-sm" name="searchProductForm" action="PoListView.jsp" method="POST">
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

                    </select>

                    <center><button class="btn btn-primary btn-success" type="submit" value="Search">Search</button></center>

                </form>
                </div>
                        <br/>



                <table id="form" class="table table-bordered table-responsive table-hover">
                    <thead>
                        <tr>
                            <th></th>
                            <th>PO Number</th>
                            <th>Company Name</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (PurchaseOrder po : list) {%>

                        <tr>
                            
                            <td>
                            <input class="btn btn-sm btn-success" type="button" value="Edit" name="editProduct" onclick="location.href = 'EditProduct.jsp?Product_code=<%=po.getPoNumber() %>'"  />
                                <input class="btn btn-sm btn-danger" type="button" value="Move to all" name="deleteProduct" onclick="validatedelete(<%=po.getPoNumber()%>)" />
                            </td>
                            <td><a href="ViewPoDetails.jsp?poNumber=<%=po.getPoNumber()%>"><%=po.getPoNumber()%></a></td>
                            <td><%=po.getCompany()%></td>
                            <td><%=po.getPoDate()%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
                
                
            </div><br/>
            <div id="footer">
                <%@include file="/WEB-INF/jspf/footer.jspf"%>
            </div>
        </div>
    </body>
</html>
