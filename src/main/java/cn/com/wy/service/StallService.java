package cn.com.wy.service;

import cn.com.wy.entity.Stall;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.PreDestroy;
import java.util.List;

public interface StallService {
    /**
     * 查询所有车位
     * @return
     */
    List<Stall> findAll(Stall stall);

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
    boolean updateStall(Stall stall);

    /**
     * 新增车位信息
     * @param stall
     * @return
     */
    boolean addStall(Stall stall);

    /**
     * 根据车位Id删除车位
     * @param stallId
     * @return
     */
    boolean deleteStall(List<Integer> stallId);

    /**
     * 查询 车位like
     */
    List<Stall> selectLike(Stall stall);
}


