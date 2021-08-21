package cn.com.wy.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.List;

/**
 * 业主实体类
 */
@JsonIgnoreProperties(value={"stallList","rudList","repairsList"})
public class Head {
    private int headId;
    private  String headName;
    private String headCard;
    private String headSex;
    private String headPhone;
    private List<Rud> rudList;    //一个业主可对应多个房间   1 -- n
    private List<Stall> stallList;   //车位信息   1 -- n
    private List<Repairs> repairsList; //报修记录 1 -- n

    public int getHeadId() {
        return headId;
    }

    public void setHeadId(int headId) {
        this.headId = headId;
    }

    public String getHeadName() {
        return headName;
    }

    public void setHeadName(String headName) {
        this.headName = headName;
    }

    public String getHeadCard() {
        return headCard;
    }

    public void setHeadCard(String headCard) {
        this.headCard = headCard;
    }

    public String getHeadSex() {
        return headSex;
    }

    public void setHeadSex(String headSex) {
        this.headSex = headSex;
    }

    public String getHeadPhone() {
        return headPhone;
    }

    public void setHeadPhone(String headPhone) {
        this.headPhone = headPhone;
    }

    public List<Rud> getRudList() {
        return rudList;
    }

    public void setRudList(List<Rud> rudList) {
        this.rudList = rudList;
    }

    public List<Stall> getStallList() {
        return stallList;
    }

    public void setStallList(List<Stall> stallList) {
        this.stallList = stallList;
    }

    public List<Repairs> getRepairsList() {
        return repairsList;
    }

    public void setRepairsList(List<Repairs> repairsList) {
        this.repairsList = repairsList;
    }

    @Override
    public String toString() {
        return "Head{" +
                "headId=" + headId +
                ", headName='" + headName + '\'' +
                ", headCard='" + headCard + '\'' +
                ", headSex='" + headSex + '\'' +
                ", headPhone='" + headPhone + '\'' +
                ", rudList=" + rudList +
                ", stallList=" + stallList +
                ", repairsList=" + repairsList +
                '}';
    }
}
