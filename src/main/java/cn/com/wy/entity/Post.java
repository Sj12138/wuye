package cn.com.wy.entity;

import java.util.List;

/**
 * 职位实体类
 */
public class Post {
    private int postId;
    private String postName;
    private double postSal;  //奖金
    private List<User> userList; //一个职位对应多个人员 1 -- n

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getPostName() {
        return postName;
    }

    public void setPostName(String postName) {
        this.postName = postName;
    }

    public double getPostSal() {
        return postSal;
    }

    public void setPostSal(double postSal) {
        this.postSal = postSal;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    @Override
    public String toString() {
        return "Post{" +
                "postId=" + postId +
                ", postName='" + postName + '\'' +
                ", postSal=" + postSal +
                '}';
    }
}
