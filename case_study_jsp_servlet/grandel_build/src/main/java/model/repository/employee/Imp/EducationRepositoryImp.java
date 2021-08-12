package model.repository.employee.Imp;

import model.bean.Employee.Education;
import model.repository.baseRepository.BaseRepository;
import model.repository.employee.EducationRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationRepositoryImp implements EducationRepository {
    private BaseRepository baseRepository;

    @Override
    public List<Education> getList() {
        List<Education> educationList = new ArrayList<>();
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        ResultSet resultSet = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement("SELECT education_degree_id,education_degree_name\n" +
                        "FROM education_degree;");
                resultSet = statement.executeQuery();

                Education education = null;
                while (resultSet.next()) {

                    int id = resultSet.getInt("education_degree_id");
                    String name = resultSet.getString("education_degree_name");

                    education = new Education(id, name);
                    educationList.add(education);
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
        return educationList;

    }
}
