package model.repository.customer.Imp;

import model.bean.Customer.CustomerType;
import model.repository.baseRepository.BaseRepository;
import model.repository.customer.CustomerTypeRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepositoryImp implements CustomerTypeRepository {
    private BaseRepository baseRepository;
    @Override
    public List<CustomerType> getList() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        ResultSet resultSet = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement("select customer_type_id, customer_type_name\n" +
                        "from customer_type;");
                resultSet = statement.executeQuery();

                CustomerType customerType = null;
                while (resultSet.next()) {

                    int id = resultSet.getInt("customer_type_id");
                    String name = resultSet.getString("customer_type_name");

                    customerType = new CustomerType(id, name);
                    customerTypeList.add(customerType);
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
        return customerTypeList;

    }
}
