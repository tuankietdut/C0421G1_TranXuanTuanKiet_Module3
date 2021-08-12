package model.repository.service_dich_vu.Imp;
import model.bean.Employee.Employee;
import model.bean.Service.Service;
import model.repository.baseRepository.BaseRepository;
import model.repository.service_dich_vu.ServiceRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepositoryImp implements ServiceRepository {
    private BaseRepository baseRepository;
    @Override
    public boolean createService(Service service) {
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("insert into service (service_name, service_area, service_cost, service_max_people, \n" +
                        "standard_room, description_other_convenience, pool_area, number_of_floors, service_type_id)\n" +
                        "values (?, ?, ?, ?, ?, ?, ?, ?, ?);");
                statement.setString(1, service.getName());
                statement.setInt(2, service.getArea());
                statement.setDouble(3, service.getCost());
                statement.setInt(4, service.getMaxPeople());
                statement.setString(5, service.getStandardRoom());
                statement.setString(6, service.getDescription());
                statement.setDouble(7, service.getPoolArea());
                statement.setInt(8, service.getFloor());
                statement.setString(9, service.getTypeService());
                statement.executeUpdate();
                return true;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public List<Service> getList() {
        List<Service> serviceList = new ArrayList<>();
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        ResultSet resultSet = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement("select service_id, service_name\n" +
                        "from service;");
                resultSet = statement.executeQuery();
                Service service = null;
                while (resultSet.next()) {
                    service = new Service();
                    int id = resultSet.getInt("service_id");
                    String name = resultSet.getString("service_name");

                    service.setId(id);
                    service.setName(name);
                    serviceList.add(service);
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
        return serviceList;
    }

    @Override
    public Service findById(int id) {
        Service service = null;
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        ResultSet resultSet = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement("select service_id ,service_name, service_area, service_cost, service_max_people, \n" +
                        "standard_room, description_other_convenience, pool_area, number_of_floors, service_type_id\n" +
                        "from service\n" +
                        "where service_id = ?;");
                statement.setInt(1, id);
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    int idService = resultSet.getInt("service_id");
                    String name = resultSet.getString("service_name");
                    int  service_area = resultSet.getInt("service_area");
                    double service_cost = resultSet.getDouble("service_cost");
                    int service_max_people = resultSet.getInt("service_max_people");
                    String standard_room = resultSet.getString("standard_room");
                    String description_other_convenience = resultSet.getString("description_other_convenience");
                    double pool_area = resultSet.getDouble("pool_area");
                    int number_of_floors = resultSet.getInt("number_of_floors");
                    String service_type_id = resultSet.getString("service_type_id");

                    service = new Service(idService, name, service_area, service_cost, service_max_people, standard_room, description_other_convenience, pool_area, number_of_floors, service_type_id);
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
        return service;
    }

    @Override
    public boolean updateService(Service service) {
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("update service\n" +
                        "set service_name = ?, service_area =? , service_cost = ?, service_max_people = ?,\n" +
                        "\tstandard_room = ?, description_other_convenience = ?, pool_area =?, number_of_floors = ?, service_type_id = ?\n" +
                        "where service_id = ?;");
                statement.setString(1, service.getName());
                statement.setInt(2, service.getArea());
                statement.setDouble(3, service.getCost());
                statement.setInt(4, service.getMaxPeople());
                statement.setString(5, service.getStandardRoom());
                statement.setString(6, service.getDescription());
                statement.setDouble(7, service.getPoolArea());
                statement.setInt(8, service.getFloor());
                statement.setString(9, service.getTypeService());
                statement.setInt(10, service.getId());
                statement.executeUpdate();
                return true;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return false;

    }
}
