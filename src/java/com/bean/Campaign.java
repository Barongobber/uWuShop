/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

/**
 *
 * @author gobib
 */
public class Campaign {
    private String campaignName;
    private String campaignSubject;
    private int totalRec;
    private String blastedDate;
    private String contentEmail;
    private int campaignID;

    public int getCampaignID() {
        return campaignID;
    }

    public void setCampaignID(int campaignID) {
        this.campaignID = campaignID;
    }
    
    public String getCampaignName() {
        return campaignName;
    }

    public void setCampaignName(String campaignName) {
        this.campaignName = campaignName;
    }

    public String getCampaignSubject() {
        return campaignSubject;
    }

    public void setCampaignSubject(String campaignSubject) {
        this.campaignSubject = campaignSubject;
    }

    public int getTotalRec() {
        return totalRec;
    }

    public void setTotalRec(int totalRec) {
        this.totalRec = totalRec;
    }

    public String getBlastedDate() {
        return blastedDate;
    }

    public void setBlastedDate(String blastedDate) {
        this.blastedDate = blastedDate;
    }

    public String getContentEmail() {
        return contentEmail;
    }

    public void setContentEmail(String contentEmail) {
        this.contentEmail = contentEmail;
    }
    
    
    
    
}
