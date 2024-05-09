package com.javaweb.repository.custom;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.MyUserDetail;
import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BuildingRepositoryCustom {
    List<BuildingEntity> searchBuilding(MyUserDetail userDetail, BuildingSearchRequest buildingSearchRequest, Pageable pageable);
    Integer totalSearchItems(MyUserDetail userDetail, BuildingSearchRequest buildingSearchRequest);

}
