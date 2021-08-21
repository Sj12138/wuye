package cn.com.wy.service.Impl;

import cn.com.wy.dao.CommServiceDao;
import cn.com.wy.entity.CommServiceEntity;
import cn.com.wy.service.CommServiceService;

import java.util.List;

public class CommServiceServiceImpl implements CommServiceService {
    private CommServiceDao commServiceDao;
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
        int i=this.commServiceDao.updateCs(commServiceEntity);
        if (i!=0){
            updatecs=true;
        }
        return updatecs;
    }

    @Override
    public boolean addCs(CommServiceEntity commServiceEntity) {
        boolean addcs=false;
        int i=this.commServiceDao.addCs(commServiceEntity);
        if (i!=0){
            addcs=true;
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
