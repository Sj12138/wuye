package cn.com.wy.dao;

import cn.com.wy.entity.Repairs;

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
     * 根据业主Id查询报修记录
     * @param HeadId
     * @return
     */
    List<Repairs> findByHeadId(int HeadId);

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
    int deleteRep(int repId);
}
