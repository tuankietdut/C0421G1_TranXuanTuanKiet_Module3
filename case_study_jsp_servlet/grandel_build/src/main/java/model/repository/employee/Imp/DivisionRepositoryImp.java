package model.repository.employee.Imp;

import model.bean.Employee.Division;
import model.repository.baseRepository.BaseRepository;
import model.repository.employee.DivisionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepositoryImp implements DivisionRepository {
    private BaseRepository baseRepository;
    @Override
    public List<Division> getList() {
        List<Division> divisionList = new ArrayList<>();
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        ResultSet resultSet = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement("SELECT division_id,division_name \n" +
                        "FROM division;");
                resultSet = statement.executeQuery();

                Division division= null;
                while (resultSet.next()) {

                    int id = resultSet.getInt("division_id");
                    String name = resultSet.getString("division_name");

                    division = new Division(id, name);
                    divisionList.add(division);
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
        return divisionList;

    }
}
