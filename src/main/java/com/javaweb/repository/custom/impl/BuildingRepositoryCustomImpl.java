package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.MyUserDetail;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.UserRepository;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryCustomImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    @Autowired
    private UserRepository userRepository;

    public static void joinTable(MyUserDetail userDetail, BuildingSearchRequest buildingSearchRequest, StringBuilder sql) {
        Long staffId = buildingSearchRequest.getStaffId();

        if (staffId != null) {
            sql.append(" INNER JOIN assignmentbuilding asb ON asb.buildingid = b.id ");
        }
        Collection<GrantedAuthority> authorities = userDetail.getAuthorities();
        String authorityString = "";
        Iterator<GrantedAuthority> iterator = authorities.iterator();
        if (iterator.hasNext()) {
            authorityString = iterator.next().toString();
        }
        if(authorityString.equals("ROLE_STAFF")){
            if(staffId == null){
                sql.append(" INNER JOIN assignmentbuilding asb ON asb.buildingid = b.id ");
            }
            sql.append(" INNER JOIN user u ON u.id = asb.staffid ");
        }

    }

    public static void queryNormal(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {

        try {
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();

            for (Field item : fields) {
                item.setAccessible(true);
                String name = item.getName();

                if (!name.equals("staffId") && !name.equals("typeCode")
                        && !name.startsWith("area") && !name.startsWith("rentPrice")) {
                    Object value = item.get(buildingSearchRequest);
                    if (value != null && !value.equals("")) {
                        if (item.getType().getName().equals("java.lang.Long")) {
                            where.append(" AND b." + name + " = " + value + " ");
                        } else {
                            where.append(" AND b." + name + " LIKE '%" + value + "%' ");
                        }
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void querySpecial(MyUserDetail userDetail, BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        Long staffId = buildingSearchRequest.getStaffId();
        if (staffId != null) {
            where.append(" AND asb.staffid = " + staffId);
        }
        Collection<GrantedAuthority> authorities = userDetail.getAuthorities();
        String authorityString = "";
        Iterator<GrantedAuthority> iterator = authorities.iterator();
        if (iterator.hasNext()) {
            authorityString = iterator.next().toString();
        }
        if(authorityString.equals("ROLE_STAFF")){
            where.append(" AND u.username LIKE '%" + userDetail.getUsername() + "%' ");
        }

        Long rentAreaTo = buildingSearchRequest.getAreaTo();
        Long rentAreaFrom = buildingSearchRequest.getAreaFrom();

        if(rentAreaFrom != null || rentAreaTo != null) {
            where.append(" AND EXISTS (SELECT * FROM rentarea ra WHERE b.id = ra.buildingid ");

            if (rentAreaFrom != null) {
                where.append(" AND ra.value >= " + rentAreaFrom + " ");
            }
            if (rentAreaTo != null) {
                where.append(" AND ra.value <= " + rentAreaTo + " ");
            }

            where.append(" ) ");
        }

        Long rentPriceTo = buildingSearchRequest.getRentPriceTo();
        Long rentPriceFrom = buildingSearchRequest.getRentPriceFrom();

        if (rentPriceFrom != null || rentPriceTo != null) {

            if (rentPriceFrom != null) {
                where.append(" AND b.rentprice >= " + rentPriceFrom + " ");
            }
            if (rentPriceTo != null) {
                where.append(" AND b.rentprice <= " + rentPriceTo + " ");
            }

        }

        if (buildingSearchRequest.getTypeCode() != null && !buildingSearchRequest.getTypeCode().isEmpty()) {

            where.append(" AND (");
            String sql = buildingSearchRequest.getTypeCode().stream().map(it -> "b.type LIKE " + "'%" + it + "%' ")
                    .collect(Collectors.joining(" OR "));
            where.append(sql + " ) ");
        }
    }

    @Override
    public List<BuildingEntity> searchBuilding(MyUserDetail userDetail, BuildingSearchRequest buildingSearchRequest, Pageable pageable) {

        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b");

        joinTable(userDetail, buildingSearchRequest, sql);

        StringBuilder where = new StringBuilder(" WHERE 1 = 1 ");
        queryNormal(buildingSearchRequest, where);
        querySpecial(userDetail, buildingSearchRequest, where);

        sql.append(where);

        sql.append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());

        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);

        return query.getResultList();
    }

    public Integer totalSearchItems(MyUserDetail userDetail, BuildingSearchRequest buildingSearchRequest){
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b");

        joinTable(userDetail, buildingSearchRequest, sql);

        StringBuilder where = new StringBuilder(" WHERE 1 = 1 ");
        queryNormal(buildingSearchRequest, where);
        querySpecial(userDetail, buildingSearchRequest, where);

        sql.append(where);

        where.append(" GROUP BY b.id;");

        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);

        return query.getResultList().size();
    }

}