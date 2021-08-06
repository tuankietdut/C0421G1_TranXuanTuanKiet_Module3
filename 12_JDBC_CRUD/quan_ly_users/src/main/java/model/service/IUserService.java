package model.service;

import model.bean.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();
    User findById(int id);
    boolean edit(User user);
    boolean delete(int id);
    boolean add(User user);
    List<User> findByCountry(String nameCountry);
    List<User> orderBy();
}
