
package WorkOfTheForms;

import java.util.ArrayList;
import java.util.Date;


public class PurchaseOrder
{
    int poNumber;
    String poDate;
    String Company;
    String status;
    ArrayList<String> productName;
    ArrayList<Integer> productQuantity;
    ArrayList<Double> productRate;

    public int getPoNumber() {
        return poNumber;
    }

    public void setPoNumber(int poNumber) {
        this.poNumber = poNumber;
    }

    public String getPoDate() {
        return poDate;
    }

    public void setPoDate(String poDate) {
        this.poDate = poDate;
    }

    public String getCompany() {
        return Company;
    }

    public void setCompany(String Company) {
        this.Company = Company;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public ArrayList<String> getProductName() {
        return productName;
    }

    public void setProductName(ArrayList<String> productName) {
        this.productName = productName;
    }

    public ArrayList<Integer> getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(ArrayList<Integer> productQuantity) {
        this.productQuantity = productQuantity;
    }

    public ArrayList<Double> getProductRate() {
        return productRate;
    }

    public void setProductRate(ArrayList<Double> productRate) {
        this.productRate = productRate;
    }

    public PurchaseOrder() {
    }

    public PurchaseOrder(int poNumber, String poDate, String Company, String status, ArrayList<String> productName, ArrayList<Integer> productQuantity, ArrayList<Double> productRate) {
        this.poNumber = poNumber;
        this.poDate = poDate;
        this.Company = Company;
        this.status = status;
        this.productName = productName;
        this.productQuantity = productQuantity;
        this.productRate = productRate;
    }
    
}
