package cn.com.wy.service.Impl;


import cn.com.wy.dao.RudDao;

import cn.com.wy.entity.Rud;
import cn.com.wy.service.RudService;

import java.util.List;

public class RudServiceImpl implements RudService {
    private RudDao rudDao;

    @Override
    public List<Rud> findAllRud() {
        return this.rudDao.findAllRud();

    }

    @Override
    public List<Rud> findByHeadId(int headId) {

        return this.rudDao.findByHeadId(headId);
    }

    @Override
    public Rud findByRudId(int rudId) {
        return this.rudDao.findByRudId(rudId);
    }

    @Override
    public boolean updateRud(Rud rud) {
        boolean i=false;
        int count = this.rudDao.updateRud(rud);
        if (count>0){
            i=true;
        }
        return i;
    }

    @Override
    public boolean addRud(Rud rud) {
        boolean bool=false;
        int count=this.rudDao.addRud(rud);
        if (count>0){
            bool=true;
        }
        return bool;
    }

    @Override
    public boolean deleteRud(int rudId) {
        boolean bool=false;
        int count=this.rudDao.deleteRud(rudId);
        if (count>0){
            bool=true;
        }
        return bool;
    }

    @Override
    public List<Rud> findRud(Rud rud) {
        return rudDao.findRud(rud);
    }
    public void setRudDao(RudDao rudDao){

        this.rudDao=rudDao;
    }

}


