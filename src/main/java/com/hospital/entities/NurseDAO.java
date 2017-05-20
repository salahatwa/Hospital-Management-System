package com.hospital.entities;

import java.util.List;

import com.hospital.models.NurseServiceTime;

public interface NurseDAO {
	
	public List<NurseServiceTime> getAllServiceTime(int nurseID);

}
