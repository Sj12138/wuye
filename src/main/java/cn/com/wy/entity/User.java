package cn.com.wy.entity;

/**
 * 物业人员实体类
 * userState:由数据库查询出来的为数字，移交给前端判断处理(1:超级管理员 2:管理员 3:物业)
 */
public class User {
    private int userId;
    private String userName;
    private String userNum;
    private String userPwd;
    private int userState;  //权限
    private String userPhone; //电话号码
    private int userAge;
    private String userCard;  //身份证
    private String userAddress; //住址
    private String userSex; //性别
    private Post post; //职位  n -- 1
    private double userHonus;

    public double getUserHonus() {
        return userHonus;
    }

    public void setUserHonus(double userHonus) {
        this.userHonus = userHonus;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserNum() {
        return userNum;
    }

    public void setUserNum(String userNum) {
        this.userNum = userNum;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public int getUserState() {
        return userState;
    }

    public void setUserState(int userState) {
        this.userState = userState;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public int getUserAge() {
        return userAge;
    }

    public void setUserAge(int userAge) {
        this.userAge = userAge;
    }

    public String getUserCard() {
        return userCard;
    }

    public void setUserCard(String userCard) {
        this.userCard = userCard;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userNum='" + userNum + '\'' +
                ", userPwd='" + userPwd + '\'' +
                ", userState=" + userState +
                ", userPhone='" + userPhone + '\'' +
                ", userAge=" + userAge +
                ", userCard='" + userCard + '\'' +
                ", userAddress='" + userAddress + '\'' +
                ", userSex='" + userSex + '\'' +
                ", post=" + post +
                '}';
    }
}
