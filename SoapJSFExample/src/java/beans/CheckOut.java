package beans;

import entities.Product;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.PostActivate;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;

/**
 *
 * @author jnjeru
 */
@ManagedBean
@SessionScoped
public class CheckOut implements Serializable {

    Product product;
    List<Product> pList = new ArrayList<Product>();
    String message;    
    
    String name;
    int quantity;
    double amount;
    double discount;
    
    

    /**
     * Creates a new instance of CheckOut
     */
    //All managed beans have to hava a zero arg constructor
    public CheckOut() {
    }

//    @PostActivate
//    public List<Product> loadProducts(){
//        
//    }
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = /*message*/ "Payment Received";
    }

    @PostConstruct
    public void getpList() {
        List<Product> ps = new ArrayList<>();
        ps.add(new Product("Flask", 3, 999.33, 0.67));
        ps.add(new Product("Coffe Mug", 2, 48.50, 2.35));
        ps.add(new Product("Pen", 5, 100.00, 1.15));
        ps.add(new Product("Polo T-Shirt", 1, 1500.00, 50.00));
        ps.add(new Product("Pizza", 2, 2500, 20.00));
        System.out.println("Products Initialized : Num = : " + ps.size());
        this.pList = ps;        
    }

    public void setpList(List<Product> pList) {
        this.pList = pList;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }      

    public String submit() {
        List<Product> ps = new ArrayList<>();
        double dummyPrice = 20.00,amt,disc;
        Product p = new Product();
        p.setName(this.name);
        p.setQuantity(this.quantity);
        amt = dummyPrice * this.quantity;
        disc = amt * 0.2;
        amt = amt - disc;
        p.setAmount(amt);
        p.setDiscount(disc);  
        ps.add(p);
        this.pList = ps;
        //System.out.println("----working----"+p.getName()+"----working----");        
        return "bootStrapPage?faces-redirect=true";
    }
    
    public List<Product> getProducts(){
        /*List<Product> ps = new ArrayList<>();
        ps.add(new Product("Flask", 3, 999.33, 0.67));
        ps.add(new Product("Coffe Mug", 2, 48.50, 2.35));
        return ps;*/        
        List<Product> ps = new ArrayList<>();
        ps = this.pList;
        return ps;
    }
    
    public String feedBack(){
        
        return "feedback.jsp?faces-redirect=true";
    }

}
