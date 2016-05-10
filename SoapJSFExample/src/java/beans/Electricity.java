/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package beans;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;
import javax.xml.ws.WebServiceRef;
import service.ProcessPayment_Service;

/**
 *
 * @author jnjeru
 */
@ManagedBean
@SessionScoped
public class Electricity {
    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/ProcessPayment/ProcessPayment.wsdl")
    private ProcessPayment_Service service;    
    
    String meterNumber ="";
    String rValue = "";
    String accAndDebt = "";

    /**
     * Creates a new instance of Electricity
     */
    public Electricity() {
    }

    public String getMeterNumber() {
        return meterNumber;
    }

    public void setMeterNumber(String meterNumber) {
        this.meterNumber = meterNumber;
    }    

    public String getrValue() {
        return rValue;
    }

    public void setrValue(String rValue) {
        this.rValue = rValue;
    } 

    public String getAccAndDebt() {
        return accAndDebt;
    }

    public void setAccAndDebt(String accAndDebt) {
        this.accAndDebt = accAndDebt;
    }
            
    public String submit(){
        
        String returnedValue = "";
        returnedValue = checkAccountAndDebt(this.meterNumber);
        System.out.println("Account Details : "+returnedValue);
        rValue = returnedValue;
        this.accAndDebt = rValue;
        return "result.xhtml?faces-redirect=true";
    }

    private String checkAccountAndDebt(java.lang.String meterNumber) {
        
        service.ProcessPayment port = service.getProcessPaymentPort();
        return port.checkAccountAndDebt(meterNumber);
    }  
    
}
