package com.quartz.service;

import java.util.List;
import java.util.Map;

import com.quartz.entity.TaskErrorsEntity;

public interface TaskErrorsService {
	
	public List<Map<String, String>> getErrorsByRecordId(String recordId);

}
