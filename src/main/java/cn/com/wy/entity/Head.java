package cn.com.wy.entity;

import java.util.List;

/**
 * 业主实体类
 */
public class Head {
    private int headId;
    private  String headName;
    private String headCard;
    private String headSex;
    private String headPhone;
    private List<Rud> rudList;    //一个业主可对应多个房间   1 -- n
    private List<Stall> stallList;   //车位信息   1 -- n
    private List<Repairs> repairsList; //报修记录 1 -- n
}
