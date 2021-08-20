package cn.com.wy.dao;

import cn.com.wy.entity.Rud;

import java.util.List;

/**
 * 房屋
 */
public interface RudDao {
    /**
     * 查询所有房屋
     * @return
     */
    List<Rud> findAllRud();

    /**
     * 根据业主Id查询房屋
     * @param headId
     * @return
     */
    List<Rud> findByHeadId(int headId);

    /**
     * 根据房屋Id查询房屋
     * @param rudId
     * @return
     */
    Rud findByRudId(int rudId);

    /**
     * 根据rudId修改房屋信息
     * @param rud
     * @return
     */
    int updateRud(Rud rud);

    /**
     * 数据库新增对象
     * @param rud
     * @return
     */
    int addRud(Rud rud);

    /**
     * 根据传入的RudId删除对应数据
     * @param rudId
     * @return
     */
    int deleteRud(int rudId);

    /**
     * 条件查询(若传入的只有栋号，则只根据栋号查询对应的房屋)
     * @param rud
     * @return
     */
    List<Rud> findRud(Rud rud);
}
