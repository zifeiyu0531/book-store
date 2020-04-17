package bean;

public class Book {
    private String title;
    private String author;
    private String publish;
    private String type;
    private String introduction;
    private float price;
    private String imgsrc;
    public void setTitle(String title){
        this.title = title;
    }
    public void setAuthor(String author){
        this.author = author;
    }
    public void setPublish(String publish){
        this.publish = publish;
    }
    public void setType(String type){
        this.type = type;
    }
    public void setIntroduction(String introduction){
        this.introduction = introduction;
    }
    public void setPrice(float price){
        this.price = price;
    }
    public void setImgsrc(String imgsrc){
        this.imgsrc = imgsrc;
    }
    public String getTitle(){
        return this.title;
    }
    public String getAuthor(){
        return this.author;
    }
    public String getPublish(){
        return this.publish;
    }
    public String getType(){
        return this.type;
    }
    public String getIntroduction(){
        return this.introduction;
    }
    public float getPrice(){
        return this.price;
    }
    public String getImgsrc(){
        return this.imgsrc;
    }
    public String getPropertyForTest(){
        return this.title+"\n"+this.author+"\n"+this.publish+"\n"+this.type+"\n"+this.introduction+"\n"+this.price+"\n"+this.imgsrc+"\n";
    }
}
