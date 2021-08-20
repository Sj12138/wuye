package cn.com.wy.dao;

import cn.com.wy.entity.PropertyFee;

import java.util.List;

/**
 * 物业费记录
 */
public interface PropertyFeeDao {
    /**
     * 查询所有物业费信息
     * @return
     */
    List<PropertyFee> findAll();

    /**
     * 根据pfId查询
     * @param pfId
     * @return
     */
    PropertyFee findPfByPfId(int pfId);

    /**
     * 根据状态查询
     * @param state
     * @return
     */
    List<PropertyFee> findPfByPfState(int state);

    /**
     * 根据类型查询
     * @param pfType
     * @return
     */
    List<PropertyFee> findPfByPfType(int pfType);

    /**
     * 根据房屋Id查询
     * @param rudId
     * @return
     */
    List<PropertyFee> findPfByRudId(int rudId);

    /**
     * 修改物业费记录
     * @param propertyFee
     * @return
     */
    int updatePf(PropertyFee propertyFee);

    /**
     * 新增物业费记录
     * @param propertyFee
     * @return
     */
    int addPf(PropertyFee propertyFee);

}
