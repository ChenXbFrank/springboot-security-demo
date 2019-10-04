package com.security.dao;

import com.security.entity.Permission;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface PermissionDao extends JpaRepository<Permission,Integer> {

}
