package cn.com.wy.service;

import cn.com.wy.entity.Communal;

import java.util.List;

/**
 * 公共设施
 */
public interface CommunalService {

    /**
     * 查询所有公共设施
     * @return
     */
    List<Communal> findAll();

    /**
     * 根据comId查询公共设施
     * @param comId
     * @return
     */
    Communal findComByComId(int comId);

    /**
     * 根据公共设施状态查询设施
     * @param comState
     * @return
     */
    List<Communal> findComByComState(int comState);

    /**
     * 根据设施名称查询
     * @param comName
     * @return
     */
    List<Communal> findComByComName(String comName);

    /**
     * 修改设施信息
     * @param communal
     * @return
     */
    boolean updateCom(Communal communal);

    /**
     * 新增公共设施
     * @param communal
     * @return
     */
    boolean addCom(Communal communal);
}
