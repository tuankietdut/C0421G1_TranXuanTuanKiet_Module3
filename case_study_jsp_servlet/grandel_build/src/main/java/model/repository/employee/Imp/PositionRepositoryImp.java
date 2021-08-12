package model.repository.employee.Imp;
import model.bean.Employee.Position;
import model.repository.baseRepository.BaseRepository;
import model.repository.employee.PositionRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepositoryImp implements PositionRepository {
    private BaseRepository baseRepository;

    @Override
    public List<Position> getList() {
        List<Position> positionList = new ArrayList<>();
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        ResultSet resultSet = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement("SELECT position_id,position_name\n" +
                        "FROM position;");
                resultSet = statement.executeQuery();

                Position position = null;
                while (resultSet.next()) {

                    int id = resultSet.getInt("position_id");
                    String name = resultSet.getString("position_name");

                    position = new Position(id, name);
                    positionList.add(position);
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
        return positionList;
    }
}
