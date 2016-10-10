package WorkOfTheForms;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {

    private static final String DBDRIVER = "com.mysql.jdbc.Driver";
    private static final String DBURL = "jdbc:mysql://localhost:3306/Opoms";
    private static final String DBUSER = "root";
    private static final String DBPASSWORD = "root";

    static {
        try {
            Class.forName(DBDRIVER);
        } catch (Exception ex) {
            System.out.println("DBManager - static - " + ex);
        }
    }

    public static void insertProduct(Product product) {
        //  boolean flag = false;

        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            String qry = "INSERT INTO Product(product_name,product_alias,company_name,company_code,ply,product_length,product_width,product_height,product_decal_type,product_scale,product_unit_price,product_type,product_flute_percentage,product_decal,product_sheet_size,product_total_gsm,product_total_weight,product_bs,p_gsm1,p_gsm2,p_gsm3,p_gsm4,p_gsm5,p_gsm6,p_gsm7,p_gsm8,p_gsm9,p_kraft1,p_kraft2,p_kraft3,p_kraft4,p_kraft5,p_kraft6,p_kraft7,p_kraft8,p_kraft9,p_bf1,p_bf2,p_bf3,p_bf4,p_bf5,p_bf6,p_bf7,p_bf8,p_bf9,product_drawing) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            java.sql.PreparedStatement st1 = con.prepareStatement(qry);

            st1.setString(1, product.getProduct_name());
            st1.setString(2, product.getProduct_alias());
            st1.setString(3, product.getCompany_name());
            st1.setString(4, product.getCompany_code());
            st1.setInt(5, product.getPly());
            st1.setDouble(6, product.getProduct_length());
            st1.setDouble(7, product.getProduct_width());
            st1.setDouble(8, product.getProduct_height());
            st1.setString(9, product.getProduct_decal_type());
            st1.setString(10, product.getProduct_scale());
            st1.setDouble(11, product.getProduct_unit_price());
            st1.setString(12, product.getProduct_type());
            st1.setInt(13, product.getProduct_flute_percentage());
            st1.setInt(14, product.getProduct_decal());
            st1.setInt(15, product.getProduct_sheet_size());
            st1.setDouble(16, product.getProduct_total_gsm());
            st1.setDouble(17, product.getProduct_total_weight());
            st1.setDouble(18, product.getP_bs());
            st1.setInt(19, product.getP_gsm().get(0));
            st1.setInt(20, product.getP_gsm().get(1));
            st1.setInt(21, product.getP_gsm().get(2));
            st1.setInt(22, product.getP_gsm().get(3));
            st1.setInt(23, product.getP_gsm().get(4));
            st1.setInt(24, product.getP_gsm().get(5));
            st1.setInt(25, product.getP_gsm().get(6));
            st1.setInt(26, product.getP_gsm().get(7));
            st1.setInt(27, product.getP_gsm().get(8));
            st1.setString(28, product.getP_kraft().get(0));
            st1.setString(29, product.getP_kraft().get(1));
            st1.setString(30, product.getP_kraft().get(2));
            st1.setString(31, product.getP_kraft().get(3));
            st1.setString(32, product.getP_kraft().get(4));
            st1.setString(33, product.getP_kraft().get(5));
            st1.setString(34, product.getP_kraft().get(6));
            st1.setString(35, product.getP_kraft().get(7));
            st1.setString(36, product.getP_kraft().get(8));
            st1.setInt(37, product.getP_bf().get(0));
            st1.setInt(38, product.getP_bf().get(1));
            st1.setInt(39, product.getP_bf().get(2));
            st1.setInt(40, product.getP_bf().get(3));
            st1.setInt(41, product.getP_bf().get(4));
            st1.setInt(42, product.getP_bf().get(5));
            st1.setInt(43, product.getP_bf().get(6));
            st1.setInt(44, product.getP_bf().get(7));
            st1.setInt(45, product.getP_bf().get(8));
            st1.setString(46, product.getPhoto());

            st1.executeUpdate();

            // Product.product_code = Product.product_code + 1;
            // flag = true;
        } catch (Exception ex) {
            System.out.println("DBManager - insertProduct - " + ex);
        }
        // return flag;
    }

    public static Product findProduct(int product_code) {
        Product product = null;
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("select * from Product where product_code=?");
            st.setInt(1, product_code);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                product = new Product();
                product.setProduct_code(rs.getInt(1));
                product.setProduct_name(rs.getString(2));
                product.setProduct_alias(rs.getString(4));
                product.setCompany_name(rs.getString(5));
                product.setCompany_code(rs.getString(6));
                product.setPly(rs.getInt(7));
                product.setProduct_length(rs.getDouble(8));
                product.setProduct_width(rs.getDouble(9));
                product.setProduct_height(rs.getDouble(10));
                product.setProduct_decal_type(rs.getString(11));
                product.setProduct_scale(rs.getString(12));
                product.setProduct_unit_price(rs.getDouble(13));
                product.setProduct_type(rs.getString(14));
                product.setProduct_flute_percentage(rs.getInt(15));
                product.setProduct_decal(rs.getInt(16));
                product.setProduct_sheet_size(rs.getInt(17));
                product.setProduct_total_gsm(rs.getDouble(18));
                product.setProduct_total_weight(rs.getDouble(19));

                ArrayList<Integer> p_gsm = new ArrayList<Integer>();
                ArrayList<String> p_kraft = new ArrayList<String>();
                ArrayList<Integer> p_bf = new ArrayList<Integer>();
                for (int i = 21; i < 30; i++) {
                    p_gsm.add(rs.getInt(i));
                }
                for (int i = 30; i < 39; i++) {
                    p_kraft.add(rs.getString(i));
                }
                for (int i = 39; i < 48; i++) {
                    p_bf.add(rs.getInt(i));
                }

                product.setP_gsm(p_gsm);
                product.setP_kraft(p_kraft);
                product.setP_bf(p_bf);
                product.setP_bs(rs.getDouble(48));
                product.setPhoto(rs.getString(3));

            }
        } catch (Exception ex) {
            System.out.println("DBManager - findProduct - " + ex);
        }
        return product;
    }

    public static boolean updateProduct(Product product) {
        boolean flag = false;
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {

            String qry = "UPDATE Product SET product_name=?,product_alias=?,company_name=?,company_code=?,ply=?,product_length=?,product_width=?,product_height=?,product_decal_type=?,"
                    + "product_scale=?,product_unit_price=?,product_type=?,product_flute_percentage=?,product_decal=?,product_sheet_size=?,product_total_gsm=?,product_total_weight=?,"
                    + "product_bs=?,p_gsm1=?,p_gsm2=?,p_gsm3=?,p_gsm4=?,p_gsm5=?,p_gsm6=?,p_gsm7=?,p_gsm8=?,p_gsm9=?,p_kraft1=?,p_kraft2=?,p_kraft3=?,p_kraft4=?,p_kraft5=?,p_kraft6=?,"
                    + "p_kraft7=?,p_kraft8=?,p_kraft9=?,p_bf1=?,p_bf2=?,p_bf3=?,p_bf4=?,p_bf5=?,p_bf6=?,p_bf7=?,p_bf8=?,p_bf9=? where product_code=?";

            PreparedStatement st1 = con.prepareStatement(qry);

            st1.setString(1, product.getProduct_name());
            st1.setString(2, product.getProduct_alias());
            st1.setString(3, product.getCompany_name());
            st1.setString(4, product.getCompany_code());
            st1.setInt(5, product.getPly());
            st1.setDouble(6, product.getProduct_length());
            st1.setDouble(7, product.getProduct_width());
            st1.setDouble(8, product.getProduct_height());
            st1.setString(9, product.getProduct_decal_type());
            st1.setString(10, product.getProduct_scale());
            st1.setDouble(11, product.getProduct_unit_price());
            st1.setString(12, product.getProduct_type());
            st1.setInt(13, product.getProduct_flute_percentage());
            st1.setInt(14, product.getProduct_decal());
            st1.setInt(15, product.getProduct_sheet_size());
            st1.setDouble(16, product.getProduct_total_gsm());
            st1.setDouble(17, product.getProduct_total_weight());
            st1.setDouble(18, product.getP_bs());
            st1.setInt(19, product.getP_gsm().get(0));
            st1.setInt(20, product.getP_gsm().get(1));
            st1.setInt(21, product.getP_gsm().get(2));
            st1.setInt(22, product.getP_gsm().get(3));
            st1.setInt(23, product.getP_gsm().get(4));
            st1.setInt(24, product.getP_gsm().get(5));
            st1.setInt(25, product.getP_gsm().get(6));
            st1.setInt(26, product.getP_gsm().get(7));
            st1.setInt(27, product.getP_gsm().get(8));
            st1.setString(28, product.getP_kraft().get(0));
            st1.setString(29, product.getP_kraft().get(1));
            st1.setString(30, product.getP_kraft().get(2));
            st1.setString(31, product.getP_kraft().get(3));
            st1.setString(32, product.getP_kraft().get(4));
            st1.setString(33, product.getP_kraft().get(5));
            st1.setString(34, product.getP_kraft().get(6));
            st1.setString(35, product.getP_kraft().get(7));
            st1.setString(36, product.getP_kraft().get(8));
            st1.setInt(37, product.getP_bf().get(0));
            st1.setInt(38, product.getP_bf().get(1));
            st1.setInt(39, product.getP_bf().get(2));
            st1.setInt(40, product.getP_bf().get(3));
            st1.setInt(41, product.getP_bf().get(4));
            st1.setInt(42, product.getP_bf().get(5));
            st1.setInt(43, product.getP_bf().get(6));
            st1.setInt(44, product.getP_bf().get(7));
            st1.setInt(45, product.getP_bf().get(8));
            st1.setInt(46, product.getProduct_code());

            st1.executeUpdate();
            flag = true;
        } catch (Exception ex) {
            System.out.println("DBManager - UpdateProduct - " + ex);
        }
        return flag;
    }

    public static boolean deleteProduct(int product_code) {
        boolean flag = false;
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("delete from Product where product_code=?");
            st.setInt(1, product_code);
            st.executeUpdate();
            flag = true;
        } catch (Exception ex) {
            System.out.println("DBManager - deleteProduct - " + ex);
        }
        return flag;
    }

    public static ArrayList<Product> getAllProducts() {
        ArrayList<Product> list = new ArrayList<Product>();
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("select * from Product");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();

                product.setProduct_code(rs.getInt(1));
                product.setProduct_name(rs.getString(2));
                product.setProduct_alias(rs.getString(4));
                product.setCompany_name(rs.getString(5));
                product.setCompany_code(rs.getString(6));
                product.setPly(rs.getInt(7));
                product.setProduct_length(rs.getDouble(8));
                product.setProduct_width(rs.getDouble(9));
                product.setProduct_height(rs.getDouble(10));
                product.setProduct_decal_type(rs.getString(11));
                product.setProduct_scale(rs.getString(12));
                product.setProduct_unit_price(rs.getDouble(13));
                product.setProduct_type(rs.getString(14));
                product.setProduct_flute_percentage(rs.getInt(15));
                product.setProduct_decal(rs.getInt(16));
                product.setProduct_sheet_size(rs.getInt(17));
                product.setProduct_total_gsm(rs.getDouble(18));
                product.setProduct_total_weight(rs.getDouble(19));

                ArrayList<Integer> p_gsm = new ArrayList<Integer>();
                ArrayList<String> p_kraft = new ArrayList<String>();
                ArrayList<Integer> p_bf = new ArrayList<Integer>();
                for (int i = 21; i < 30; i++) {
                    p_gsm.add(rs.getInt(i));
                }
                for (int i = 30; i < 39; i++) {
                    p_kraft.add(rs.getString(i));
                }
                for (int i = 39; i < 48; i++) {
                    p_bf.add(rs.getInt(i));
                }

                product.setP_gsm(p_gsm);
                product.setP_kraft(p_kraft);
                product.setP_bf(p_bf);
                product.setP_bs(rs.getDouble(48));

                list.add(product);
            }
        } catch (Exception ex) {
            System.out.println("DBManager - getAllProducts - " + ex);
        }
        return list;
    }

    public static int getProductCodeManual() {
        int product_code = 0;
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            String qryretrieve = "Select product_code from Product order by product_code DESC LIMIT 1";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(qryretrieve);
            while (rs.next()) {
                product_code = rs.getInt("product_code");
            }

        } catch (Exception ex) {
            System.out.println("DBManager - getproductcodemanual - " + ex);
        }

        product_code = product_code + 1;
        return product_code;
    }

    public static ArrayList<Product> SearchProductsOne(String Company_name, String Product_type) {
        ArrayList<Product> list = new ArrayList<Product>();
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("select * from Product where company_name=? and product_type=?");
            st.setString(1, Company_name);
            st.setString(2, Product_type);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();

                product.setProduct_code(rs.getInt(1));
                product.setProduct_name(rs.getString(2));
                product.setProduct_alias(rs.getString(4));
                product.setCompany_name(rs.getString(5));
                product.setCompany_code(rs.getString(6));
                product.setPly(rs.getInt(7));
                product.setProduct_length(rs.getDouble(8));
                product.setProduct_width(rs.getDouble(9));
                product.setProduct_height(rs.getDouble(10));
                product.setProduct_decal_type(rs.getString(11));
                product.setProduct_scale(rs.getString(12));
                product.setProduct_unit_price(rs.getDouble(13));
                product.setProduct_type(rs.getString(14));
                product.setProduct_flute_percentage(rs.getInt(15));
                product.setProduct_decal(rs.getInt(16));
                product.setProduct_sheet_size(rs.getInt(17));
                product.setProduct_total_gsm(rs.getDouble(18));
                product.setProduct_total_weight(rs.getDouble(19));

                ArrayList<Integer> p_gsm = new ArrayList<Integer>();
                ArrayList<String> p_kraft = new ArrayList<String>();
                ArrayList<Integer> p_bf = new ArrayList<Integer>();
                for (int i = 21; i < 30; i++) {
                    p_gsm.add(rs.getInt(i));
                }
                for (int i = 30; i < 39; i++) {
                    p_kraft.add(rs.getString(i));
                }
                for (int i = 39; i < 48; i++) {
                    p_bf.add(rs.getInt(i));
                }

                product.setP_gsm(p_gsm);
                product.setP_kraft(p_kraft);
                product.setP_bf(p_bf);
                product.setP_bs(rs.getDouble(48));

                list.add(product);
            }
        } catch (Exception ex) {
            System.out.println("DBManager - getAllProducts - " + ex);
        }
        return list;
    }

    public static ArrayList<Product> SearchProductsOne(String Company_name, String Product_type, String Search_key, String Key_value) {
        ArrayList<Product> list = new ArrayList<Product>();
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            String query = "select * from Product where company_name=? and product_type=? and " + Search_key + " like ?";
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, Company_name);
            st.setString(2, Product_type);
            if (Search_key.equalsIgnoreCase("product_unit_price")) {
                st.setDouble(3, Double.parseDouble(Key_value));
            } else if (Search_key.equalsIgnoreCase("product_alias")) {
                st.setString(3, "%" + Key_value + "%");
            } else {
                st.setInt(3, Integer.parseInt(Key_value));
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();

                product.setProduct_code(rs.getInt(1));
                product.setProduct_name(rs.getString(2));
                product.setProduct_alias(rs.getString(4));
                product.setCompany_name(rs.getString(5));
                product.setCompany_code(rs.getString(6));
                product.setPly(rs.getInt(7));
                product.setProduct_length(rs.getDouble(8));
                product.setProduct_width(rs.getDouble(9));
                product.setProduct_height(rs.getDouble(10));
                product.setProduct_decal_type(rs.getString(11));
                product.setProduct_scale(rs.getString(12));
                product.setProduct_unit_price(rs.getDouble(13));
                product.setProduct_type(rs.getString(14));
                product.setProduct_flute_percentage(rs.getInt(15));
                product.setProduct_decal(rs.getInt(16));
                product.setProduct_sheet_size(rs.getInt(17));
                product.setProduct_total_gsm(rs.getDouble(18));
                product.setProduct_total_weight(rs.getDouble(19));

                ArrayList<Integer> p_gsm = new ArrayList<Integer>();
                ArrayList<String> p_kraft = new ArrayList<String>();
                ArrayList<Integer> p_bf = new ArrayList<Integer>();
                for (int i = 21; i < 30; i++) {
                    p_gsm.add(rs.getInt(i));
                }
                for (int i = 30; i < 39; i++) {
                    p_kraft.add(rs.getString(i));
                }
                for (int i = 39; i < 48; i++) {
                    p_bf.add(rs.getInt(i));
                }

                product.setP_gsm(p_gsm);
                product.setP_kraft(p_kraft);
                product.setP_bf(p_bf);
                product.setP_bs(rs.getDouble(48));

                list.add(product);
            }
        } catch (Exception ex) {
            System.out.println("DBManager - getAllProducts - " + ex);
        }
        return list;
    }

    public static ArrayList<Product> SearchProductsOne(String Company_name, String Product_type, String product_length, String product_width, String product_height) {
        ArrayList<Product> list = new ArrayList<Product>();
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            String query = null;

            if (product_length.equalsIgnoreCase("") && !product_width.equalsIgnoreCase("") && !product_height.equalsIgnoreCase("")) {
                query = "select * from Product where company_name=? and product_type=? and product_width=? and product_height=?";
            } else if (!product_length.equalsIgnoreCase("") && product_width.equalsIgnoreCase("") && !product_height.equalsIgnoreCase("")) {
                query = "select * from Product where company_name=? and product_type=? and product_length=? and product_height=?";
            } else if (!product_length.equalsIgnoreCase("") && !product_width.equalsIgnoreCase("") && product_height.equalsIgnoreCase("")) {
                query = "select * from Product where company_name=? and product_type=? and product_length=? and product_width=?";
            } else if (!product_length.equalsIgnoreCase("") && product_width.equalsIgnoreCase("") && product_height.equalsIgnoreCase("")) {
                query = "select * from Product where company_name=? and product_type=? and product_length=?";
            } else if (product_length.equalsIgnoreCase("") && !product_width.equalsIgnoreCase("") && product_height.equalsIgnoreCase("")) {
                query = "select * from Product where company_name=? and product_type=? and product_width=?";
            } else if (product_length.equalsIgnoreCase("") && product_width.equalsIgnoreCase("") && !product_height.equalsIgnoreCase("")) {
                query = "select * from Product where company_name=? and product_type=? and product_height=?";
            } else if (!product_length.equalsIgnoreCase("") && !product_width.equalsIgnoreCase("") && !product_height.equalsIgnoreCase("")) {
                query = "select * from Product where company_name=? and product_type=? and product_length=? and product_width=? and product_height=?";
            }

            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, Company_name);
            st.setString(2, Product_type);

            if (product_length.equalsIgnoreCase("") && !product_width.equalsIgnoreCase("") && !product_height.equalsIgnoreCase("")) {

                st.setDouble(3, Double.parseDouble(product_width));
                st.setDouble(4, Double.parseDouble(product_height));
            } else if (!product_length.equalsIgnoreCase("") && product_width.equalsIgnoreCase("") && !product_height.equalsIgnoreCase("")) {

                st.setDouble(3, Double.parseDouble(product_length));
                st.setDouble(4, Double.parseDouble(product_height));
            } else if (!product_length.equalsIgnoreCase("") && !product_width.equalsIgnoreCase("") && product_height.equalsIgnoreCase("")) {

                st.setDouble(3, Double.parseDouble(product_length));
                st.setDouble(4, Double.parseDouble(product_width));
            } else if (!product_length.equalsIgnoreCase("") && product_width.equalsIgnoreCase("") && product_height.equalsIgnoreCase("")) {

                st.setDouble(3, Double.parseDouble(product_length));

            } else if (product_length.equalsIgnoreCase("") && !product_width.equalsIgnoreCase("") && product_height.equalsIgnoreCase("")) {

                st.setDouble(3, Double.parseDouble(product_width));
            } else if (product_length.equalsIgnoreCase("") && product_width.equalsIgnoreCase("") && !product_height.equalsIgnoreCase("")) {

                st.setDouble(3, Double.parseDouble(product_height));
            } else if (!product_length.equalsIgnoreCase("") && !product_width.equalsIgnoreCase("") && !product_height.equalsIgnoreCase("")) {

                st.setDouble(3, Double.parseDouble(product_length));
                st.setDouble(4, Double.parseDouble(product_width));
                st.setDouble(5, Double.parseDouble(product_height));
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();

                product.setProduct_code(rs.getInt(1));
                product.setProduct_name(rs.getString(2));
                product.setProduct_alias(rs.getString(4));
                product.setCompany_name(rs.getString(5));
                product.setCompany_code(rs.getString(6));
                product.setPly(rs.getInt(7));
                product.setProduct_length(rs.getDouble(8));
                product.setProduct_width(rs.getDouble(9));
                product.setProduct_height(rs.getDouble(10));
                product.setProduct_decal_type(rs.getString(11));
                product.setProduct_scale(rs.getString(12));
                product.setProduct_unit_price(rs.getDouble(13));
                product.setProduct_type(rs.getString(14));
                product.setProduct_flute_percentage(rs.getInt(15));
                product.setProduct_decal(rs.getInt(16));
                product.setProduct_sheet_size(rs.getInt(17));
                product.setProduct_total_gsm(rs.getDouble(18));
                product.setProduct_total_weight(rs.getDouble(19));

                ArrayList<Integer> p_gsm = new ArrayList<Integer>();
                ArrayList<String> p_kraft = new ArrayList<String>();
                ArrayList<Integer> p_bf = new ArrayList<Integer>();
                for (int i = 21; i < 30; i++) {
                    p_gsm.add(rs.getInt(i));
                }
                for (int i = 30; i < 39; i++) {
                    p_kraft.add(rs.getString(i));
                }
                for (int i = 39; i < 48; i++) {
                    p_bf.add(rs.getInt(i));
                }

                product.setP_gsm(p_gsm);
                product.setP_kraft(p_kraft);
                product.setP_bf(p_bf);
                product.setP_bs(rs.getDouble(48));

                list.add(product);
            }
        } catch (Exception ex) {
            System.out.println("DBManager - getAllProducts - " + ex);
        }
        return list;
    }

    

    //Functions related to Login and Registration
    public static boolean loginUser(String userName, String passwd) {
        boolean flag = false;
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("select * from User_Account where User_name=? and Pass_word=?");
            st.setString(1, userName);
            st.setString(2, passwd);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("DBManager - loginUser - " + ex);
            System.out.print("Error getting product name..." + ex.toString());
        }
        return flag;
    }

   
    
    //FUNCTIONS RELATED TO PURCHASE ORDER...
    public static ArrayList<String> GetProductNamesFromCompanyName(String Company_name) {
        ArrayList<String> list = new ArrayList<String>();
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("select product_name from Product where company_name=?");
            st.setString(1, Company_name);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String productname = rs.getString("product_name");
                list.add(productname);
            }
            for (String p : list) {
            }
        } catch (Exception ex) {
            System.out.println("DBManager - getProductNamesFromCompanyName - " + ex);
        }
        return list;
    }
    
    public static void insertPurchaseOrder(PurchaseOrder po) {
        //  boolean flag = false;

        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
           
            String qry = "INSERT INTO Purchase_Order(po_number,company_name,po_date,po_status) VALUES(?,?,?,?) ";

            java.sql.PreparedStatement st = con.prepareStatement(qry);
            st.setInt(1, po.getPoNumber());
            st.setString(2, po.getCompany());
            st.setString(3, po.getPoDate());
            st.setString(4, po.getStatus());
           

            st.executeUpdate();
            
            for(int i=0;i<po.getProductName().size();i++)
            {
                String qry1 = "Insert into Po_To_Product(po_number,product_code,order_quantity) values(?,(select product_code from Product where product_name='"+po.getProductName().get(i)+"'),?)";
                PreparedStatement st1 = con.prepareStatement(qry1);
                st1.setInt(1, po.getPoNumber());
              
                st1.setInt(2, po.getProductQuantity().get(i));
                st1.executeUpdate();
                
               // "Select product_code from Product order by product_code DESC LIMIT 1"
                
                String qry4 = "Select po_to_product_id from Po_To_Product order by po_to_product_id DESC LIMIT 1";
                
                PreparedStatement st5 = con.prepareStatement(qry4);
                ResultSet rs = st5.executeQuery();
                int po_to_product_code =0;
                if(rs.next())
                {
                    po_to_product_code = rs.getInt(1);
                }
                
                String qry5 = "Insert Into Dispatch(dispatched_quantity,dispatch_date,po_to_product_id,dispatch_status,remaining_quantity) values('0','null',?,'remaining',?)";
                PreparedStatement st6 = con.prepareStatement(qry5);
                st6.setInt(1, po_to_product_code);
                st6.setInt(2, po.getProductQuantity().get(i) );
                st6.executeUpdate();
                
            }   
                for(int i=0;i<po.getProductName().size();i++)
            {
                String qry2 = "Update Product set product_unit_price='"+po.getProductRate().get(i)+"' where product_name='"+po.getProductName().get(i)+"'";
            
                PreparedStatement st2 = con.prepareStatement(qry2);
                st2.executeUpdate();
                
            }
            
           /*  for(int i=0;i<po.getProductName().size();i++)
            {
                String qry3 = "";
            
                PreparedStatement st2 = con.prepareStatement(qry2);
                st2.executeUpdate();
                
            }
         */

           
        } catch (Exception ex) {
            System.out.println("DBManager - insertPurchaseOrder - " + ex);
        }
        // return flag;
    }
    
    public static ArrayList<PurchaseOrder> SearchPurchaseOrderPending(String Company_name) {
        ArrayList<PurchaseOrder> list = new ArrayList<PurchaseOrder>();
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("select * from Purchase_Order where company_name=? and po_status='Pending'");
            st.setString(1, Company_name);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                
                PurchaseOrder po = new PurchaseOrder();
                
                po.setPoNumber(rs.getInt(1));
                po.setCompany(rs.getString(2));
                po.setPoDate(rs.getString(3));
                
                
                
                list.add(po);
            }
        } catch (Exception ex) {
            System.out.println("DBManager - getAllProducts - " + ex);
        }
        return list;
    }
    
     public static boolean movePoPendingToAll(int poNumber) {
        boolean flag = false;
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("Update Purchase_Order set po_status='Completed' where po_number=?");
            st.setInt(1, poNumber);
            st.executeUpdate();
            flag = true;
        } catch (Exception ex) {
            System.out.println("DBManager - movePoPendingToAll - " + ex);
        }
        return flag;
    }
     
     public static boolean movePoAllToPending(int poNumber) {
        boolean flag = false;
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("Update Purchase_Order set po_status='Pending' where po_number=?");
            st.setInt(1, poNumber);
            st.executeUpdate();
            flag = true;
        } catch (Exception ex) {
            System.out.println("DBManager - movePoPendingToAll - " + ex);
        }
        return flag;
    }
     
     public static ArrayList<PurchaseOrder> SearchPurchaseOrderAll(String Company_name) {
        ArrayList<PurchaseOrder> list = new ArrayList<PurchaseOrder>();
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("select * from Purchase_Order where company_name=? ");
            st.setString(1, Company_name);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                
                PurchaseOrder po = new PurchaseOrder();
                
                po.setPoNumber(rs.getInt(1));
                po.setCompany(rs.getString(2));
                po.setPoDate(rs.getString(3));
                po.setStatus(rs.getString(4));
                
                
                list.add(po);
            }
        } catch (Exception ex) {
            System.out.println("DBManager - getAllProducts - " + ex);
        }
        return list;
    }
     
     public static PurchaseOrder getPurchaseOrderDetails(int poNumber) {
        PurchaseOrder po = new PurchaseOrder();
        po.setPoNumber(poNumber);
        ArrayList<String> productName = new ArrayList<>();
        ArrayList<Integer> productQty = new ArrayList<>();
        ArrayList<Double> productRate = new ArrayList<>();
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);)
        {
            PreparedStatement st = con.prepareStatement("select product_name,order_quantity,product_unit_price,Purchase_Order.company_name,po_date,po_status from Product,Po_To_Product,Purchase_Order where Product.product_code = Po_To_Product.product_code and Po_To_Product.po_number=? and Purchase_Order.po_number = Po_To_Product.po_number");
            st.setInt(1, poNumber);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) 
            {
                po.setCompany(rs.getString("company_name"));
                po.setPoDate(rs.getString("po_date"));
                po.setStatus(rs.getString("po_status"));
                
                productName.add(rs.getString("product_name"));
                productQty.add(rs.getInt("order_quantity"));
                productRate.add(rs.getDouble("product_unit_price"));
                
                
            }
            po.setProductName(productName);
            po.setProductQuantity(productQty);
            po.setProductRate(productRate);
            
        } catch (Exception ex) {
            System.out.println("DBManager - getAllProducts - " + ex);
        }
        return po;
    }
     
    /* public static Dispatch getDispatchDetails(int poNumber, int productCode,int orderQuantity ) {
        Dispatch dispatch = new Dispatch();
        
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);)
        {
            PreparedStatement st = con.prepareStatement("select dispatch_id,dispatched_quantity,remaining_quantity,dispatch_date,dispatch_status,po_to_product_id from Dispatch where po_to_product_id=(select po_to_product_id from Po_To_Product where product_code='"+productCode+"' and po_number='"+poNumber+"' and order_quantity='"+orderQuantity+"')");
            
            
            ResultSet rs = st.executeQuery();
            if (rs.next()) 
            {
              dispatch.setDispatchId(rs.getInt("dispatch_id"));
              dispatch.setDispatchedQuantity(rs.getInt("dispatched_quantity"));
              dispatch.setRemainingQuantity(rs.getInt("remaining_quantity"));
              dispatch.setDispatchDate(rs.getString("dispatch_date"));
              dispatch.setDispatchStatus(rs.getString("dispatch_status"));
              dispatch.setPoToProductId(rs.getInt("po_to_product_id"));
                
                
            }
           
            
        } catch (Exception ex) {
            System.out.println("DBManager - getAllProducts - " + ex);
        }
        return dispatch;
    }
*/
     public static int getDispatchedQuantity(int poNumber, String productName,String company ) {
        
        int qty =0;
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);)
        {
            PreparedStatement st = con.prepareStatement("select dispatched_quantity from Dispatch where po_to_product_id=(select po_to_product_id from Po_To_Product where po_number=? and product_code=(select product_code from Product where product_name =?) )");
            st.setInt(1, poNumber);
            st.setString(2, productName);
            
            ResultSet rs = st.executeQuery();
            if (rs.next()) 
            {
              qty = rs.getInt(1);
                
            }
           
            
        } catch (Exception ex) {
            System.out.println("DBManager - getAllProducts - " + ex);
        }
        return qty;
    }
     
     public static int getRemainingQuantity(int poNumber, String productName,String company ) {
        
        int qty =0;
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);)
        {
            PreparedStatement st = con.prepareStatement("select remaining_quantity from Dispatch where po_to_product_id=(select po_to_product_id from Po_To_Product where po_number=? and product_code=(select product_code from Product where product_name =?) )");
            st.setInt(1, poNumber);
            st.setString(2, productName);
            
            ResultSet rs = st.executeQuery();
            if (rs.next()) 
            {
              qty = rs.getInt(1);
                
            }
           
            
        } catch (Exception ex) {
            System.out.println("DBManager - getAllProducts - " + ex);
        }
        return qty;
    }
     
     public static ArrayList<Integer> getPoNumberFromProductCode(int productCode) {
        
        ArrayList<Integer> poNumbers = new ArrayList<>();
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);)
        {
            PreparedStatement st = con.prepareStatement("select po_number from Po_To_Product where product_code=?");
            st.setInt(1, productCode);
           
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) 
            {
              poNumbers.add(rs.getInt(1));
                
            }
           
            
        } catch (Exception ex) {
            System.out.println("DBManager - getAllProducts - " + ex);
        }
        return poNumbers;
    }
     
     public static int getTotalQuantityFromProductCode(int productCode) {
        
        int totalqty=0;
        
        ArrayList<Integer> qty = new ArrayList<>();
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);)
        {
            PreparedStatement st = con.prepareStatement("select order_quantity from Po_To_Product where product_code=?");
            st.setInt(1, productCode);
           
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) 
            {
              qty.add(rs.getInt("order_quantity"));
                
            }
            
            for(int value : qty)
            {
               totalqty=totalqty + value; 
            }
           
            
        } catch (Exception ex) {
            System.out.println("DBManager - getAllProducts - " + ex);
        }
        return totalqty;
    }
     
     public static int getDispatchedQuantityFromProductCode(int productCode) {
        
        int totalqty=0;
        
        ArrayList<Integer> qty = new ArrayList<>();
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);)
        {
            PreparedStatement st = con.prepareStatement("select po_to_product_id from Po_To_Product where product_code=?");
            st.setInt(1, productCode);
           
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) 
            {
              
              PreparedStatement st1 = con.prepareStatement("Select dispatched_quantity from Dispatch where po_to_product_id='"+rs.getInt("po_to_product_id")+"'");
              ResultSet rs1 = st1.executeQuery();
              
              while(rs1.next())
              {
                  totalqty = totalqty + rs1.getInt("dispatched_quantity");
              }
              
            }
            
            
           
            
        } catch (Exception ex) {
            System.out.println("DBManager - getAllProducts - " + ex);
        }
        return totalqty;
    }
     
     public static int getRemainingQuantityFromProductCode(int productCode) {
        
        int totalqty=0;
        
        ArrayList<Integer> qty = new ArrayList<>();
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);)
        {
            PreparedStatement st = con.prepareStatement("select po_to_product_id from Po_To_Product where product_code=?");
            st.setInt(1, productCode);
           
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) 
            {
              
              PreparedStatement st1 = con.prepareStatement("Select remaining_quantity from Dispatch where po_to_product_id='"+rs.getInt("po_to_product_id")+"'");
              ResultSet rs1 = st1.executeQuery();
              
              while(rs1.next())
              {
                  totalqty = totalqty + rs1.getInt("remaining_quantity");
              }
              
            }
            
            
           
            
        } catch (Exception ex) {
            System.out.println("DBManager - getAllProducts - " + ex);
        }
        return totalqty;
    }
     


//*********Methods related to Reel Stock

public static void insertStock(Stock stock) {
       

        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            String qry = "INSERT INTO Stock(reel_size,reel_type,mill,bf,paper_type,reel_weight) Values(?,?,?,?,?,?)";

            java.sql.PreparedStatement st1 = con.prepareStatement(qry);

            st1.setDouble(1, stock.getReelSize());
            st1.setInt(2, stock.getReelType());
            st1.setString(3, stock.getMill());
            st1.setInt(4, stock.getBf());
            st1.setString(5, stock.getPaperType());
            st1.setDouble(6, stock.getReelWeight());
            

            st1.executeUpdate();

            
        } catch (Exception ex) {
            System.out.println("DBManager - insertProduct - " + ex);
        }
        
    }

public static ArrayList<Stock> getAllStock() {
        ArrayList<Stock> list = new ArrayList<Stock>();
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("select * from Stock");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
               Stock s = new Stock();

                s.setReelNumber(rs.getInt(1));
                s.setReelSize(rs.getDouble(2));
                s.setReelType(rs.getInt(3));
                s.setMill(rs.getString(4));
                s.setBf(rs.getInt(5));
                s.setPaperType(rs.getString(6));
                s.setReelWeight(rs.getDouble(7));

                list.add(s);
            }
        } catch (Exception ex) {
            System.out.println("DBManager - getAllStock - " + ex);
        }
        return list;
    }

 public static void deleteStock(int reelNumber) {
        //boolean flag = false;
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("delete from Stock where reel_number=?");
            st.setInt(1, reelNumber);
            st.executeUpdate();
           // flag = true;
        } catch (Exception ex) {
            System.out.println("DBManager - deleteStock - " + ex);
        }
        //return flag;
    }
 
  public static Stock findStock(int reelNumber) {
        Stock stock = null;
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("select * from Stock where reel_number=?");
            st.setInt(1, reelNumber);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                stock = new Stock();
                
                stock.setReelNumber(rs.getInt(1));
                stock.setReelSize(rs.getDouble(2));
                stock.setReelType(rs.getInt(3));
                stock.setMill(rs.getString(4));
                stock.setBf(rs.getInt(5));
                stock.setPaperType(rs.getString(6));
                stock.setReelWeight(rs.getDouble(7));
                

            }
        } catch (Exception ex) {
            System.out.println("DBManager - findProduct - " + ex);
        }
        return stock;
    }

    public static void updateStock(Stock stock) {
        
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {

            String qry = "UPDATE Stock SET reel_size=?, reel_type=?, mill=?, bf=?, paper_type=?, reel_weight=? where reel_number=?";

            PreparedStatement st1 = con.prepareStatement(qry);

            st1.setDouble(1, stock.getReelSize());
            st1.setInt(2, stock.getReelType());
            st1.setString(3, stock.getMill());
            st1.setInt(4, stock.getBf());
            st1.setString(5, stock.getPaperType());
            st1.setDouble(6, stock.getReelWeight());
            st1.setInt(7, stock.getReelNumber());

            st1.executeUpdate();
            
        } catch (Exception ex) {
            System.out.println("DBManager - UpdateStock - " + ex);
        }
        
    }
    
    public static int GetDecalFromProduct(String productName) {
        int decal=0;
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("select product_decal from Product where product_name=?");
            st.setString(1, productName);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                 decal = rs.getInt("product_decal");
                
            }
            
        } catch (Exception ex) {
            System.out.println("DBManager - GetDecalFromProduct - " + ex);
        }
        return decal;
    }
    public static int GetSheetSizeFromProduct(String productName) {
        int sheetSize=0;
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("select product_sheet_size from Product where product_name=?");
            st.setString(1, productName);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                 sheetSize = rs.getInt("product_sheet_size");
                
            }
            
        } catch (Exception ex) {
            System.out.println("DBManager - GetSheetSizeFromProduct - " + ex);
        }
        return sheetSize;
    }
    
    public static ArrayList<Integer> GetGsmFromProduct(String productName) {
        ArrayList<Integer> list = new ArrayList<Integer>();
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("select p_gsm1,p_gsm2,p_gsm3,p_gsm4,p_gsm5,p_gsm6,p_gsm7,p_gsm8,p_gsm9 from Product where product_name=?");
            st.setString(1, productName);
            ResultSet rs = st.executeQuery();

           if(rs.next()) {
                
                list.add(rs.getInt("p_gsm1"));
                list.add(rs.getInt("p_gsm2"));
                list.add(rs.getInt("p_gsm3"));
                list.add(rs.getInt("p_gsm4"));
                list.add(rs.getInt("p_gsm5"));
                list.add(rs.getInt("p_gsm6"));
                list.add(rs.getInt("p_gsm7"));
                list.add(rs.getInt("p_gsm8"));
                list.add(rs.getInt("p_gsm9"));
            }
            
        } catch (Exception ex) {
            System.out.println("DBManager - GetGsmFromProduct - " + ex);
        }
        return list;
    }
    
    public static ArrayList<Integer> GetBfFromProduct(String productName) {
        ArrayList<Integer> list = new ArrayList<Integer>();
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("select p_bf1,p_bf2,p_bf3,p_bf4,p_bf5,p_bf6,p_bf7,p_bf8,p_bf9 from Product where product_name=?");
            st.setString(1, productName);
            ResultSet rs = st.executeQuery();

           if(rs.next()) {
                
                list.add(rs.getInt("p_bf1"));
                list.add(rs.getInt("p_bf2"));
                list.add(rs.getInt("p_bf3"));
                list.add(rs.getInt("p_bf4"));
                list.add(rs.getInt("p_bf5"));
                list.add(rs.getInt("p_bf6"));
                list.add(rs.getInt("p_bf7"));
                list.add(rs.getInt("p_bf8"));
                list.add(rs.getInt("p_bf9"));
            }
            
        } catch (Exception ex) {
            System.out.println("DBManager - GetBfFromProduct - " + ex);
        }
        return list;
    }
    
    public static ArrayList<String> GetPaperTypeFromProduct(String productName) {
        ArrayList<String> list = new ArrayList<String>();
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("select p_kraft1,p_kraft2,p_kraft3,p_kraft4,p_kraft5,p_kraft6,p_kraft7,p_kraft8,p_kraft9 from Product where product_name=?");
            st.setString(1, productName);
            ResultSet rs = st.executeQuery();

           if(rs.next()) {
                
                list.add(rs.getString("p_kraft1"));
                list.add(rs.getString("p_kraft2"));
                list.add(rs.getString("p_kraft3"));
                list.add(rs.getString("p_kraft4"));
                list.add(rs.getString("p_kraft5"));
                list.add(rs.getString("p_kraft6"));
                list.add(rs.getString("p_kraft7"));
                list.add(rs.getString("p_kraft8"));
                list.add(rs.getString("p_kraft9"));
            }
            
        } catch (Exception ex) {
            System.out.println("DBManager - GetPaperTypeFromProduct - " + ex);
        }
        return list;
    }
    
    public static void insertIssuedReel(String productName, String IssueDate, double wastage, int quantity, String reels) {
       

        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            String qry = "INSERT INTO Issued(date_issued, product_name, reel_number, wastage, quantity) Values(?,?,?,?,?)";

            java.sql.PreparedStatement st1 = con.prepareStatement(qry);

            st1.setString(1, IssueDate);
            st1.setString(2, productName);
            st1.setString(3, reels);
            st1.setDouble(4, wastage);
            st1.setInt(5, quantity);
            
            

            st1.executeUpdate();

            
        } catch (Exception ex) {
            System.out.println("DBManager - insertIssuedReel - " + ex);
        }
        
    }
    
    public static ArrayList<IssuedReels> getAllIssuedReels() {
        ArrayList<IssuedReels> list = new ArrayList<IssuedReels>();
        try (Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);) {
            PreparedStatement st = con.prepareStatement("select * from Issued");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
               IssuedReels issue = new IssuedReels();

                issue.setIssueDate(rs.getString(2));
                issue.setProductName(rs.getString(3));
                issue.setReelNumber(rs.getString(4));
                issue.setWastage(rs.getDouble(5));
                issue.setQuantity(rs.getInt(6));
                

                list.add(issue);
            }
        } catch (Exception ex) {
            System.out.println("DBManager - getAllIssuedReels - " + ex);
        }
        return list;
    }
}