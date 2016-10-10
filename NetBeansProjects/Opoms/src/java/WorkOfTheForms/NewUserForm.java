/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WorkOfTheForms;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static jdk.nashorn.internal.objects.NativeError.printStackTrace;

/**
 *
 * @author yash
 */
public class NewUserForm extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("/Opoms/new_user_form_success.jsp");
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
   // @Override
   // protected void doGet(HttpServletRequest request, HttpServletResponse response)
     //       throws ServletException, IOException {
       // processRequest(request, response);
    //}

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
        
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String userName = request.getParameter("uname");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        Connection con = null;
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Opoms","root","root");
            Statement st = con.createStatement();
            st.executeUpdate("INSERT INTO User_Account(first_name,last_name,user_name,pass_word,type_of_account,e_mail) VALUES('"+firstName+"','"+lastName+"','"+userName+"','"+password+"','Normal','"+email+"')");
            //con.close();
        } 
        catch (Exception ex) 
        {
            System.out.println("Error in database connection");
            printStackTrace(ex);
        }
        finally 
        {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(NewUserForm.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        processRequest(request, response);
        
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
