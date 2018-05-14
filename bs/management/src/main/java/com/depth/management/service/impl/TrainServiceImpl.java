package com.depth.management.service.impl;

import com.depth.management.common.exception.ServiceException;
import com.depth.management.mapper.EmpMapper;
import com.depth.management.mapper.TrainEmpMapper;
import com.depth.management.mapper.TrainMapper;
import com.depth.management.model.Emp;
import com.depth.management.model.Train;
import com.depth.management.model.TrainEmp;
import com.depth.management.service.EmpService;
import com.depth.management.service.TrainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class TrainServiceImpl implements TrainService {

    private final TrainMapper trainMapper;
    private final EmpService empService;
    private final TrainEmpMapper trainEmpMapper;

    @Autowired
    public TrainServiceImpl(TrainMapper trainMapper, EmpService empService, TrainEmpMapper trainEmpMapper) {
        this.trainMapper = trainMapper;
        this.empService = empService;
        this.trainEmpMapper = trainEmpMapper;
    }

    @Override
    public void save(Train train, Emp loginEmp) {
        Date date = new Date();
        train.setCreateTime(date);
        train.setCreateUser(loginEmp.getName());
        train.setUpdateTime(date);
        train.setUpdateUser(loginEmp.getName());
        try {
            trainMapper.insert(train);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
    }

    @Override
    public void update(Train train, Emp loginEmp) {
        Date date = new Date();
        train.setUpdateTime(date);
        train.setUpdateUser(loginEmp.getName());
        try {
            trainMapper.updateByPrimaryKeySelective(train);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
    }

    @Override
    public List<Train> getListByPublisher(Long id) {
        Train train = new Train();
        train.setPublisher(id);
        List<Train> trains;
        try {
            trains = trainMapper.select(train);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        List<Long> ids = new ArrayList<>();
        trains.forEach(item -> ids.add(item.getPublisher()));
        List<Emp> emps = empService.findByIds(ids);
        trains.forEach(item -> emps.forEach(v -> {
            if (v.getId().equals(item.getPublisher())) {
                item.setPublisherEmp(v);
            }
        }));
        return trains;
    }

    @Override
    public void newTrainEmp(String[] empIds, Long trainId, Emp opa) {
        Date date = new Date();
        try {
            for (String empId : empIds) {
                TrainEmp te = new TrainEmp();
                te.setEmpId(Long.parseLong(empId));
                te.setTrainId(trainId);
                te.setStatus("0");
                te.setApprover(opa.getId());
                te.setCreateTime(date);
                te.setCreateUser(opa.getName());
                te.setUpdateTime(date);
                te.setUpdateUser(opa.getName());
                trainEmpMapper.insert(te);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
    }

    @Override
    public Train findById(Long trainId) {
        Train train;
        try {
            train = trainMapper.selectByPrimaryKey(trainId);
            Emp emp = empService.findById(train.getPublisher());
            train.setPublisherEmp(emp);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        return train;
    }

    @Override
    public List<Emp> findByTrainId(Long trainId) {

        List<Emp> empList;
        try {
            List<Long> ids = trainEmpMapper.findEmpIdsByTrainId(trainId);
            empList = empService.findByIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }

        return empList;
    }

    @Override
    public void changeTrainEmp(String[] ids, Long trainId, Emp opa) {
        TrainEmp te = new TrainEmp();
        te.setTrainId(trainId);
        try {
            trainEmpMapper.delete(te);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        newTrainEmp(ids, trainId, opa);
    }

    @Override
    public List<Long> findIdsByTrainId(Long trainId) {
        List<Long> ids = null;
        try {
            ids = trainEmpMapper.findEmpIdsByTrainId(trainId);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        return ids;
    }

    @Override
    public List<Train> findAll() {
        List<Train> trains = trainMapper.selectAll();

        List<Long> ids = trains.stream().map(Train::getPublisher).collect(Collectors.toList());

        List<Emp> emps = empService.findByIds(ids);
        for (Train train : trains) {
            for (Emp emp : emps) {
                if (train.getPublisher().equals(emp.getId())) {
                    train.setPublisherEmp(emp);
                }
            }
        }
        return trains;
    }
}
