package cn.com.wy.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.sql.Date;

/**
 * 物业费用实体类
 */
public class PropertyFee {
    private int pfId;
    private double pfMoney;
    private int pfState;  //缴费状态 1:未缴费   2:已缴费
    private int pfType;   //缴费类型 1:水费   2:电费   3:物业费
    private Date pfDate;
    private Rud rud;  //房间 1 -- 1

    @Override
    public String toString() {
        return "PropertyFee{" +
                "pfId=" + pfId +
                ", pfMoney=" + pfMoney +
                ", pfState=" + pfState +
                ", pfType=" + pfType +
                ", pfDate=" + pfDate +
                ", rud=" + rud +
                '}';
    }

    public int getPfId() {
        return pfId;
    }

    public void setPfId(int pfId) {
        this.pfId = pfId;
    }

    public double getPfMoney() {
        return pfMoney;
    }

    public void setPfMoney(double pfMoney) {
        this.pfMoney = pfMoney;
    }

    public int getPfState() {
        return pfState;
    }

    public void setPfState(int pfState) {
        this.pfState = pfState;
    }

    public int getPfType() {
        return pfType;
    }

    public void setPfType(int pfType) {
        this.pfType = pfType;
    }

    public Date getPfDate() {
        return pfDate;
    }

    public void setPfDate(Date pfDate) {
        this.pfDate = pfDate;
    }

    public Rud getRud() {
        return rud;
    }

    public void setRud(Rud rud) {
        this.rud = rud;
    }
}
