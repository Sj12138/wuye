package cn.com.wy.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.List;

/**
 * 公共设施实体类
 */
@JsonIgnoreProperties(value={"commServiceEntityList"})
public class Communal {
    private int comId;
    private String comName;
    private double comMoney;
    private int comState;//设施状态  1：完好   2：损坏
    private String comRemark;//备注
    private List<CommServiceEntity> commServiceEntityList; //设施维修记录 1 -- n

    public int getComId() {
        return comId;
    }

    public void setComId(int comId) {
        this.comId = comId;
    }

    public String getComName() {
        return comName;
    }

    public void setComName(String comName) {
        this.comName = comName;
    }

    public double getComMoney() {
        return comMoney;
    }

    public void setComMoney(double comMoney) {
        this.comMoney = comMoney;
    }

    public int getComState() {
        return comState;
    }

    public void setComState(int comState) {
        this.comState = comState;
    }

    public String getComRemark() {
        return comRemark;
    }

    public void setComRemark(String comRemark) {
        this.comRemark = comRemark;
    }

    public List<CommServiceEntity> getCommServiceEntityList() {
        return commServiceEntityList;
    }

    public void setCommServiceEntityList(List<CommServiceEntity> commServiceEntityList) {
        this.commServiceEntityList = commServiceEntityList;
    }
}
