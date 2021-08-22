package cn.com.wy.service.Impl;

import cn.com.wy.dao.HeadDao;
import cn.com.wy.dao.StallDao;
import cn.com.wy.entity.Head;
import cn.com.wy.entity.Stall;
import cn.com.wy.service.StallService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

public class StallServiceImpl implements StallService {

    private StallDao stallDao;
    private HeadDao headDao;

    public void setHeadDao(HeadDao headDao) {
        this.headDao = headDao;
    }

    public void setStallDao(StallDao stallDao){
        this.stallDao = stallDao;
    }

    @Override
    public List<Stall> findAll(Stall stall) {
        String headName = stall.getHead().getHeadName();
        List<Integer> ids = new ArrayList<>();;
        if(headName != null){
            List<Head> headList = headDao.findByHeadNameLike(headName);
            for(Head head:headList){
                ids.add(head.getHeadId());
            }
        }
        return stallDao.findAll(stall,ids);
    }

    @Override
    public Stall findByStallId(int stallId) {
        return stallDao.findByStallId(stallId);
    }

    @Override
    public List<Stall> findByHeadId(int headId) {
        return stallDao.findByHeadId(headId);
    }

    @Override
    public List<Stall> findByCarNo(String carNo) {
        return stallDao.findByCarNo(carNo);
    }


    @Override
    public boolean updateStall(Stall stall) {
        boolean bool  =false;
        stall.getHead().setHeadId(headDao.findByHeadName(stall.getHead().getHeadName()).getHeadId());
        try {
            int i = this.stallDao.updateStall(stall);
            if(i != 0) {
                bool = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return bool;
    }

    @Override
    public boolean addStall(Stall stall) {
        boolean bool = false;
        Head head = headDao.findByHeadName(stall.getHead().getHeadName());
        stall.setHead(head);
        try {
            int i = stallDao.addStall(stall);
            if( i >= 0){
                bool = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return bool;
    }

    @Override
    public boolean deleteStall( List<Integer> stallId) {
        boolean bool  = false;
        try {
            int i =stallDao.deleteStall(stallId);
            if(i != 0){
                bool = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return  bool;
    }

    @Override
    public List<Stall> selectLike(Stall stall) {
        return stallDao.selectLike(stall);
    }
}


