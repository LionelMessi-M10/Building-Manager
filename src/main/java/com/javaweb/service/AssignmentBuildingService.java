package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import org.springframework.stereotype.Service;

@Service
public interface AssignmentBuildingService {

    void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO);
}
