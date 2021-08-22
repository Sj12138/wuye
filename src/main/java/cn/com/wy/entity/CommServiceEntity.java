package cn.com.wy.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.sql.Date;

/**
 * 公共设施维修记录实体类
 */
public class CommServiceEntity {
    private int csId;
    private Date csDate;
    private int csCount;
    private String csIssue;//问题描述
    private String csRemark;//备注
    private Communal communal;//公共设施  n -- 1

    public int getCsId() {
        return csId;
    }

    public void setCsId(int csId) {
        this.csId = csId;
    }

    public Date getCsDate() {
        return csDate;
    }

    public void setCsDate(Date csDate) {
        this.csDate = csDate;
    }

    public int getCsCount() {
        return csCount;
    }

    public void setCsCount(int csCount) {
        this.csCount = csCount;
    }

    public String getCsIssue() {
        return csIssue;
    }

    public void setCsIssue(String csIssue) {
        this.csIssue = csIssue;
    }

    public String getCsRemark() {
        return csRemark;
    }

    public void setCsRemark(String csRemark) {
        this.csRemark = csRemark;
    }

    public Communal getCommunal() {
        return communal;
    }

    public void setCommunal(Communal communal) {
        this.communal = communal;
    }

    @Override
    public String toString() {
        return "CommServiceEntity{" +
                "csId=" + csId +
                ", csDate=" + csDate +
                ", csCount=" + csCount +
                ", csIssue='" + csIssue + '\'' +
                ", csRemark='" + csRemark + '\'' +
                ", communal=" + communal +
                '}';
    }
}
