package com.myweb.mapper;

import com.myweb.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    //注册
    int insert(User record);

    //查找用户名是否同名
    User findByUserLoginName(String loginName);

    //登录功能
    User userLogin(@Param("loginName") String loginName, @Param("loginPwd") String loginPwd);

    //根据真实姓名查找用户
    User findUserByRealname(String realname);

    //根据uid查找用户
    User findById(Integer uid);

    //保存简历，就是修改个人信息
    int saveResume(User recode);

    //查询所有用户
    List<User> findAllUser();

    //根据用户id删除用户
    int deleteById(Integer uid);

    //计算用户人数
    int countUserNumber();

}
