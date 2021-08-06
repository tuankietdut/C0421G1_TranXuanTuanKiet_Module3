package model.repository;

import model.bean.User;

import java.util.List;

public interface IUserRepository {
    List<User> findAll();
    User findById(int id);
    boolean edit(User user);
    boolean delete(int id);
    boolean add(User user);
    List<User> findByCountry(String nameCountry);
    List<User> orderBy();
}
