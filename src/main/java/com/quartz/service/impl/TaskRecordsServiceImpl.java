package com.quartz.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.quartz.dao.TaskRecordsDao;
import com.quartz.entity.TaskRecordsEntity;
import com.quartz.service.TaskRecordsService;

@Service
public class TaskRecordsServiceImpl implements TaskRecordsService{
	
	@Resource
	private TaskRecordsDao recordsDao;
	
	public List<TaskRecordsEntity> getTaskRecordsByTaskNo(String taskNo,int currentPage,String taskStatus){
		return recordsDao.getListByTaskNo(taskNo, currentPage,taskStatus);
	}

	public Integer getCountByTaskNo(String taskNo,String taskStatus){
		return recordsDao.getCountByTaskNo(taskNo,taskStatus);
	}
}
