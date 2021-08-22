package cn.com.wy.service.Impl;

import cn.com.wy.dao.CommServiceDao;
import cn.com.wy.dao.CommunalDao;
import cn.com.wy.entity.CommServiceEntity;
import cn.com.wy.service.CommServiceService;

import java.sql.Date;
import java.util.List;

public class CommServiceServiceImpl implements CommServiceService {
    private CommServiceDao commServiceDao;
    private CommunalDao communalDao;

    public void setCommunalDao(CommunalDao communalDao) {
        this.communalDao = communalDao;
    }

    public void setCommServiceDao(CommServiceDao commServiceDao) {
        this.commServiceDao = commServiceDao;
    }
    @Override
    public List<CommServiceEntity> findAllCs() {
        List<CommServiceEntity> findall=this.commServiceDao.findAll();
        return findall;
    }

    @Override
    public CommServiceEntity findByCsId(int csId) {
        CommServiceEntity findbycsid=this.commServiceDao.findByCsId(csId);
        return findbycsid;
    }

    @Override
    public List<CommServiceEntity> findByComId(int comId) {
        List<CommServiceEntity> findbycomId=this.commServiceDao.findByComId(comId);
        return findbycomId;
    }

    @Override
    public boolean updateCs(CommServiceEntity commServiceEntity) {
        boolean updatecs=false;
        try {
            int i=this.commServiceDao.updateCs(commServiceEntity);
            if (i!=0){
                updatecs=true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return updatecs;
    }

    @Override
    public boolean addCs(CommServiceEntity commServiceEntity) {
        boolean addcs=false;
        Date d = new Date(System.currentTimeMillis());
        commServiceEntity.setCsDate(d);
        try {
            commServiceEntity.getCommunal().setComId(communalDao.findComByComName(commServiceEntity.getCommunal().getComName()).getComId());
            int i=this.commServiceDao.addCs(commServiceEntity);
            if (i!=0){
                addcs=true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return addcs;
    }

    @Override
    public boolean deleteCs(int CsId) {
        boolean deletecs=false;
        int i=this.commServiceDao.deleteCs(CsId);
        if (i!=0){
            deletecs=true;
        }
        return deletecs;
    }
}
