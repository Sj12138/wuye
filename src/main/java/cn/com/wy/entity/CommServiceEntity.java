package cn.com.wy.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.sql.Date;

/**
 * 公共设施维修记录实体类
 */
@JsonIgnoreProperties(value={"communal"})
public class CommServiceEntity {
    private int csId;
    private Date csDate;
    private int csCount;
    private String csIssue;//问题描述
    private String csRemark;//备注
    private Communal communal;//公共设施  n -- 1
}
