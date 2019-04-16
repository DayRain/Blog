package com.ph.service;


import com.ph.pojo.Blogger;

public interface BloggerServices {
    Blogger checkInfo(Blogger blogger);
    Integer updateLoginTime(Blogger blogger);
}
