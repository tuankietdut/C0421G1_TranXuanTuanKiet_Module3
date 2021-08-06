package model.repository.imp;
import model.bean.User;
import model.repository.IUserRepository;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImp implements IUserRepository {
    private BaseRepository baseRepository;

    @Override
    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        baseRepository = new BaseRepository();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(
                    "select id, `name`, email, country\n" +
                            "from users;"
            );
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
            preparedStatement.close();
            baseRepository.getConnection().close();
        } catch (SQLException throwaways) {
            throwaways.printStackTrace();
        }
        return userList;
    }

    @Override
    public User findById(int id) {
        User user = null;
        baseRepository = new BaseRepository();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().
                    prepareStatement("select id, `name`, email, country\n" +
                            "from users\n" +
                            "where id = ?;");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
            }
            preparedStatement.close();
            baseRepository.getConnection().close();
        } catch (SQLException throttles) {
            throttles.printStackTrace();
        }
        return user;
    }

    @Override
    public boolean edit(User user) {
        baseRepository = new BaseRepository();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().
                    prepareStatement("update users\n" +
                            "set `name` = ? , email = ?, country =?\n" +
                            "where id = ?;");
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setInt(4, user.getId());
            preparedStatement.executeUpdate();
            preparedStatement.close();
            baseRepository.getConnection().close();
            return true;
        } catch (SQLException throttles) {
            throttles.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        baseRepository = new BaseRepository();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().
                    prepareStatement("delete from users\n" +
                            "where id = ?;");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            baseRepository.getConnection().close();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean add(User user) {
        baseRepository = new BaseRepository();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().
                    prepareStatement("insert into users ( `name`, email, country)\n" +
                            "values (?, ?, ?);");
//            preparedStatement.setInt(1, user.getId());
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
            preparedStatement.close();
            baseRepository.getConnection().close();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<User> findByCountry(String nameCountry) {
        baseRepository = new BaseRepository();
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().
                    prepareStatement("select id, `name`, email, country\n" +
                            "from users\n" +
                            "where country = ?;");
            preparedStatement.setString(1, nameCountry);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
            preparedStatement.close();
            baseRepository.getConnection().close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    @Override
    public List<User> orderBy() {
        baseRepository = new BaseRepository();
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().
                    prepareStatement("select id, `name`, email, country\n" +
                            "from users\n" +
                            "order by `name`;");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
            preparedStatement.close();
            baseRepository.getConnection().close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }
}
