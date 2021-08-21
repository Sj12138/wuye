package cn.com.wy.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 车位实体类
 */
@JsonIgnoreProperties(value={"head"})
public class Stall {
    private int stallId;
    private String stallName;
    private Head head;   //户主    1 -- n
    private String stallCarNo;  //车牌号
    private int stallState; // 状态   1：未出售    2：已出售
    private String stallRemark;   //备注
}
