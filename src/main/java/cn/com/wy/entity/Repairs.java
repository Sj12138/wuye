package cn.com.wy.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.sql.Date;

/**
 * 报修记录实体类
 */
public class Repairs {
    private int repId;
    private Date repEndDate; //结束时间

    @Override
    public String toString() {
        return "Repairs{" +
                "repId=" + repId +
                ", repEndDate=" + repEndDate +
                ", repStartDate=" + repStartDate +
                ", repIssue='" + repIssue + '\'' +
                ", repState=" + repState +
                ", repRemark='" + repRemark + '\'' +
                ", head=" + head +
                '}';
    }

    private Date repStartDate;//报修时间
    private String repIssue;  //问题描述
    private int repState; //状态 1:未处理 2:已处理 3:不能处理
    private String repRemark; //不能处理原因
    private Head head;  //业主 1 -- 1

    public int getRepId() {
        return repId;
    }

    public void setRepId(int repId) {
        this.repId = repId;
    }

    public Date getRepEndDate() {
        return repEndDate;
    }

    public void setRepEndDate(Date repEndDate) {
        this.repEndDate = repEndDate;
    }

    public Date getRepStartDate() {
        return repStartDate;
    }

    public void setRepStartDate(Date repStartDate) {
        this.repStartDate = repStartDate;
    }

    public String getRepIssue() {
        return repIssue;
    }

    public void setRepIssue(String repIssue) {
        this.repIssue = repIssue;
    }

    public int getRepState() {
        return repState;
    }

    public void setRepState(int repState) {
        this.repState = repState;
    }

    public String getRepRemark() {
        return repRemark;
    }

    public void setRepRemark(String repRemark) {
        this.repRemark = repRemark;
    }

    public Head getHead() {
        return head;
    }

    public void setHead(Head head) {
        this.head = head;
    }
}
