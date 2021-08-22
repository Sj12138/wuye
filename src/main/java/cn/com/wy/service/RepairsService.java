package cn.com.wy.service;

import cn.com.wy.entity.Repairs;

import java.util.List;

public interface RepairsService {
    /**
     * 查询所有报修记录
     * @return
     */
    List<Repairs> findAll();

    /**
     * 模糊查询
     * @return
     */
    List<Repairs> findByLike( Repairs repairs);
    /**
     * 根据业主Id查询报修记录
     * @param headId
     * @return
     */
    List<Repairs> findByHeadId(int headId);

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
    boolean updateRep(Repairs repairs);

    /**
     * 新增报修记录
     * @param repairs
     * @return
     */
    boolean addRep(Repairs repairs);

    /**
     * 删除报修记录
     * @param repId
     * @return
     */
    boolean deleteRep(List<Integer> repId);


}


