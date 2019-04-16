package com.ph.service.serviceImp;

import com.ph.mapper.MessageMapper;
import com.ph.pojo.Message;
import com.ph.service.MessageServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServicesImp implements MessageServices {
    @Autowired
    MessageMapper messageMapper;
    @Override
    public Integer insertMessage(Message message) {
        return messageMapper.addMessageViaName(message);
    }

    @Override
    public List<Message> queryAllViaBloggerId(Integer bloggerId) {
        return messageMapper.queryAllMessages(bloggerId);
    }

    @Override
    public Integer delMessageViaId(Integer messageId) {
        return messageMapper.delMessageViaId(messageId);
    }

    @Override
    public Integer changeToOpen(Integer messageId) {
        return messageMapper.changeToOpen(messageId);
    }

    @Override
    public Integer changeToSecret(Integer messageId) {

        return messageMapper.changeToSecret(messageId);
    }

    @Override
    public List<Message> queryPublicViaBloggerId(Integer bloggerId) {
        return messageMapper.queryPublicMessages(bloggerId);
    }
}
