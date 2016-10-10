<%@page import="java.util.ArrayList"%>
<%@page import="WorkOfTheForms.DBManager"%>
<%@page import="WorkOfTheForms.Product"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("userName")==null){
        response.sendRedirect("login_page.jsp");
    }
   // else if(!session.getAttribute("role").toString().equalsIgnoreCase("admin")){
   //     response.sendRedirect("../login.jsp");
   // }
%>
<%
    int Product_code = Integer.parseInt(request.getParameter("p_code"));
    
  //  String Product_name = request.getParameter("p_name") ;
    String Product_alias = request.getParameter("p_alias");
    String Company_name = request.getParameter("p_company_name");
    String Company_code = request.getParameter("p_company_code");
    int Ply = Integer.parseInt(request.getParameter("p_ply"));
    double Product_length = Double.parseDouble(request.getParameter("p_length"));
    double Product_width = Double.parseDouble(request.getParameter("p_width"));
    double Product_height = Double.parseDouble(request.getParameter("p_height"));
    String Product_decal_type = request.getParameter("p_decal_type");
    String Product_scale = request.getParameter("p_scale");
    double Product_unit_price = Double.parseDouble(request.getParameter("p_unit_price"));
    String Product_type = request.getParameter("p_product_type");
    int Product_flute_percentage = Integer.parseInt(request.getParameter("p_flute_percentage"));
    double Product_bs = Double.parseDouble(request.getParameter("p_bs"));
    int Product_sheet_size = Integer.parseInt(request.getParameter("p_sheet_size"));
    int Product_decal = Integer.parseInt(request.getParameter("p_decal"));
    double Product_total_gsm = Double.parseDouble(request.getParameter("p_total_gsm"));
    double Product_total_weight = Double.parseDouble(request.getParameter("p_total_weight"));
    
    String Product_name = Company_code + "_" + Product_type + "_" + Product_alias + "_(" + Product_length + "*" + Product_width + "*" + Product_height + ")_" + Ply + "P";
    
    ArrayList<Integer> Product_gsm = new ArrayList<Integer>();
    ArrayList<String> Product_kraft = new ArrayList<String>();
    ArrayList<Integer> Product_bf = new ArrayList<Integer>();    
    for(int i = 1; i <= Ply; i++)
    {
        Product_gsm.add(Integer.parseInt(request.getParameter("p_gsm"+i)));
        Product_kraft.add(request.getParameter("p_kraft"+i));
        Product_bf.add(Integer.parseInt(request.getParameter("p_bf"+i)));
    }
    for(int i = Ply+1;i <=9; i++)
    {
        Product_gsm.add(0);
        Product_kraft.add(null);
        Product_bf.add(0);
    }
    
    
    Product product = new Product(Product_code,Product_name,Product_alias,Company_name,Company_code,Ply,Product_length,Product_width,Product_height,Product_decal_type,Product_scale,Product_unit_price,Product_type,Product_flute_percentage,Product_decal,Product_sheet_size,Product_total_gsm,Product_total_weight,Product_bs,Product_gsm,Product_kraft,Product_bf);

    DBManager.updateProduct(product);
    
    response.sendRedirect("ViewProduct.jsp");
%>
