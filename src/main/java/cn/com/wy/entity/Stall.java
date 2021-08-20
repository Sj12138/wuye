package cn.com.wy.entity;

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
}
