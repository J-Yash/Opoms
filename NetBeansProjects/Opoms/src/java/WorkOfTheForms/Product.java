/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WorkOfTheForms;

import java.util.ArrayList;

/**
 *
 * @author yash
 */
public class Product 
{
   //public static int product_code = 1;
    int product_code;
    String product_name;
    String product_alias;
    String company_name;
    String company_code;
    int ply;
    double product_length;
    double product_width;
    double product_height;
    String product_decal_type;
    String product_scale;
    double product_unit_price;
    String product_type;
    int product_flute_percentage;
    int product_decal;
    int product_sheet_size;
    double product_total_gsm;
    double product_total_weight;
    double p_bs;
    ArrayList<Integer> p_gsm ;
    ArrayList<String> p_kraft;
    ArrayList<Integer> p_bf;
    String photo;

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public int getProduct_code() {
        return product_code;
    }

    public void setProduct_code(int product_code) {
        this.product_code = product_code;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_alias() {
        return product_alias;
    }

    public void setProduct_alias(String product_alias) {
        this.product_alias = product_alias;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getCompany_code() {
        return company_code;
    }

    public void setCompany_code(String company_code) {
        this.company_code = company_code;
    }

    public int getPly() {
        return ply;
    }

    public void setPly(int ply) {
        this.ply = ply;
    }

    public double getProduct_length() {
        return product_length;
    }

    public void setProduct_length(double product_length) {
        this.product_length = product_length;
    }

    public double getProduct_width() {
        return product_width;
    }

    public void setProduct_width(double product_width) {
        this.product_width = product_width;
    }

    public double getProduct_height() {
        return product_height;
    }

    public void setProduct_height(double product_height) {
        this.product_height = product_height;
    }

    public String getProduct_decal_type() {
        return product_decal_type;
    }

    public void setProduct_decal_type(String product_decal_type) {
        this.product_decal_type = product_decal_type;
    }

    public String getProduct_scale() {
        return product_scale;
    }

    public void setProduct_scale(String product_scale) {
        this.product_scale = product_scale;
    }

    public double getProduct_unit_price() {
        return product_unit_price;
    }

    public void setProduct_unit_price(double product_unit_price) {
        this.product_unit_price = product_unit_price;
    }

    public String getProduct_type() {
        return product_type;
    }

    public void setProduct_type(String product_type) {
        this.product_type = product_type;
    }

    public int getProduct_flute_percentage() {
        return product_flute_percentage;
    }

    public void setProduct_flute_percentage(int product_flute_percentage) {
        this.product_flute_percentage = product_flute_percentage;
    }

    public int getProduct_decal() {
        return product_decal;
    }

    public void setProduct_decal(int product_decal) {
        this.product_decal = product_decal;
    }

    public int getProduct_sheet_size() {
        return product_sheet_size;
    }

    public void setProduct_sheet_size(int product_sheet_size) {
        this.product_sheet_size = product_sheet_size;
    }

    public double getProduct_total_gsm() {
        return product_total_gsm;
    }

    public void setProduct_total_gsm(double product_total_gsm) {
        this.product_total_gsm = product_total_gsm;
    }

    public double getProduct_total_weight() {
        return product_total_weight;
    }

    public void setProduct_total_weight(double product_total_weight) {
        this.product_total_weight = product_total_weight;
    }

    public double getP_bs() {
        return p_bs;
    }

    public void setP_bs(double p_bs) {
        this.p_bs = p_bs;
    }

    public ArrayList<Integer> getP_gsm() {
        return p_gsm;
    }

    public void setP_gsm(ArrayList<Integer> p_gsm) {
        this.p_gsm = p_gsm;
    }

    public ArrayList<String> getP_kraft() {
        return p_kraft;
    }

    public void setP_kraft(ArrayList<String> p_kraft) {
        this.p_kraft = p_kraft;
    }

    public ArrayList<Integer> getP_bf() {
        return p_bf;
    }

    public void setP_bf(ArrayList<Integer> p_bf) {
        this.p_bf = p_bf;
    }
    

    public Product(int product_code, String product_name, String product_alias, String company_name, String company_code, int ply, double product_length, double product_width, double product_height, String product_decal_type, String product_scale, double product_unit_price, String product_type, int product_flute_percentage, int product_decal, int product_sheet_size, double product_total_gsm, double product_total_weight, double p_bs, ArrayList<Integer> p_gsm, ArrayList<String> p_kraft, ArrayList<Integer> p_bf, String photo) {
        this.product_code = product_code;
        this.product_name = product_name;
        this.product_alias = product_alias;
        this.company_name = company_name;
        this.company_code = company_code;
        this.ply = ply;
        this.product_length = product_length;
        this.product_width = product_width;
        this.product_height = product_height;
        this.product_decal_type = product_decal_type;
        this.product_scale = product_scale;
        this.product_unit_price = product_unit_price;
        this.product_type = product_type;
        this.product_flute_percentage = product_flute_percentage;
        this.product_decal = product_decal;
        this.product_sheet_size = product_sheet_size;
        this.product_total_gsm = product_total_gsm;
        this.product_total_weight = product_total_weight;
        this.p_bs = p_bs;
        this.p_gsm = p_gsm;
        this.p_kraft = p_kraft;
        this.p_bf = p_bf;
        this.photo = photo;
    }

    public Product() {
    }
    
    
}
