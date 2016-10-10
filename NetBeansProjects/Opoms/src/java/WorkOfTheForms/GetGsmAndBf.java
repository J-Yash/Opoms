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
public class GetGsmAndBf extends HttpServlet {

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
            String category = request.getParameter("category");
            ArrayList<Integer> gsm = new ArrayList<Integer>();
            ArrayList<String> paperType = new ArrayList<String>();
            ArrayList<Integer> bf = new ArrayList<Integer>();

            gsm = DBManager.GetGsmFromProduct(category);
            paperType = DBManager.GetPaperTypeFromProduct(category);
            bf = DBManager.GetBfFromProduct(category);
            int count = 0;
            
            out.print("<div class=\"row\">");
            out.print(" <div class=\"col-md-4\"><label>GSM</label></div>");
            out.print(" <div class=\"col-md-4\"><label>Paper</label></div>");
            out.print(" <div class=\"col-md-4\"><label>BF</label></div>");
            out.print("</div><br/>");

            for (int i = 0; i < 9; i++) {
                if (gsm.get(i) == 0) {
                    out.print("<input type=\"text\" name=\"counter\" value=\""+(count)+"\" hidden=\"\" readonly=\"\" />");
                    break;
                }
                
                count=count+1;
                
                out.print("<div class=\"row\">");

                out.print(" <div class=\"col-md-4\"><input class=\"form-control \" type=\"text\" value=\"" + gsm.get(i) + "\" name=\"gsm" + (i + 1) + "\" required=\"\" readonly=\"\"/></div>");
                out.print(" <div class=\"col-md-4\"><input class=\"form-control \" type=\"text\" value=\"" + paperType.get(i) + "\" name=\"paperType" + (i + 1) + "\" required=\"\" readonly=\"\"/></div>");
                out.print("<div class=\"col-md-4\"><input class=\"form-control\" type=\"text\" value=\"" + bf.get(i) + "\" name=\"bf" + (i + 1) + "\" required=\"\" readonly=\"\"/></div>");
                out.print("</div><br/>");
                
            }

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
