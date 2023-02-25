package com.odod.postluck.beans;

import lombok.Data;

@Data
public class ScheduleBean {
	private String startDate;
	private String endDate;
	private String startTime;
	private String endTime;
	private LocationBean location;
}
