/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WorkOfTheForms;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yash
 */
public class IssueReelDetailsSubmit extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
    
   
    
        
        String productName = request.getParameter("productName");
        String IssueDate = request.getParameter("issueDate");
        double wastage = Double.parseDouble(request.getParameter("wastage"));
        int count = Integer.parseInt(request.getParameter("counter"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
       
            ArrayList<String> reelNumber = new ArrayList<String>();
        
        for(int i=0; i<count;i++)
        {
            String[] number = request.getParameter("reelNumber"+(i+1)).split("-");
            
            reelNumber.add(number[0]);
        }
        
        String reels = "";
        
        for(String value : reelNumber)
        {
            reels = reels + value + "; ";
        }
        
        DBManager.insertIssuedReel(productName, IssueDate, wastage, quantity, reels);

        request.getRequestDispatcher("IssuedReelsList.jsp").forward(request, response);
    
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
    @Override
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
            throws ServletException, IOException {
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