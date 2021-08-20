package cn.com.wy.service;

import cn.com.wy.entity.CommServiceEntity;

import java.util.List;

/**
 * 公共设施维修记录
 */
public interface CommServiceService {
    /**
     * 查询所有记录
     * @return
     */
    List<CommServiceEntity> findAllCs();

    /**
     * 根据csId查询维修记录
     * @param csId
     * @return
     */
    CommServiceEntity findByCsId(int csId);

    /**
     * 根据设施查询维修记录
     * @param comId
     * @return
     */
    List<CommServiceEntity> findByComId(int comId);

    /**
     * 修改公共设施维修记录
     * @param commServiceEntity
     * @return
     */
    boolean updateCs(CommServiceEntity commServiceEntity);

    /**
     * 新增公共设施维修记录
     * @param commServiceEntity
     * @return
     */
    boolean addCs(CommServiceEntity commServiceEntity);

    /**
     * 根据CsId删除设施维修记录
     * @param CsId
     * @return
     */
    boolean deleteCs(int CsId);
}
