package cn.com.wy.entity;

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
}
