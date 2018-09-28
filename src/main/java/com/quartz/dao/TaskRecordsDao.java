package com.quartz.dao;

import java.util.List;

import com.quartz.entity.TaskRecordsEntity;

public interface TaskRecordsDao {

	public TaskRecordsEntity getRecordsByTaskNo(String taskNo,String timeKeyValue);
	
	public Long insert(TaskRecordsEntity taskRecordsEntity);
	
	public void updateById(TaskRecordsEntity recordsEntity);
	
	public TaskRecordsEntity selectByTaskNoAndStatus(String taskNo);
	
	public List<TaskRecordsEntity> getListByTaskNo(String taskNo,int currentPage,String taskStatus);
	
	public Integer getCountByTaskNo(String taskNo,String taskStatus);
}
