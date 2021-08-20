package cn.com.wy.dao;

import cn.com.wy.entity.Head;
import java.util.List;

/**
 * 业主
 */
public interface HeadDao {
    /**
     * 查询所有head
     * @return
     */
    List<Head> findAllHead();
    /**
     * 根据headId查询head表
     * @param headId
     * @return head
     */
    Head findByHeadId(int headId);

    /**
     * 传入Head对象并添加进数据库
     * @param head
     * @return
     */
    int addHead(Head head);

    /**
     * 传入Head对象修改数据库原有对象
     * @param head
     * @return
     */
    int updateHead(Head head);

    /**
     * 模糊查询,如果为null或者0则不加入此列
     * @param head
     * @return
     */
    List<Head> findHead(Head head);

    /**
     * 根据headId删除head表中对应字段
     * @param headId
     * @return
     */
    int deleteHead(int headId);

    /**
     * 根据传入的headName查询出对象
     * @param headName
     * @return
     */
    List<Head> findByHeadName(String headName);
}
