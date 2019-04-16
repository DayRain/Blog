package com.ph.service;

import com.ph.pojo.Message;
import org.omg.PortableInterceptor.INACTIVE;

import java.util.List;

public interface MessageServices {
    Integer insertMessage(Message message);

    List<Message> queryAllViaBloggerId(Integer bloggerId);

    Integer delMessageViaId(Integer messageId);

    Integer changeToOpen(Integer messageId);

    Integer changeToSecret(Integer messageId);

    //查询所有公开的的留言
    List<Message> queryPublicViaBloggerId(Integer bloggerId);
}
