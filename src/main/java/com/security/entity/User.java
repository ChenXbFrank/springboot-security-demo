package com.security.entity;

import javax.persistence.*;
import java.util.*;


@Entity
@Table(name = "Sys_User", schema = "springsecurity", catalog = "")
public class User {
    private int id;
    private String username;
    private String password;
    private List<Role> roles = new ArrayList<>();


    /**
     * @ManyToMany 表示多对多关系，fetch = FetchType.EAGER配置懒加载策略为立即加载，因为多对多涉及到树形结构的第二层，
     * 使用懒加载会在使用roles对象时才去数据库查询，但是在本项目中会出现no session，暂时无法解决，所以加上次配置
     *
     * @JoinTable  name:中间表名， @joinColumn : name:在中间表中对应外键名,referencedColumnName在原先表中的主键名
     *
     * inverseJoinColumns中的@joinColumn : name:多的另一方在中间表中对应的主键名,referencedColumnName在原先表中的主键名
     *
     * 此处的配置表明user和role的多对多关系由user维护
     */
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "Sys_Role_User", joinColumns = {@JoinColumn(name = "Sys_User_id", referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "Sys_Role_id", referencedColumnName = "id")})
    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }


    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id == user.id &&
                Objects.equals(username, user.username) &&
                Objects.equals(password, user.password);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, username, password);
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", roles=" + roles +
                '}';
    }
}
