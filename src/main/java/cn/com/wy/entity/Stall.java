package cn.com.wy.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 车位实体类
 */
public class Stall {
    private int stallId;
    private String stallName;
    private Head head;   //户主    1 -- n
    private String stallCarNo;  //车牌号
    private int stallState; // 状态   1：未出售    2：已出售
    private String stallRemark;   //备注

    public int getStallId() {
        return stallId;
    }

    public void setStallId(int stallId) {
        this.stallId = stallId;
    }

    public String getStallName() {
        return stallName;
    }

    public void setStallName(String stallName) {
        this.stallName = stallName;
    }

    public Head getHead() {
        return head;
    }

    public void setHead(Head head) {
        this.head = head;
    }

    public String getStallCarNo() {
        return stallCarNo;
    }

    public void setStallCarNo(String stallCarNo) {
        this.stallCarNo = stallCarNo;
    }

    public int getStallState() {
        return stallState;
    }

    public void setStallState(int stallState) {
        this.stallState = stallState;
    }

    public String getStallRemark() {
        return stallRemark;
    }

    public void setStallRemark(String stallRemark) {
        this.stallRemark = stallRemark;
    }

    @Override
    public String toString() {
        return "Stall{" +
                "stallId=" + stallId +
                ", stallName='" + stallName + '\'' +
                ", head=" + head +
                ", stallCarNo='" + stallCarNo + '\'' +
                ", stallState=" + stallState +
                ", stallRemark='" + stallRemark + '\'' +
                '}';
    }
}
