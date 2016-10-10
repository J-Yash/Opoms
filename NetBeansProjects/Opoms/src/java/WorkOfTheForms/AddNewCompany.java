/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WorkOfTheForms;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yash
 */
public class AddNewCompany extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /*protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
      /*      out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddNewCompany</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddNewCompany at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 /*   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {   
        String companyname = request.getParameter("company_name");
        String companycode = request.getParameter("company_code");
        
        Connection con = null;
        
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Opoms?autoReconnect=true&useSSL=false","root","root"); 
           // PreparedStatement st1 = con.prepareStatement("Select company_name,company_code from Companies");
            //Statement st = con.createStatement();
           // ResultSet rs = st1.executeQuery();
           
            
           // while (rs.next()) 
           // {                
             /* String companynameFromDatabase = rs.getString("company_name");
              String companycodeFromDatabase = rs.getString("company_code");
              
              if(companyname.equals(companynameFromDatabase) || companycode.equals(companycodeFromDatabase))
              {
                 request.setAttribute("company_name",companynameFromDatabase );
                 request.setAttribute("company_code", companycodeFromDatabase );
                 request.getRequestDispatcher("CompanyExistsError.jsp").forward(request, response);
                 break;
                                                 
                  
              }*/
             /* else if(companycode.equals(companycodeFromDatabase))
              {
                 request.setAttribute("company_name",companynameFromDatabase );
                 request.setAttribute("company_code", companycodeFromDatabase );
                 request.getRequestDispatcher("CompanyCodeExistsError.jsp").forward(request, response);
                 break;
              }
              */
             // else
             // {
            
                String query = "Insert into Companies (company_name,company_code) values(?,?)";
               // st.executeUpdate(query);
                PreparedStatement st2 = con.prepareStatement(query); 
                st2.setString(1,companyname);
                st2.setString(2, companycode);
                st2.executeUpdate();
                
                request.setAttribute("company_name",companyname );
                 request.setAttribute("company_code", companycode );
                 request.getRequestDispatcher("CompanyCreated.jsp").forward(request, response);
             // }
              
          //  }
        }
//    request.setAttribute("u_name",username );
  //                         request.getRequestDispatcher("user_homepage.jsp").forward(request, response);

        catch (Exception e) 
        {
            //request.setAttribute("company_name",companynameFromDatabase );
             //    request.setAttribute("company_code", companycodeFromDatabase );
                 request.getRequestDispatcher("CompanyExistsError.jsp").forward(request, response);
           // System.out.println("Error in database connection");
          //  e.printStackTrace();
        }
        
        finally
        {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(AddNewCompany.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
