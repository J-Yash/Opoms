
package WorkOfTheForms;


public class Dispatch
{

    int dispatchId;
    int dispatchedQuantity;
    int remainingQuantity;
    String dispatchDate;
    int poToProductId;
    String dispatchStatus;

    public Dispatch() {
    }

    public int getDispatchId() {
        return dispatchId;
    }

    public void setDispatchId(int dispatchId) {
        this.dispatchId = dispatchId;
    }

    public int getDispatchedQuantity() {
        return dispatchedQuantity;
    }

    public void setDispatchedQuantity(int dispatchedQuantity) {
        this.dispatchedQuantity = dispatchedQuantity;
    }

    public int getRemainingQuantity() {
        return remainingQuantity;
    }

    public void setRemainingQuantity(int remainingQuantity) {
        this.remainingQuantity = remainingQuantity;
    }

    public String getDispatchDate() {
        return dispatchDate;
    }

    public void setDispatchDate(String dispatchDate) {
        this.dispatchDate = dispatchDate;
    }

    public int getPoToProductId() {
        return poToProductId;
    }

    public void setPoToProductId(int poToProductId) {
        this.poToProductId = poToProductId;
    }

    public String getDispatchStatus() {
        return dispatchStatus;
    }

    public void setDispatchStatus(String dispatchStatus) {
        this.dispatchStatus = dispatchStatus;
    }

    public Dispatch(int dispatchId, int dispatchedQuantity, int remainingQuantity, String dispatchDate, int poToProductId, String dispatchStatus) {
        this.dispatchId = dispatchId;
        this.dispatchedQuantity = dispatchedQuantity;
        this.remainingQuantity = remainingQuantity;
        this.dispatchDate = dispatchDate;
        this.poToProductId = poToProductId;
        this.dispatchStatus = dispatchStatus;
    }
   
}
