package com.quartz.entity;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

public class Entity implements Serializable{


	private static final long serialVersionUID = 4930270770196978896L;

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
