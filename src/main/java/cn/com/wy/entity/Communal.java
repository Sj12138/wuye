package cn.com.wy.entity;

import java.util.List;

/**
 * 公共设施实体类
 */
public class Communal {
    private int comId;
    private String comName;
    private double comMoney;
    private int comState;//设施状态  1：完好   2：损坏
    private String comRemark;//备注
    private List<CommServiceEntity> commServiceEntityList; //设施维修记录 1 -- n
}
