package com.ph.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Message {
    private Integer messageId;
    private Integer messageBloggerId;
    private String messageEmail;
    private String messageContent;
    private String messageName;
    private Integer messageOpen;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date messageCreateTime;

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public Integer getMessageBloggerId() {
        return messageBloggerId;
    }

    public void setMessageBloggerId(Integer messageBloggerId) {
        this.messageBloggerId = messageBloggerId;
    }

    public String getMessageEmail() {
        return messageEmail;
    }

    public void setMessageEmail(String messageEmail) {
        this.messageEmail = messageEmail;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public String getMessageName() {
        return messageName;
    }

    public void setMessageName(String messageName) {
        this.messageName = messageName;
    }

    public Integer getMessageOpen() {
        return messageOpen;
    }

    public void setMessageOpen(Integer messageOpen) {
        this.messageOpen = messageOpen;
    }

    public Date getMessageCreateTime() {
        return messageCreateTime;
    }

    public void setMessageCreateTime(Date messageCreateTime) {
        this.messageCreateTime = messageCreateTime;
    }

    @Override
    public String toString() {
        return "Message{" +
                "messageId=" + messageId +
                ", messageBloggerId=" + messageBloggerId +
                ", messageEmail='" + messageEmail + '\'' +
                ", messageContent='" + messageContent + '\'' +
                ", messageName='" + messageName + '\'' +
                ", messageOpen=" + messageOpen +
                ", messageCreateTime=" + messageCreateTime +
                '}';
    }
}
