package com.quartz.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.quartz.dao.TaskErrorsDao;
import com.quartz.entity.TaskErrorsEntity;
import com.quartz.service.TaskErrorsService;
@Service
public class TaskErrorsServiceImpl implements TaskErrorsService{
	
	@Resource
	private TaskErrorsDao errorsDao;
	
	public List<Map<String, String>> getErrorsByRecordId(String recordId){
		return errorsDao.getErrorsByTaskExecuteRecordId(recordId);
	}

}
