package cn.com.wy.service.Impl;

import cn.com.wy.entity.CommServiceEntity;
import cn.com.wy.service.CommServiceService;

import java.util.List;

public class CommServiceServiceImpl implements CommServiceService {
    @Override
    public List<CommServiceEntity> findAllCs() {
        return null;
    }

    @Override
    public CommServiceEntity findByCsId(int csId) {
        return null;
    }

    @Override
    public List<CommServiceEntity> findByComId(int comId) {
        return null;
    }

    @Override
    public boolean updateCs(CommServiceEntity commServiceEntity) {
        return false;
    }

    @Override
    public boolean addCs(CommServiceEntity commServiceEntity) {
        return false;
    }

    @Override
    public boolean deleteCs(int CsId) {
        return false;
    }
}
