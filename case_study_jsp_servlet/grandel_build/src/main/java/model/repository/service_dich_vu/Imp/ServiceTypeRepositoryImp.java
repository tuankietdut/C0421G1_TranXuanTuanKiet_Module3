package model.repository.service_dich_vu.Imp;
import model.bean.Service.ServiceType;
import model.repository.baseRepository.BaseRepository;
import model.repository.service_dich_vu.ServiceTypeRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceTypeRepositoryImp implements ServiceTypeRepository {
    private BaseRepository baseRepository;
    @Override
    public List<ServiceType> getList() {
        List<ServiceType> serviceTypeList = new ArrayList<>();
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        ResultSet resultSet = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement("select service_type_id, service_type_name \n" +
                        "from service_type;");
                resultSet = statement.executeQuery();

                ServiceType serviceType = null;
                while (resultSet.next()) {

                    int id = resultSet.getInt("service_type_id");
                    String name = resultSet.getString("service_type_name");

                    serviceType = new ServiceType(id, name);
                    serviceTypeList.add(serviceType);
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
        return serviceTypeList;

    }
}
