package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.District;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingSearchResponseConverter {

    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity buildingEntity) {

        BuildingSearchResponse buildingSearchResponse = modelMapper.map(buildingEntity, BuildingSearchResponse.class);

        String district = buildingEntity.getDistrict();

        String address = "";

        try {
            for(District item : District.values()){
                if(buildingEntity.getDistrict().equals(item.toString())){
                    address = buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + item.getDistrictName();
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        buildingSearchResponse.setAddress(address);

        List<RentAreaEntity> listRentAreaEntities = buildingEntity.getRentAreaEntities();

        String rentAreas = listRentAreaEntities.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));

        buildingSearchResponse.setRentArea(rentAreas);

        return buildingSearchResponse;
    }
}
