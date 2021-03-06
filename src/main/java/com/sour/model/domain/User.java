package com.sour.model.domain;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 * 用户实体类
 *
 * @author nndmw
 * @date 2021/09/03
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@Table(name = "sour_user")
public class User implements Serializable {

    private static final long serialVersionUID = 3677854605438638244L;

    /**
     * 编号
     */
    @Id
    @GeneratedValue
    private Long userId;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 显示名称
     */
    private String userDisplayName;

    /**
     * 密码
     */
    private String userPass;

    /**
     * 邮箱
     */
    private String userEmail;

    /**
     * 头像
     */
    private String userAvatar;

    /**
     * 说明
     */
    private String userDesc;

    /**
     * 是否禁用登录
     */
    private String loginEnable;

    /**
     * 最后一次登录时间
     */
    private Date loginLast;

    /**
     * 登录错误次数记录
     */
    private Integer loginError;

    /*@Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) {
            return false;
        }
        User user = (User) o;
        return Objects.equals(userId, user.userId);
    }

    @Override
    public int hashCode() {
        return 0;
    }*/

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        User user = (User) o;
        return Objects.equals(userId, user.userId) &&
                Objects.equals(userName, user.userName) &&
                Objects.equals(userDisplayName, user.userDisplayName) &&
                Objects.equals(userPass, user.userPass) &&
                Objects.equals(userEmail, user.userEmail) &&
                Objects.equals(userAvatar, user.userAvatar) &&
                Objects.equals(userDesc, user.userDesc) &&
                Objects.equals(loginEnable, user.loginEnable) &&
                Objects.equals(loginLast, user.loginLast) &&
                Objects.equals(loginError, user.loginError);
    }

    @Override
    public int hashCode() {
        return Objects.hash(
                userId, userName, userDisplayName, userPass, userEmail,
                userAvatar, userDesc, loginEnable, loginLast, loginError
        );
    }
}
