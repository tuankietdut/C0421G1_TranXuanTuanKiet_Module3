package model.repository.imp;

import model.bean.User;
import model.repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImp implements IUserRepository {
    private BaseRepository baseRepository;

    @Override
    // Thay bang call SP bai-tap-1
    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall("call find_all_user();");
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
            callableStatement.close();
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

    // Thay bang call SP bai-tap-1
    @Override
    public boolean edit(User user) {
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall("call edit_user(?, ?, ?, ?);");
            callableStatement.setInt(1, user.getId());
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());
            callableStatement.executeUpdate();
            baseRepository.getConnection().close();
            return true;
        } catch (SQLException throttles) {
            throttles.printStackTrace();
        }
        return false;
    }

    // Thay bang call SP bai-tap-1
    @Override
    public boolean delete(int id) {
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall("call delete_user(?);");
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
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

    @Override
    public List<User> getUserById(int id) {
        List<User> userList = new ArrayList<>();
        this.baseRepository = new BaseRepository();
        try {
            CallableStatement callableStatement = this.baseRepository.getConnection()
                    .prepareCall("call find_by_id(?);");
            callableStatement.setInt(1, id);
            ResultSet resultSet = callableStatement.executeQuery();
            if (resultSet.next()) {
                User user = new User();
                user.setId(id);
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
            callableStatement.close();
            this.baseRepository.getConnection().close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    //Thuc hanh
    @Override
    public boolean insertUser(User user) {
        this.baseRepository = new BaseRepository();
        try {
            CallableStatement callableStatement = this.baseRepository.getConnection().
                    prepareCall("call insert_user (? , ?, ?);");
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.executeUpdate();
            return true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    //Thuc hanh + bai tap
    @Override
    public void addUserTransaction(User user, int[] permission) {
        this.baseRepository = new BaseRepository();
        PreparedStatement preparedStatement = null;
        PreparedStatement preparedStatementAssign = null;
        ResultSet resultSet = null;

        try {
            this.baseRepository.getConnection().setAutoCommit(false);
            preparedStatement = this.baseRepository.getConnection().
                    prepareStatement("insert into users (`name`, email, country)\n" +
                            "values (?, ? , ?);", Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            int row = preparedStatement.executeUpdate();
            resultSet = preparedStatement.getGeneratedKeys();
            int idUser = 0;
            if (resultSet.next()) {
                idUser = resultSet.getInt(1);
                if (row == 1) {
                    preparedStatementAssign = this.baseRepository.getConnection().
                            prepareStatement("insert into user_permision (permision_id, user_id)\n" +
                                    "values (?, ? );");
                    for (int element : permission) {
                        preparedStatementAssign.setInt(1, idUser);
                        preparedStatementAssign.setInt(2, element);
                        preparedStatementAssign.executeUpdate();
                    }
                    this.baseRepository.getConnection().commit();
                } else {
                    this.baseRepository.getConnection().rollback();
                }
            }
        } catch (SQLException throwables) {
            try {
                if (this.baseRepository.getConnection() != null) {
                    this.baseRepository.getConnection().rollback();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (preparedStatementAssign != null) {
                    preparedStatementAssign.close();
                }
                if (this.baseRepository.getConnection() != null) {
                    this.baseRepository.getConnection().close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }


    //Thuc hanh
    @Override
    public boolean insertUpdateUseTransaction() {
        this.baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();
        try {
            connection.setAutoCommit(false);
            Statement statement = connection.createStatement();
            statement.execute("drop table if exists permision;");
            statement.execute("create table permision (\n" +
                    "id int primary key ,\n" +
                    "`name` varchar(50)\n" +
                    ");");

            PreparedStatement preparedStatementInsert = connection.
                    prepareStatement("insert into permision (id ,`name`)\n" +
                            "values (? ,?);");
            preparedStatementInsert.setInt(1, 1);
//            Transaction Fail
//            preparedStatementInsert.setString(1,"Xuân");
            preparedStatementInsert.setString(2, "Xuân");
            preparedStatementInsert.executeUpdate();

            PreparedStatement preparedStatementUpdate = connection.
                    prepareStatement("update permision\n" +
                            "set `name` = ?\n" +
                            "where id = ?;");
            preparedStatementUpdate.setString(1, "Tien");
            preparedStatementUpdate.setInt(2, 1);
            preparedStatementUpdate.executeUpdate();

            connection.commit();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
