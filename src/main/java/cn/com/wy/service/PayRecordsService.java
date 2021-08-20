package cn.com.wy.service;

import cn.com.wy.entity.PayRecords;

import java.util.List;
public interface PayRecordsService {
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
    boolean updatePrc(PayRecords payRecords);

    /**
     * 新增缴费记录
     * @param payRecords
     * @return
     */
    boolean addPrc(PayRecords payRecords);

    /**
     * 根据prcId删除缴费记录
     * @param prcId
     * @return
     */
    boolean deletePrc(int prcId);
}
