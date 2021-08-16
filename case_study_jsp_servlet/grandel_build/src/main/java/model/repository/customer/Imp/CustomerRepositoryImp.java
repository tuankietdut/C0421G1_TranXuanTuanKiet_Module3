package model.repository.customer.Imp;

import model.bean.Customer.Customer;
import model.repository.baseRepository.BaseRepository;
import model.repository.customer.CustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImp implements CustomerRepository {
    private BaseRepository baseRepository;

    @Override
    public List<Customer> getList() {
        List<Customer> customerList = new ArrayList<>();
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        ResultSet resultSet = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement("select customer_id, customer_name, customer_birthday, customer_gender," +
                        " customer_id_card, customer_phone, customer_email, customer_adress, customer_type_name, code_customer\n" +
                        "from customer c inner join customer_type ct on c.customer_type_id = ct.customer_type_id;");
                resultSet = statement.executeQuery();

                Customer customer = null;
                while (resultSet.next()) {

                    int id = resultSet.getInt("customer_id");
                    String name = resultSet.getString("customer_name");
                    String birthDay = resultSet.getString("customer_birthday");
                    int gender = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String customer_adress = resultSet.getString("customer_adress");
                    String customer_type_name = resultSet.getString("customer_type_name");
                    String codeCustomer = resultSet.getString("code_customer");

                    customer = new Customer(id, name, birthDay, gender, idCard, phone, email, customer_adress, customer_type_name, codeCustomer);
                    customerList.add(customer);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        return customerList;
    }

    @Override
    public boolean createCustomer(Customer customer) {
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("insert into customer (customer_name, customer_birthday, customer_gender," +
                        " customer_id_card, customer_phone, customer_email, customer_adress, customer_type_id, code_customer)\n" +
                        "values (?, ?, ?, ?, ?, ?, ?, ? ,? );");
                statement.setString(1, customer.getName());
                statement.setString(2, customer.getBirthday());
                statement.setInt(3, customer.getGender());
                statement.setString(4, customer.getIdCard());
                statement.setString(5, customer.getPhone());
                statement.setString(6, customer.getEmail());
                statement.setString(7, customer.getAddress());
                statement.setString(8, customer.getTypeCustomer());
                statement.setString(9, customer.getCodeCustomer());
                statement.executeUpdate();
                return true;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return false;

    }

    @Override
    public boolean editCustomer(Customer customer) {
        this.baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("update customer\n" +
                    "set  customer_name = ?, customer_birthday =?, customer_gender =?, customer_id_card =?," +
                    " customer_phone =?, customer_email =?, customer_adress =?, customer_type_id =?, code_customer =?\n" +
                    "where customer_id = ?;");

            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getBirthday());
            preparedStatement.setInt(3, customer.getGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhone());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setString(8, customer.getTypeCustomer());
            preparedStatement.setString(9, customer.getCodeCustomer());
            preparedStatement.setInt(10, customer.getId());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;

    }

    @Override
    public boolean deleteCustomer(int id) {
        this.baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement("delete from customer\n" +
                    "where customer_id = ?;");

            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;

    }

    @Override
    public Customer findById(int id) {
        Customer customer = null;
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        ResultSet resultSet = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement("select customer_id, customer_name, customer_birthday, customer_gender," +
                        " customer_id_card, customer_phone, customer_email, customer_adress, customer_type_name, code_customer\n" +
                        "from customer c inner join customer_type ct on c.customer_type_id = ct.customer_type_id\n" +
                        "where customer_id = ?;");
                statement.setInt(1, id);
                resultSet = statement.executeQuery();

                if (resultSet.next()) {

                    String name = resultSet.getString("customer_name");
                    String birthDay = resultSet.getString("customer_birthday");
                    int gender = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String customer_adress = resultSet.getString("customer_adress");
                    String customer_type_name = resultSet.getString("customer_type_name");
                    String codeCustomer = resultSet.getString("code_customer");

                    customer = new Customer(id, name, birthDay, gender, idCard, phone, email, customer_adress, customer_type_name, codeCustomer);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        return customer;
    }
}

