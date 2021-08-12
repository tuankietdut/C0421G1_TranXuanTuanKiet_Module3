package model.repository.contract.Imp;

import model.bean.contract.Contract;
import model.bean.contract_detail.AttachService;
import model.repository.baseRepository.BaseRepository;
import model.repository.contract.ContractRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractRepositoryImp implements ContractRepository {
    private BaseRepository baseRepository;
    @Override
    public boolean createContract(Contract contract) {
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("insert into contract (contract_start_date, contract_end_date," +
                        " contract_deposit, contract_total_money, employee_id, service_id, customer_id)\n" +
                        "values (?, ?, ?, ?, ? , ?, ?);");
                statement.setString(1, contract.getStartDate());
                statement.setString(2, contract.getEndDate());
                statement.setDouble(3, contract.getDeposit());
                statement.setDouble(4, contract.getTotal());
                statement.setString(5, contract.getEmployee());
                statement.setString(6, contract.getService());
                statement.setString(7, contract.getCustomer());
                statement.executeUpdate();
                return true;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public List<Contract> getList() {
        List<Contract> contractList = new ArrayList<>();
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        ResultSet resultSet = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement("select contract_id, contract_start_date, contract_end_date," +
                        " contract_deposit, contract_total_money, employee_id, service_id, customer_id\n" +
                        "from contract;");
                resultSet = statement.executeQuery();

                Contract contract= null;
                while (resultSet.next()) {

                    int id = resultSet.getInt("contract_id");
                    String start_date = resultSet.getString("contract_start_date");
                    String end_date = resultSet.getString("contract_end_date");
                    double deposit = resultSet.getDouble("contract_deposit");
                    double total = resultSet.getDouble("contract_total_money");
                    String employeeId = resultSet.getString("employee_id");
                    String serviceId = resultSet.getString("service_id");
                    String customerId = resultSet.getString("customer_id");


                    contract = new Contract(id, start_date, end_date , deposit,  total, employeeId, customerId, serviceId);
                    contractList.add(contract);
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
        return contractList;
    }
}
