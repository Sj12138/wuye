package cn.com.wy.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.List;

/**
 * 房间实体类
 */
@JsonIgnoreProperties(value={"head","propertyFeeList"})
public class Rud {
    private int rudId;
    private int rudRidId;  //栋
    private int rudUnId;  //单元
    private int rudDpId;    //门牌
    private String rudRidgepole; //栋
    private String rudUnit;  //单元名称
    private String rudDoorplate; //门牌号
    private Head head; //业主    n -- 1
    private List<PropertyFee> propertyFeeList; //物业费  1 -- n

    public int getRudId() {
        return rudId;
    }

    public void setRudId(int rudId) {
        this.rudId = rudId;
    }

    public int getRudRidId() {
        return rudRidId;
    }

    public void setRudRidId(int rudRidId) {
        this.rudRidId = rudRidId;
    }

    public int getRudUnId() {
        return rudUnId;
    }

    public void setRudUnId(int rudUnId) {
        this.rudUnId = rudUnId;
    }

    public int getRudDpId() {
        return rudDpId;
    }

    public void setRudDpId(int rudDpId) {
        this.rudDpId = rudDpId;
    }

    public String getRudRidgepole() {
        return rudRidgepole;
    }

    public void setRudRidgepole(String rudRidgepole) {
        this.rudRidgepole = rudRidgepole;
    }

    public String getRudUnit() {
        return rudUnit;
    }

    public void setRudUnit(String rudUnit) {
        this.rudUnit = rudUnit;
    }

    public String getRudDoorplate() {
        return rudDoorplate;
    }

    public void setRudDoorplate(String rudDoorplate) {
        this.rudDoorplate = rudDoorplate;
    }

    public Head getHead() {
        return head;
    }

    public void setHead(Head head) {
        this.head = head;
    }

    public List<PropertyFee> getPropertyFeeList() {
        return propertyFeeList;
    }

    public void setPropertyFeeList(List<PropertyFee> propertyFeeList) {
        this.propertyFeeList = propertyFeeList;
    }

    @Override
    public String toString() {
        return "Rud{" +
                "rudId=" + rudId +
                ", rudRidId=" + rudRidId +
                ", rudUnId=" + rudUnId +
                ", rudDpId=" + rudDpId +
                ", rudRidgepole='" + rudRidgepole + '\'' +
                ", rudUnit='" + rudUnit + '\'' +
                ", rudDoorplate='" + rudDoorplate + '\'' +
                ", head=" + head +
                ", propertyFeeList=" + propertyFeeList +
                '}';
    }
}
