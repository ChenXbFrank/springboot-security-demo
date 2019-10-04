package com.security;

import com.security.dao.UserDao;
import com.security.entity.Permission;
import com.security.entity.Role;
import com.security.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.transaction.Transactional;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SecurityApplicationTests {

    @Autowired
    UserDao userDao;

    @Test
    @Transactional
    public void contextLoads() {
        User admin = userDao.findByUsername("admin");
        List<Role> roles = admin.getRoles();
        for (Role role :
                roles) {
            List<Permission> permissions = role.getPermissions();
            System.out.println(role.getName() + "的权限为：");
            for (Permission permission :
                    permissions) {
                System.out.println(permission.toString());
            }
        }
    }

}
