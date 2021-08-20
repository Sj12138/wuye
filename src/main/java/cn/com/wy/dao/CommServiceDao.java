package cn.com.wy.dao;

import cn.com.wy.entity.CommServiceEntity;

import java.util.List;

/**
 * 公共设施维修记录
 */
public interface CommServiceDao {
    /**
     * 查询所有维修记录
     * @return
     */
    List<CommServiceEntity> findAll();

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
    int updateCs(CommServiceEntity commServiceEntity);

    /**
     * 新增公共设施维修记录
     * @param commServiceEntity
     * @return
     */
    int addCs(CommServiceEntity commServiceEntity);

    /**
     * 根据CsId删除设施维修记录
     * @param CsId
     * @return
     */
    int deleteCs(int CsId);
}
