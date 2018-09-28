package com.zhongxin.quartz.util;

/**
*@ClassName: PageParam
*@Description: 
*@author yinyong 
*@version 1.0
*/
public class PageParam{

	private Integer beginLine;		   // 起始行
	private Integer endLine;		   // 结束行
	private Integer currentPage=1; 	   // 当前页
	
	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getBeginLine() {
		return beginLine;
	}

	public void setBeginLine(Integer beginLine) {
		this.beginLine = beginLine;
	}

	public Integer getEndLine() {
		return endLine;
	}

	public void setEndLine(Integer endLine) {
		this.endLine = endLine;
	}
	
}
