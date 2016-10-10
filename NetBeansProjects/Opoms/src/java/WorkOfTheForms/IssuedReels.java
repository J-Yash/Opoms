
package WorkOfTheForms;


public class IssuedReels
{
    
    int issueId;
    String issueDate;
    String ProductName;
    String reelNumber;
    double wastage;
    int quantity;

    public int getIssueId() {
        return issueId;
    }

    public void setIssueId(int issueId) {
        this.issueId = issueId;
    }

    public String getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(String issueDate) {
        this.issueDate = issueDate;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public String getReelNumber() {
        return reelNumber;
    }

    public void setReelNumber(String reelNumber) {
        this.reelNumber = reelNumber;
    }

    public double getWastage() {
        return wastage;
    }

    public void setWastage(double wastage) {
        this.wastage = wastage;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public IssuedReels(int issueId, String issueDate, String ProductName, String reelNumber, double wastage, int quantity) {
        this.issueId = issueId;
        this.issueDate = issueDate;
        this.ProductName = ProductName;
        this.reelNumber = reelNumber;
        this.wastage = wastage;
        this.quantity = quantity;
    }
    
    public IssuedReels(String issueDate, String ProductName, String reelNumber, double wastage, int quantity) {
        
        this.issueDate = issueDate;
        this.ProductName = ProductName;
        this.reelNumber = reelNumber;
        this.wastage = wastage;
        this.quantity = quantity;
    }

    public IssuedReels() {
    }
    
    
}
