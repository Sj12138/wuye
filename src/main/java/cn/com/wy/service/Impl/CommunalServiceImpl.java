package cn.com.wy.service.Impl;

import cn.com.wy.entity.Communal;
import cn.com.wy.service.CommunalService;

import java.util.List;

public class CommunalServiceImpl implements CommunalService {
    @Override
    public List<Communal> findAll() {
        return null;
    }

    @Override
    public Communal findComByComId(int comId) {
        return null;
    }

    @Override
    public List<Communal> findComByComState(int comState) {
        return null;
    }

    @Override
    public List<Communal> findComByComName(String comName) {
        return null;
    }

    @Override
    public boolean updateCom(Communal communal) {
        return false;
    }

    @Override
    public boolean addCom(Communal communal) {
        return false;
    }
}
