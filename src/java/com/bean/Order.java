/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import java.io.*;

/**
 *
 * @author gobib
 */
public class Order implements Serializable {
    private int orderid;
    private int productid;
    private int price;
    private int qtyOrder;
    private String pymt_method;
    private int shipping_price ;
    private String date;
    private String status;
    private int userid;
    private String productname;
    private String buyer;
    private int adminid;

    public String getBuyer() {
        return buyer;
    }

    public void setBuyer(String buyer) {
        this.buyer = buyer;
    }

    public int getAdminid() {
        return adminid;
    }

    public void setAdminid(int adminid) {
        this.adminid = adminid;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }
    

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQtyOrder() {
        return qtyOrder;
    }

    public void setQtyOrder(int qtyOrder) {
        this.qtyOrder = qtyOrder;
    }

    public String getPymt_method() {
        return pymt_method;
    }

    public void setPymt_method(String pymt_method) {
        this.pymt_method = pymt_method;
    }

    public int getShipping_price() {
        return shipping_price;
    }

    public void setShipping_price(int shipping_price) {
        this.shipping_price = shipping_price;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
    
    
}
