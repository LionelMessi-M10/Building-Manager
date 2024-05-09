package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.utils.StringUtils;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class RentAreaConverter {


	public List<RentAreaEntity> convertToEntity(BuildingDTO buildingDTO, BuildingEntity buildingEntity){
		List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
		if(StringUtils.check(buildingDTO.getRentArea())){
			String arr[] = buildingDTO.getRentArea().split(",");
			for(String item : arr){
				RentAreaEntity rentAreaEntity = new RentAreaEntity();
				rentAreaEntity.setBuildingEntity(buildingEntity);
				rentAreaEntity.setValue(Integer.parseInt(item));
				rentAreaEntities.add(rentAreaEntity);
			}
		}
		return rentAreaEntities;
	}
}
