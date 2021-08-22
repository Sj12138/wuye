package cn.com.wy.entity;

import java.sql.Date;

/**
 * 缴费记录实体类
 */
public class PayRecords {
    private int prcId;
    private Date prcDate;
    private String prcRemark; //备注
    private int pfId;

    public int getPfId() {
        return pfId;
    }

    public void setPfId(int pfId) {
        this.pfId = pfId;
    }

    public int getPrcId() {
        return prcId;
    }

    public void setPrcId(int prcId) {
        this.prcId = prcId;
    }

    public Date getPrcDate() {
        return prcDate;
    }

    public void setPrcDate(Date prcDate) {
        this.prcDate = prcDate;
    }

    public String getPrcRemark() {
        return prcRemark;
    }

    public void setPrcRemark(String prcRemark) {
        this.prcRemark = prcRemark;
    }

    @Override
    public String toString() {
        return "PayRecords{" +
                "prcId=" + prcId +
                ", prcDate=" + prcDate +
                ", prcRemark='" + prcRemark + '\'' +
                ", pfId=" + pfId +
                '}';
    }
}
