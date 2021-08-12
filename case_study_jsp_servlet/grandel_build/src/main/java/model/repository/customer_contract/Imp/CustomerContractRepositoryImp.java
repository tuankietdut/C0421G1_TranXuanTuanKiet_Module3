package model.repository.customer_contract.Imp;

import model.bean.CustomerContract;
import model.bean.contract.Contract;
import model.repository.baseRepository.BaseRepository;
import model.repository.customer_contract.CustomerContractRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerContractRepositoryImp implements CustomerContractRepository {
    private BaseRepository baseRepository;
    @Override
    public List<CustomerContract> getList() {
        List<CustomerContract> customerContractList = new ArrayList<>();
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        CallableStatement statement = null;
        ResultSet resultSet = null;

        if (connection != null) {
            try {
                statement = connection.prepareCall("call customer_contract();");
                resultSet = statement.executeQuery();

                CustomerContract customerContract= null;
                while (resultSet.next()) {

                    String customer_name = resultSet.getString("customer_name");
                    String service_name = resultSet.getString("service_name");
                    String attach_service_name = resultSet.getString("attach_service_name");
                    int quantity = resultSet.getInt("quantity");
                    int service_id = resultSet.getInt("service_id");

                    customerContract = new CustomerContract(customer_name, service_name, attach_service_name, quantity, service_id);
                    customerContractList.add(customerContract);
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
        return customerContractList;
    }
}
