package WorkOfTheForms;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import static jdk.nashorn.internal.runtime.Context.printStackTrace;

@MultipartConfig
public class NewProductEntry extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String p_code = request.getParameter("p_code");
        String p_alias = request.getParameter("p_alias");
        String p_company_name = request.getParameter("p_company_name");
        String p_company_code = null;
        String p_ply = request.getParameter("p_ply");

        // if(request.getParameter("p_ply")!= null)
        //{
        //   p_ply = request.getParameter("p_ply");
        //}
        int value = Integer.parseInt(p_ply);
        String[] p_gsm = new String[9];
        String[] p_kraft = new String[9];
        String[] p_bf = new String[9];
        for (int i = 0; i < value; i++) {
            p_gsm[i] = request.getParameter("p_gsm" + (i + 1));
            p_kraft[i] = request.getParameter("p_kraft" + (i + 1));
            p_bf[i] = request.getParameter("p_bf" + (i + 1));
        }

        int[] p_gsm_integer_value = new int[9];
        int[] p_bf_integer_value = new int[9];

        for (int i = 0; i < value; i++) //******String to int conversion ***********!!!
        {
            p_gsm_integer_value[i] = Integer.parseInt(p_gsm[i]);
            p_bf_integer_value[i] = Integer.parseInt(p_bf[i]);
        }                                          //**************end of conversion******************

        String p_length = request.getParameter("p_length");
        String p_width = request.getParameter("p_width");
        String p_height = request.getParameter("p_height");

        //Validation for height if null
        if ("".equals(p_height)) {
            p_height = "0";
        }

        String p_decal_type = request.getParameter("p_decal_type");
        String p_scale = request.getParameter("p_scale");
        String p_unit_price = request.getParameter("p_unit_price");
        String p_product_type = request.getParameter("p_product_type");
        String p_flute_percentage = request.getParameter("p_flute_percentage");
        if ("".equals(p_flute_percentage)) {
            p_flute_percentage = "40";
        }
        String p_bs = request.getParameter("p_bs");
        if ("".equals(p_bs)) {
            p_bs = "0";
        }

        String p_sheet_size = sheetSizeCalculate(p_length, p_width);

        String p_decal = decalCalculate(p_width, p_height);

        String p_total_gsm = totalGsmCalculate(p_gsm, p_flute_percentage, value);

        String p_total_weight = totalWeightCalculate(p_sheet_size, p_decal, p_total_gsm);

        String p_name = null;

        //Code for file uploads is pending!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        
        String projectLocation = getServletContext().getRealPath("/");
        Part[] p = new Part[5];
        for(int i = 0; i<5; i++)
        {
            p[i] = request.getPart("p_file"+(i+1));
        }
      /*  Part p1 = request.getPart("p_file1");
        Part p2 = request.getPart("p_file2");
        Part p3 = request.getPart("p_file3");
        Part p4 = request.getPart("p_file4");
        Part p5 = request.getPart("p_file5");
        */
        String photo = FileUploader.uploadFile(projectLocation, p);
        
        
        
        
        //*************String to integer conversion ********************
        int p_ply_integer_value = Integer.parseInt(p_ply);
        double p_length_integer_value = Double.parseDouble(p_length);
        double p_width_integer_value = Double.parseDouble(p_width);
        double p_height_integer_value = Double.parseDouble(p_height);
        double p_unit_price_integer_value = Double.parseDouble(p_unit_price);
        int p_flute_percentage_integer_value = Integer.parseInt(p_flute_percentage);
        double p_bs_integer_value = Double.parseDouble(p_bs);
        int p_sheet_size_integer_value = Integer.parseInt(p_sheet_size);
        int p_decal_integer_value = Integer.parseInt(p_decal);
        double p_total_gsm_integer_value = Double.parseDouble(p_total_gsm);
        double p_total_weight_integer_value = Double.parseDouble(p_total_weight);

        //*****************End of conversion********************************
        //*****************ArrayList creation to pass to the product constructor - START
        ArrayList<Integer> p_gsm_arraylist = new ArrayList<>();
        ArrayList<String> p_kraft_arraylist = new ArrayList<>();
        ArrayList<Integer> p_bf_arraylist = new ArrayList<>();

        for (int i = 0; i < 9; i++) {
            p_gsm_arraylist.add(p_gsm_integer_value[i]);
            p_kraft_arraylist.add(p_kraft[i]);
            p_bf_arraylist.add(p_bf_integer_value[i]);
        }

        //*****************ArrayList creation to pass to the product constructor - END
        int product_code = Integer.parseInt(p_code);
        int product_ply = Integer.parseInt(p_ply);
        //************Code for file entry***********************************

        //************Code for file entry ends******************************
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Opoms?autoReconnect=true&useSSL=false", "root", "root");
            //  p_company_name = "Ola";
            String qryforcompanycode = String.format("Select company_name,company_code from Companies where company_name = '%s'", p_company_name);

            // PreparedStatement stcode = con.prepareStatement(qryforcompanycode);
            // stcode.setString(1, p_company_name);
            // ResultSet rs1 = stcode.executeQuery();
            Statement statement = con.createStatement();
            ResultSet rs1 = statement.executeQuery(qryforcompanycode);

            while (rs1.next()) {
                p_company_code = rs1.getString("company_code");

            }

            p_name = p_company_code + "_" + p_product_type + "_" + p_alias + "_(" + p_length + "*" + p_width + "*" + p_height + ")_" + p_ply + "P";

            Product product = new Product(product_code, p_name, p_alias, p_company_name, p_company_code, product_ply, p_length_integer_value, p_width_integer_value, p_height_integer_value, p_decal_type, p_scale, p_unit_price_integer_value, p_product_type, p_flute_percentage_integer_value, p_decal_integer_value, p_sheet_size_integer_value, p_total_gsm_integer_value, p_total_weight_integer_value, p_bs_integer_value, p_gsm_arraylist, p_kraft_arraylist, p_bf_arraylist, photo);

            DBManager.insertProduct(product);

            //CODE TO RETRIEVE PRODUCT CODE FROM THE TABLE!!!
            String qryretrieve = "Select product_code from Product order by product_code DESC LIMIT 1";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(qryretrieve);
            while (rs.next()) {
                p_code = rs.getString("product_code");
            }

        } catch (Exception ex) {
            System.out.println("Error in database connection");
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(NewProductEntry.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        //CODE FOR SHOWING PRODUCT DETAILS IN THE NEXT JSP PAGE!!!
        request.setAttribute("p_code", p_code);
        request.setAttribute("p_name", p_name);
        request.setAttribute("p_alias", p_alias);
        request.setAttribute("p_company_name", p_company_name);
        request.setAttribute("p_company_code", p_company_code);
        request.setAttribute("p_ply", p_ply);
        request.setAttribute("p_length", p_length);
        request.setAttribute("p_width", p_width);
        request.setAttribute("p_height", p_height);
        request.setAttribute("p_decal_type", p_decal_type);
        request.setAttribute("p_scale", p_scale);
        request.setAttribute("p_unit_price", p_unit_price);
        request.setAttribute("p_type", p_product_type);
        request.setAttribute("p_flute_percentage", p_flute_percentage);
        request.setAttribute("p_decal", p_decal);
        request.setAttribute("p_sheet_size", p_sheet_size);
        request.setAttribute("p_total_gsm", p_total_gsm);
        request.setAttribute("p_total_weight", p_total_weight);
        //CURRENT STOCK-maybe????
        for (int i = 0; i < 9; i++) {
            String valuegsm = "p_gsm" + (i + 1);
            request.setAttribute(valuegsm, p_gsm[i]);
            String valuekraft = "p_kraft" + (i + 1);
            request.setAttribute(valuekraft, p_kraft[i]);
            String valuebf = "p_bf" + (i + 1);
            request.setAttribute(valuebf, p_bf[i]);

        }
        request.setAttribute("p_bs", p_bs);

        request.getRequestDispatcher("NewProductSuccessDetails.jsp").forward(request, response);

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
            throws ServletException, IOException {

        processRequest(request, response);
    }

    String sheetSizeCalculate(String p_length, String p_width) {
        double p_lengthnew = Double.parseDouble(p_length);
        double p_widthnew = Double.parseDouble(p_width);

        Double value = ((2.0 * (p_lengthnew + p_widthnew)) / 25.4) + 3;

        int value_rounded = (int) (Math.floor(value + 0.4));

        String valuenew = Integer.toString(value_rounded);
        return valuenew;
    }

    String decalCalculate(String p_width, String p_height) {
        double p_widthnew = Double.parseDouble(p_width);
        double p_heightnew = Double.parseDouble(p_height);

        double value = (((p_widthnew + p_heightnew) / 25.4) + 1.5);

        int value_rounded = (int) Math.floor(value + 0.4);

        String valuenew = Integer.toString(value_rounded);
        return valuenew;
    }

    String totalGsmCalculate(String[] gsm, String flute, int plyvalue) {
        int[] gsmvalues = new int[9];
        int normalgsm = 0;
        int flutegsm = 0;

        double flutevalue = Double.parseDouble(flute);

        for (int i = 0; i < plyvalue; i++) //loop till ply value-correction done!
        {
            gsmvalues[i] = Integer.parseInt(gsm[i]);

        }

        for (int i = 0; i < gsmvalues.length; i++) {
            if (i % 2 == 0) {
                normalgsm += gsmvalues[i];
            } else if (i % 2 == 1) {
                flutegsm = (int) ((gsmvalues[i] * (flutevalue / 100.0)) + flutegsm);
            }
        }

        int totalgsm = normalgsm + flutegsm;

        String totalgsmvalue = Integer.toString(totalgsm);

        return totalgsmvalue;
    }

    String totalWeightCalculate(String sheetsize, String decal, String totalgsm) {
        Double sheetsizevalue = Double.parseDouble(sheetsize);
        Double decalvalue = Double.parseDouble(decal);
        Double totalgsmvalue = Double.parseDouble(totalgsm);

        Double value = Math.ceil((sheetsizevalue * decalvalue * totalgsmvalue) / 1550);

        String totalweight = Double.toString(value);

        return totalweight;
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
