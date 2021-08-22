package cn.com.wy.service.Impl;

import cn.com.wy.dao.PayRecordsDao;
import cn.com.wy.entity.PayRecords;
import cn.com.wy.service.PayRecordsService;

import java.util.List;

public class PayRecordsServiceImpl implements PayRecordsService {
    private PayRecordsDao payRecordsDao;

    public void setPayRecordsDao(PayRecordsDao payRecordsDao) {
        this.payRecordsDao = payRecordsDao;
    }

    @Override
    public List<PayRecords> findAll() {
        return payRecordsDao.findAll();
    }

    @Override
    public PayRecords findByPrcId(int prcId) {
        return null;
    }

    @Override
    public PayRecords findByPfId(int PfId) {
        return null;
    }

    @Override
    public boolean updatePrc(PayRecords payRecords) {
        return false;
    }

    @Override
    public boolean addPrc(PayRecords payRecords) {
        return false;
    }

    @Override
    public boolean deletePrc(int prcId) {
        return false;
    }
}
