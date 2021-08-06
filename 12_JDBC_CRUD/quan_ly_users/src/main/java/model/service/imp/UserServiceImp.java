package model.service.imp;

import model.bean.User;
import model.repository.IUserRepository;
import model.repository.imp.UserRepositoryImp;
import model.service.IUserService;

import java.util.List;

public class UserServiceImp implements IUserService {
    private IUserRepository iUserRepository = new UserRepositoryImp();
    @Override
    public List<User> findAll() {
        return iUserRepository.findAll();
    }

    @Override
    public User findById(int id) {
        return this.iUserRepository.findById(id);
    }

    @Override
    public boolean edit(User user) {
        if (user.getName().matches("[A-Za-z ]+")){
            return this.iUserRepository.edit(user);
        }
       return false;
    }

    @Override
    public boolean delete(int id) {
        return this.iUserRepository.delete(id);
    }

    @Override
    public boolean add(User user) {
        return this.iUserRepository.add(user);
    }

    @Override
    public List<User> findByCountry(String nameCountry) {
        return this.iUserRepository.findByCountry(nameCountry);
    }

    @Override
    public List<User> orderBy() {
        return this.iUserRepository.orderBy();
    }
}
