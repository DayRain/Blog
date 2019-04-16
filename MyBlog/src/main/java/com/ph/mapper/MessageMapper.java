package com.ph.mapper;

import com.ph.pojo.Message;

import java.util.List;

public interface MessageMapper {
    //添加一个留言
    Integer addMessageViaName(Message message);

    //删除一个留言
    Integer delMessageViaId(Integer messageId);

    //查找所有留言
    List<Message> queryAllMessages(Integer bloggerId);

    Integer changeToOpen(Integer messageId);

    Integer changeToSecret(Integer messageId);

    List<Message> queryPublicMessages(Integer bloggerId);
}
