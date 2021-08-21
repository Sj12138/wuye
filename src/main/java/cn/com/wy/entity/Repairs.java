package cn.com.wy.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.sql.Date;

/**
 * 报修记录实体类
 */
@JsonIgnoreProperties(value={"head"})
public class Repairs {
    private int repId;
    private Date repEndDate; //结束时间
    private Date repStartDate;//报修时间
    private String repIssue;  //问题描述
    private int repState; //状态 1:未处理 2:已处理 3:不能处理
    private String repRemark; //不能处理原因
    private Head head;  //业主 1 -- 1
}
