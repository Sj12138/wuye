package cn.com.wy.service.Impl;

import cn.com.wy.dao.HeadDao;
import cn.com.wy.entity.Head;
import cn.com.wy.service.HeadService;

import java.util.List;

public class HeadServiceImpl implements HeadService {
    private HeadDao headDao;

    public void setHeadDao(HeadDao headDao) {
        this.headDao = headDao;
    }

    @Override
    public List<Head> findAllHead() {
        return headDao.findAllHead();
    }

    @Override
    public Head findByHeadId(int headId) {
        return headDao.findByHeadId(headId);
    }

    @Override
    public boolean addHead(Head head) {
        boolean bool = false;
        try{
            int count = headDao.addHead(head);
            if(count != 0){
                bool = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return bool;
    }

    @Override
    public boolean updateHead(Head head) {
        boolean bool = false;
        try{
            int count = headDao.updateHead(head);
            if(count != 0){
                bool = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return bool;
    }

    @Override
    public List<Head> findHead(Head head) {
        return headDao.findHead(head);
    }

    @Override
    public boolean deleteHead(List<Integer> ids) {
        boolean bool = false;
        try {
            int count = headDao.deleteHead(ids);
            if(count != 0){
                bool = true;
            }
        }catch (Exception e){
        }
        return bool;
    }

    @Override
    public Head findByHeadName(String headName) {
        return headDao.findByHeadName(headName);
    }
}
