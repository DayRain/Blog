package com.ph.mapper;

import com.ph.pojo.Blogger;

import java.util.Date;

public interface BloggerMapper {

//    验证信息，返回Blogger对象
    Blogger checkInfo(Blogger blogger);
    //退出前，记录本次登录时间
    Integer updateLoginTime(Blogger blogger);
}
