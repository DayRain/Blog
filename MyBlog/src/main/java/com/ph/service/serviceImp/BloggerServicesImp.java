package com.ph.service.serviceImp;

import com.ph.mapper.BloggerMapper;
import com.ph.pojo.Blogger;
import com.ph.service.BloggerServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("bloggerServicesImp")
public class BloggerServicesImp implements BloggerServices {
    @Autowired
    private BloggerMapper bloggerMapper;
    @Override
    public Blogger checkInfo(Blogger blogger) {
        return bloggerMapper.checkInfo(blogger);
    }

    @Override
    public Integer updateLoginTime(Blogger blogger) {
        return bloggerMapper.updateLoginTime(blogger);
    }
}
