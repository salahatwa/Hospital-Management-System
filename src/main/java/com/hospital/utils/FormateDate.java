package com.hospital.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FormateDate {

	//01/17/2017
	public static Date getFormatedDate(String dateText) {
		Date date = null;
		try {
			SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
			date = df.parse(dateText);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return date;
	}
	
	public static String getStringDate(Date date)
	{
		DateFormat df = new SimpleDateFormat("mm/dd/yyyy");

		String reportDate = df.format(date);
		
		return reportDate;
	}
	
	public static void main(String[] args) {//8/16/2016
		Date date=getFormatedDate("8/16/2016");
		System.out.println(getStringDate(date));
	}

}
