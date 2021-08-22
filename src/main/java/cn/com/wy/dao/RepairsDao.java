package cn.com.wy.dao;

import cn.com.wy.entity.Repairs;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 报修记录
 */
public interface RepairsDao {
    /**
     * 查询所有报修记录
     * @return
     */
    List<Repairs> findAll();

    /**
     * 根据传入数据模糊查询
     * @param repairs
     * @return
     */
    List<Repairs> findByLike(@Param("repairs") Repairs repairs,@Param("ids") List<Integer> ids);

    /**
     * 根据业主Id查询报修记录
     * @param HeadId
     * @return
     */
    List<Repairs> findByHeadId(int HeadId);

    /**
     * 根据记录id查询保修记录
     * @param repId
     * @return
     */
    List<Repairs> findByRepId(int repId);

    /**
     * 修改报修记录
     * @param repairs
     * @return
     */
    int updateRep(Repairs repairs);

    /**
     * 新增报修记录
     * @param repairs
     * @return
     */
    int addRep(Repairs repairs);

    /**
     * 删除报修记录
     * @param repId
     * @return
     */
    int deleteRep(@Param("repId") List<Integer> repId);
}


