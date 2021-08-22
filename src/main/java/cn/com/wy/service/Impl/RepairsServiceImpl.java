package cn.com.wy.service.Impl;

import cn.com.wy.dao.HeadDao;
import cn.com.wy.dao.RepairsDao;
import cn.com.wy.entity.Head;
import cn.com.wy.entity.Repairs;
import cn.com.wy.service.RepairsService;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class RepairsServiceImpl implements RepairsService {
    public void setRepairsDao(RepairsDao repairsDao) {
        this.repairsDao = repairsDao;
    }

    private HeadDao headDao;

    public void setHeadDao(HeadDao headDao) {
        this.headDao = headDao;
    }

    private RepairsDao repairsDao;

    @Override
    public List<Repairs> findAll() {
        return this.repairsDao.findAll();
    }

    @Override
    public List<Repairs> findByLike(Repairs repairs) {
        String headName = repairs.getHead().getHeadName();
        List<Integer> ids = new ArrayList<>();
        if(headName != null){
            List<Head> headList = headDao.findByHeadNameLike(headName);
            for(Head head:headList){
                ids.add(head.getHeadId());
            }
        }
        System.out.println(ids.size());
        return this.repairsDao.findByLike(repairs,ids);
    }


    @Override
    public List<Repairs> findByHeadId(int headId) {
        return this.repairsDao.findByHeadId(headId);
    }

    @Override
    public List<Repairs> findByRepId(int repId) {
        return this.repairsDao.findByRepId(repId);
    }

    @Override
    public boolean updateRep(Repairs repairs) {
        boolean boo = false;
        Head head = headDao.findByHeadName(repairs.getHead().getHeadName());
        Date d = new Date(System.currentTimeMillis());
        repairs.setRepEndDate(d);
        repairs.setHead(head);
        try {
            int i = this.repairsDao.updateRep(repairs);
            if (i != 0) {
                boo = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return boo;
    }

    @Override
    public boolean addRep(Repairs repairs) {
        boolean boo = false;
        Head head = headDao.findByHeadName(repairs.getHead().getHeadName());
        repairs.setHead(head);
        Date d = new Date(System.currentTimeMillis());
        repairs.setRepStartDate(d);
        try {
            int i = this.repairsDao.addRep(repairs);
            if (i != 0) {
                boo = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return boo;
    }

    @Override
    public boolean deleteRep(List<Integer> repId) {
        boolean boo = false;
        try {
            int i = this.repairsDao.deleteRep(repId);
            if (i != 0) {
                boo = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return boo;
    }
}


