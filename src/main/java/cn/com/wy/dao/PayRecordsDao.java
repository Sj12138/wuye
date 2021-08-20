package cn.com.wy.dao;

import cn.com.wy.entity.PayRecords;

import java.util.List;

/**
 * 缴费记录
 */
public interface PayRecordsDao {
    /**
     * 查询所有缴费记录
     * @return
     */
    List<PayRecords> findAll();

    /**
     * 根据prcId查询缴费记录
     * @param prcId
     * @return
     */
    PayRecords findByPrcId(int prcId);

    /**
     * 根据物业费Id查询缴费记录
     * @param PfId
     * @return
     */
    PayRecords findByPfId(int PfId);

    /**
     * 修改缴费记录
     * @param payRecords
     * @return
     */
    int updatePrc(PayRecords payRecords);

    /**
     * 新增缴费记录
     * @param payRecords
     * @return
     */
    int addPrc(PayRecords payRecords);

    /**
     * 根据prcId删除缴费记录
     * @param prcId
     * @return
     */
    int deletePrc(int prcId);
}
