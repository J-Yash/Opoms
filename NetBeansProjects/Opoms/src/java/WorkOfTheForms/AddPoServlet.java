package WorkOfTheForms;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddPoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("user_homepage.jsp").forward(request, response);

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
            throws ServletException, IOException 
    {
     
        
        int counter = Integer.parseInt(request.getParameter("counter"));
        String companyName = request.getParameter("companyName");
        int poNumber = Integer.parseInt(request.getParameter("poNumber"));
        String poDate = request.getParameter("poDate");
        ArrayList<String> productName = new ArrayList<String>();
        ArrayList<Double> productRate = new ArrayList<Double>();
        ArrayList<Integer> productQuantity = new ArrayList<Integer>();
        String status = "Pending";
        
        

        for (int i = 1; i <= counter; i++) {

            productName.add(request.getParameter("productName" + i));
            productRate.add(Double.parseDouble(request.getParameter("productRate" + i)));
            productQuantity.add(Integer.parseInt(request.getParameter("productQuantity" + i)));

        }
        
        PurchaseOrder po = new PurchaseOrder(poNumber, poDate, companyName, status, productName, productQuantity, productRate);
        DBManager.insertPurchaseOrder(po);
        
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
