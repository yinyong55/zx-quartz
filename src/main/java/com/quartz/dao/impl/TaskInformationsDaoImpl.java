package com.quartz.dao.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.quartz.dao.BaseDao;
import com.quartz.dao.TaskInformationsDao;
import com.quartz.entity.TaskInformationsEntity;
import com.quartz.util.DateUtil;
import com.quartz.vo.TaskInformationsDetailVo;
import com.quartz.vo.TaskInformationsVo;


@Service("taskInformationsDao")
public class TaskInformationsDaoImpl extends BaseDao implements TaskInformationsDao{
	
	/**
	 * 获取任务列表
	 * @return
	 */
	public List<TaskInformationsEntity> getTaskList(){
		List<TaskInformationsEntity> taskList = getTemplate().selectList("TaskInformationsMapper.selectTaskInfoList");
		return taskList;
	}
	
	/**
	 * 根据taskNo获取任务
	 * @param taskNo
	 * @return
	 */
	public TaskInformationsEntity getTaskByTaskNo(String taskNo){
		TaskInformationsEntity entity = getTemplate().selectOne("TaskInformationsMapper.selectByTaskNo",taskNo);
		return entity;
	}

	/**
	 * 根据ID更新
	 * @param entity
	 */
	public int updateById(TaskInformationsEntity entity){
		int count = getTemplate().update("TaskInformationsMapper.updateById", entity);
		return count;
	}
	
	/**
	 * 列表获取
	 * @return
	 */
	public List<TaskInformationsVo> getList(int currentPage){
		return getTemplate().selectList("TaskInformationsMapper.selectAll",getPageNum(currentPage, 10));
	}
	
	public int getTotalCount(){
		return getTemplate().selectOne("TaskInformationsMapper.selectTotalCount");
	}
	
	public TaskInformationsDetailVo getTaskDetail(String taskNo){
		return getTemplate().selectOne("TaskInformationsMapper.selectDetail", taskNo);
	}
	
	public int addTaskInformation(TaskInformationsEntity entity){
		entity.setCreateTime(DateUtil.getLastModifyTime());
		entity.setLastModifyTime(DateUtil.getLastModifyTime());
		entity.setVersion(0);
		int count = getTemplate().insert("TaskInformationsMapper.addTaskInfo",entity);
		return count;
	}
	
	public TaskInformationsEntity selectById(long id){
		return getTemplate().selectOne("TaskInformationsMapper.selectById",id);
	}
	
}
