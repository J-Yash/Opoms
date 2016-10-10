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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
public class IssueReel extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) 
        {
            String productName = request.getParameter("productName");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double decal = Double.parseDouble(request.getParameter("decal"));
            int sheetSize = Integer.parseInt(request.getParameter("sheetSize"));
            double paperRequired = Double.parseDouble(request.getParameter("paperRequired"));
            ArrayList<Integer> gsm = new ArrayList<Integer>();
            ArrayList<String> paperType = new ArrayList<>();
            ArrayList<Integer> bf = new ArrayList<>();
            int count = Integer.parseInt(request.getParameter("counter"));
            
            for(int i = 0; i < count; i++)
            {
                gsm.add(Integer.parseInt(request.getParameter("gsm"+(i+1))));
                paperType.add(request.getParameter("paperType"+(i+1)));
                bf.add(Integer.parseInt(request.getParameter("bf"+(i+1))));
                
                
            }
            
            for(int i=0;i<count;i++)
            {
                if(paperType.get(i).equalsIgnoreCase("Virgin Kraft"))
                {
                    paperType.set(i, "VK");
                }
                else if(paperType.get(i).equalsIgnoreCase("Semi Kraft"))
                {
                    paperType.set(i, "SK");
                }
            }
            
            ArrayList<Integer> reelNumber = new ArrayList<>();
            ArrayList<Double> reelSize = new ArrayList<>();
            ArrayList<String> reelPaperType = new ArrayList<>();
            
            //***************************DATABASE RESULT FETCHING**************************************************
            Connection con = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Opoms?autoReconnect=true&useSSL=false", "root", "root");
                System.out.print("*************CONNECTION CREATED****************");
                for(int i = 0; i < count; i++)
                {
                    System.out.print("*************CONNECTION LOOP****************");
                    String qry = "Select * from Stock where reel_type=? and bf=? and paper_type=? and reel_size >=? order by reel_size ";
                    PreparedStatement st = con.prepareStatement(qry);
                    st.setInt(1,gsm.get(i));
                    st.setInt(2, bf.get(i));
                    st.setString(3, paperType.get(i));
                    st.setDouble(4, decal);
                    ResultSet rs = st.executeQuery();
                    System.out.print("*************RESULT RETRIEVED****************");
                    if (rs.next()) 
                    {
                        System.out.print("*************RESULTSET LOOP****************");
                        reelNumber.add(rs.getInt("reel_number"));
                        System.out.print("*************REELNUMBER****************");
                        reelSize.add(rs.getDouble("reel_size"));
                        System.out.print("*************REELSIZE****************");
                        reelPaperType.add(rs.getString("paper_type"));             
                        System.out.print("*************PAPERTYPE****************");
                        System.out.print("*************DATABASE FETCHING****************");
                        System.out.print(reelNumber.get(i));
                        System.out.print(reelSize.get(i));
                        System.out.print(reelPaperType.get(i));
                        System.out.print("*************LOOP END****************");

                    }
                    else
                    {
                        System.out.print("*************ELSE BLOCK****************");
                        reelNumber.add(0);
                        reelSize.add(0.0);
                        reelPaperType.add("No Reel found for this !");
                        System.out.print(reelNumber.get(i));
                        System.out.print(reelSize.get(i));
                        System.out.print(reelPaperType.get(i));
                    }
                }
                

            } catch (Exception ex) {
                System.out.print("Error in Database Connection!");
                ex.printStackTrace();
            } finally {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(IssueReel.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //******************DATABASE END-RESULTS RETRIEVED*************************************
            
           
            
            //******************SETTING VALUES FOR THE NEXT JSP PAGE*******************************
            
            double wastage = 0.0;
            System.out.print("***********WASTAGE**************");
             System.out.print(wastage);
            for(double value : reelSize)
            {
                if(value == 0.0)
                {
                    continue;
                }
                
                System.out.print("***********WASTAGE LOOP**************");
                wastage = wastage + (value - decal);
                System.out.print(wastage);
                 System.out.print(value);
                  System.out.print(decal);
            }
            
            request.setAttribute("productName", productName);
            request.setAttribute("decal", decal);
            request.setAttribute("sheetSize", sheetSize);
            request.setAttribute("wastage", wastage);
          
            
            for(int i = 0;i<count;i++)
            {
                request.setAttribute("reelNumber"+(i+1),reelNumber.get(i) );
                 System.out.print(reelNumber.get(i)+"***************************REELNUMBER");
                request.setAttribute("reelPaperType"+(i+1), reelPaperType.get(i));
                System.out.print(reelPaperType.get(i)+"*****************************REELPAPERTYPE");
                
            }
            
            request.setAttribute("counter", count);
            request.setAttribute("quantity", quantity);
            request.setAttribute("issueDate", new SimpleDateFormat("dd/MM/yyyy").format(Calendar.getInstance().getTime()));
            
            request.getRequestDispatcher("IssueReelDetails.jsp").forward(request, response);

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
