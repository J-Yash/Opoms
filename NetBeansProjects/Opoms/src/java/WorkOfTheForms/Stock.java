
package WorkOfTheForms;


public class Stock 
{
    int reelNumber;
    double reelSize;
    int reelType;
    String mill;
    int bf;
    String paperType;
    double reelWeight;

    public Stock() {
    }

    public int getReelNumber() {
        return reelNumber;
    }

    public void setReelNumber(int reelNumber) {
        this.reelNumber = reelNumber;
    }

    public double getReelSize() {
        return reelSize;
    }

    public void setReelSize(double reelSize) {
        this.reelSize = reelSize;
    }

    public int getReelType() {
        return reelType;
    }

    public void setReelType(int reelType) {
        this.reelType = reelType;
    }

    public String getMill() {
        return mill;
    }

    public void setMill(String mill) {
        this.mill = mill;
    }

    public int getBf() {
        return bf;
    }

    public void setBf(int bf) {
        this.bf = bf;
    }

    public String getPaperType() {
        return paperType;
    }

    public void setPaperType(String paperType) {
        this.paperType = paperType;
    }

    public double getReelWeight() {
        return reelWeight;
    }

    public void setReelWeight(double reelWeight) {
        this.reelWeight = reelWeight;
    }

    public Stock(int reelNumber, double reelSize, int reelType, String mill, int bf, String paperType, double reelWeight) {
        this.reelNumber = reelNumber;
        this.reelSize = reelSize;
        this.reelType = reelType;
        this.mill = mill;
        this.bf = bf;
        this.paperType = paperType;
        this.reelWeight = reelWeight;
    }

    public Stock(double reelSize, int reelType, String mill, int bf, String paperType, double reelWeight) {
        this.reelSize = reelSize;
        this.reelType = reelType;
        this.mill = mill;
        this.bf = bf;
        this.paperType = paperType;
        this.reelWeight = reelWeight;
    }

   
    
    
}
