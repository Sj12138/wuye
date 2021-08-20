package cn.com.wy.dao;

import cn.com.wy.entity.Stall;

import java.util.List;

/**
 * 车位
 */
public interface StallDao {
    /**
     * 查询所有车位
     * @return
     */
    List<Stall> findAll();

    /**
     * 根据车位Id查询车位
     * @param stallId
     * @return
     */
    Stall findByStallId(int stallId);

    /**
     * 根据户主Id查询车位
     * @param headId
     * @return
     */
    List<Stall> findByHeadId(int headId);

    /**
     * 根据车牌号查询车位
     * @param carNo
     * @return
     */
    List<Stall> findByCarNo(String carNo);

    /**
     * 修改车位信息
     * @param stall
     * @return
     */
    int updateStall(Stall stall);

    /**
     * 新增车位信息
     * @param stall
     * @return
     */
    int addStall(Stall stall);

    /**
     * 根据车位Id删除车位
     * @param stallId
     * @return
     */
    int deleteStall(int stallId);
}
