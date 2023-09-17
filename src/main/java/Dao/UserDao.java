package Dao;

import Model.User;

public interface UserDao {
    public boolean registerUser(User user);
    public User loginUser(String email, String password);
}
