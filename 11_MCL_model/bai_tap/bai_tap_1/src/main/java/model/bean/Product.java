package model.bean;

public class Product {
    private int id;
    private String nameProduct;
    private double price;
    private String describe;
    private String madeBy;

    public Product() {
    }

    public Product(int id, String nameProduct, double price, String describe, String madeBy) {
        this.id = id;
        this.nameProduct = nameProduct;
        this.price = price;
        this.describe = describe;
        this.madeBy = madeBy;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getMadeBy() {
        return madeBy;
    }

    public void setMadeBy(String madeBy) {
        this.madeBy = madeBy;
    }
}
