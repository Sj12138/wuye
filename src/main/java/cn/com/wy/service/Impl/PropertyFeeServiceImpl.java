package cn.com.wy.service.Impl;

import cn.com.wy.dao.PayRecordsDao;
import cn.com.wy.dao.PropertyFeeDao;
import cn.com.wy.entity.PayRecords;
import cn.com.wy.entity.PropertyFee;
import cn.com.wy.service.PropertyFeeService;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

public class PropertyFeeServiceImpl implements PropertyFeeService {
    private PropertyFeeDao propertyFeeDao;
    private PayRecordsDao payRecordsDao;

    public void setPayRecordsDao(PayRecordsDao payRecordsDao) {
        this.payRecordsDao = payRecordsDao;
    }

    public void setPropertyFeeDao(PropertyFeeDao propertyFeeDao) {
        this.propertyFeeDao = propertyFeeDao;
    }

    @Override
    public List<PropertyFee> findAll() {
        return propertyFeeDao.findAll();
    }

    @Override
    public PropertyFee findPfByPfId(int pfId) {
        return propertyFeeDao.findPfByPfId(pfId);
    }

    @Override
    public List<PropertyFee> findPfByPfState(int state) {
        return propertyFeeDao.findPfByPfState(state);
    }

    @Override
    public List<PropertyFee> findPfByPfType(int pfType) {
        return propertyFeeDao.findPfByPfType(pfType);
    }

    @Override
    public List<PropertyFee> findPfByRudId(int rudId) {
        return propertyFeeDao.findPfByRudId(rudId);
    }

    @Override
    public boolean updatePf(PropertyFee propertyFee) {
        boolean bool = false;
        PayRecords payRecords = new PayRecords();
        payRecords.setPfId(propertyFee.getPfId());
        Date d = new Date(System.currentTimeMillis());
        payRecords.setPrcDate(d);
        payRecords.setPrcRemark("");
        try {
            payRecordsDao.addPrc(payRecords);
            int count = propertyFeeDao.updatePf(propertyFee);
            if(count > 0){
                bool = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return bool;
    }

    @Override
    public boolean addPf(PropertyFee propertyFee) {
        boolean bool = false;
        Date d = new Date(System.currentTimeMillis());
        propertyFee.setPfDate(d);
        try {
            int count = propertyFeeDao.addPf(propertyFee);
            if(count > 0){
                bool = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return bool;
    }

    @Override
    public List<PropertyFee> findPf(PropertyFee propertyFee) {
        return propertyFeeDao.findPf(propertyFee);
    }
}
