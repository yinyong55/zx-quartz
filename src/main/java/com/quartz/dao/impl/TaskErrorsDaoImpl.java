package com.quartz.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.quartz.dao.BaseDao;
import com.quartz.dao.TaskErrorsDao;
import com.quartz.entity.TaskErrorsEntity;
@Service("taskErrorsDao")
public class TaskErrorsDaoImpl extends BaseDao implements TaskErrorsDao{

	/**
	 * 保存
	 * @param taskErrorsEntity
	 */
	public void saveTaskErrors(TaskErrorsEntity taskErrorsEntity){
		getTemplate().insert("TaskErrorsMapper.insert",taskErrorsEntity);
	}
	
	public List<Map<String, String>> getErrorsByTaskExecuteRecordId(String recordId){
		List<Map<String, String>> list = getTemplate().selectList("TaskErrorsMapper.selectByTaskExecuteRecordId",recordId);
		return list;
	}
	
}
