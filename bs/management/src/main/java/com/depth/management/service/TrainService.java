package com.depth.management.service;

import com.depth.management.model.Emp;
import com.depth.management.model.Train;

import java.util.List;

public interface TrainService {
    void save(Train train, Emp loginEmp);

    void update(Train train, Emp loginEmp);

    List<Train> getListByPublisher(Long id);

    void newTrainEmp(String[] empIds, Long trainId, Emp opa);

    Train findById(Long trainId);

    List<Emp> findByTrainId(Long trainId);

    void changeTrainEmp(String[] ids, Long trainId, Emp opa);

    List<Long> findIdsByTrainId(Long trainId);

    List<Train> findAll();
}
