package cn.com.wy.service.Impl;

import cn.com.wy.dao.CommunalDao;
import cn.com.wy.entity.Communal;
import cn.com.wy.service.CommunalService;

import java.util.List;

public class CommunalServiceImpl implements CommunalService {
    private CommunalDao communalDao;
    public void setCommunalDao(CommunalDao communalDao) {
        this.communalDao = communalDao;
    }
    @Override
    public List<Communal> findAll() {
        List<Communal> findAlls=this.communalDao.findAll();
        return findAlls;
    }

    @Override
    public Communal findComByComId(int comId) {
        Communal findComByComIds=this.communalDao.findComByComId(comId);
        return findComByComIds;
    }

    @Override
    public List<Communal> findComByComState(int comState) {
        List<Communal> findComByComStates=this.communalDao.findComByComState(comState);
        return findComByComStates;
    }

    @Override
    public Communal findComByComName(String comName) {
        Communal findComByComNames=this.communalDao.findComByComName(comName);
        return findComByComNames;
    }

    @Override
    public boolean updateCom(Communal communal) {
        boolean updateComs=false;
        try {
            int i=this.communalDao.updateCom(communal);
            if (i!=0){
                updateComs=true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return updateComs;
    }

    @Override
    public boolean addCom(Communal communal) {
        boolean addComs=false;
        try {
            int i=this.communalDao.addCom(communal);
            if (i!=0){
                addComs=true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return addComs;
    }
    @Override
    public boolean deleteCom(List<Integer> comId) {
        boolean deleteComs=false;
        try {
            int i=this.communalDao.deleteCom(comId);
            if (i!=0){
                deleteComs=true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return deleteComs;
    }
    public  List<Communal> findCom(Communal communal){
        List<Communal> findCom=this.communalDao.findCom(communal);
        return findCom;
    };
}
