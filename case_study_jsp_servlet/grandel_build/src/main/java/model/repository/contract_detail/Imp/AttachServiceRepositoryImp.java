package model.repository.contract_detail.Imp;

import model.bean.contract_detail.AttachService;
import model.repository.baseRepository.BaseRepository;
import model.repository.contract_detail.AttachServiceRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AttachServiceRepositoryImp implements AttachServiceRepository {
    private BaseRepository baseRepository;
    @Override
    public List<AttachService> getList() {
        List<AttachService> attachServiceList = new ArrayList<>();
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        ResultSet resultSet = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement("select attach_service_id, attach_service_name, attach_service_cost," +
                        " attach_service_unit, attach_service_status\n" +
                        "from attach_service;")
                        ;
                resultSet = statement.executeQuery();

                AttachService attachService= null;
                while (resultSet.next()) {

                    int id = resultSet.getInt("attach_service_id");
                    String name = resultSet.getString("attach_service_name");
                    double cost = resultSet.getDouble("attach_service_cost");
                    int unit = resultSet.getInt("attach_service_unit");
                    String status = resultSet.getString("attach_service_status");

                    attachService = new AttachService(id, name,unit , cost, status);
                    attachServiceList.add(attachService);
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
        return attachServiceList;
    }
}
