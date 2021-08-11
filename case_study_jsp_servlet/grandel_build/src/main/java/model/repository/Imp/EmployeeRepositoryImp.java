package model.repository.Imp;

import model.bean.Employee.Employee;
import model.repository.EmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImp implements EmployeeRepository {
    BaseRepository baseRepository;

    @Override
    public List<Employee> getList() {
        List<Employee> employeeList = new ArrayList<>();
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        ResultSet resultSet = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement("select employee_id ,employee_name, employee_birthdat, employee_id_card, employee_salary,\n" +
                        "\t\t\temployee_phone, employee_email, employee_adress, position_name, education_degree_name, division_name\n" +
                        "from employee e inner join position p on e.position_id = p.position_id\n" +
                        "\t\t\t\tinner join education_degree ed on e.education_degree_id = ed.education_degree_id\n" +
                        "                inner join division d on d.division_id = e.division_id;");
                resultSet = statement.executeQuery();

                Employee employee = null;
                while (resultSet.next()) {

                    int id = resultSet.getInt("employee_id");
                    String name = resultSet.getString("employee_name");
                    String birthDay = resultSet.getString("employee_birthdat");
                    String idCard = resultSet.getString("employee_id_card");
                    Double salary = resultSet.getDouble("employee_salary");
                    String phone = resultSet.getString("employee_phone");
                    String email = resultSet.getString("employee_email");
                    String adress = resultSet.getString("employee_adress");
                    String position_name = resultSet.getString("position_name");
                    String education_degree_name = resultSet.getString("education_degree_name");
                    String division_name = resultSet.getString("division_name");

                    employee = new Employee(id, name, birthDay, idCard, salary, phone, email, adress,position_name , education_degree_name, division_name);
                    employeeList.add(employee);
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
        return employeeList;
    }

    @Override
    public boolean createEmployee(Employee employee) {
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("insert into employee( employee_name, employee_birthdat, employee_id_card, employee_salary,\n" +
                        "\t\t\temployee_phone, employee_email, employee_adress, position_id, education_degree_id, division_id )\n" +
                        " values (?,?,?,?,?,?,?,?,?,?);");
                statement.setString(1, employee.getName());
                statement.setString(2, employee.getBirthDay());
                statement.setString(3, employee.getIdCard());
                statement.setDouble(4, employee.getSalary());
                statement.setString(5, employee.getPhone());
                statement.setString(6, employee.getEmail());
                statement.setString(7, employee.getAddress());
                statement.setString(8, employee.getPosition());
                statement.setString(9, employee.getEducationDegree());
                statement.setString(10, employee.getDivision());
                statement.executeUpdate();
                return true;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public boolean editEmployee(Employee employee) {
        this.baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("update employee\n" +
                    "set employee_name = ?, employee_birthdat = ?, employee_id_card = ?, employee_salary =?,\n" +
                    "\t\t\temployee_phone =? , employee_email =?, employee_adress =?, position_id =?, education_degree_id = ?, division_id = ?\n" +
                    "where employee_id = ?;");

            preparedStatement.setString(1,employee.getName());
            preparedStatement.setString(2, employee.getBirthDay());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setDouble(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhone());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setString(8, employee.getPosition());
            preparedStatement.setString(9, employee.getEducationDegree());
            preparedStatement.setString(10, employee.getDivision());
            preparedStatement.setInt(11, employee.getId());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteEmployee(int id) {
        this.baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement("delete from employee\n" +
                    "where employee_id = ?;");

            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public Employee findById(int id) {
        Employee employee = null;
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        ResultSet resultSet = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement("select employee_id ,employee_name, employee_birthdat, employee_id_card, employee_salary,\n" +
                        "\t\t\temployee_phone, employee_email, employee_adress, position_name, education_degree_name, division_name\n" +
                        "from employee e inner join position p on e.position_id = p.position_id\n" +
                        "\t\t\t\tinner join education_degree ed on e.education_degree_id = ed.education_degree_id\n" +
                        "                inner join division d on d.division_id = e.division_id where employee_id = ?;");
                statement.setInt(1, id);
                resultSet = statement.executeQuery();

                if (resultSet.next()) {

                    String name = resultSet.getString("employee_name");
                    String birthDay = resultSet.getString("employee_birthdat");
                    String idCard = resultSet.getString("employee_id_card");
                    Double salary = resultSet.getDouble("employee_salary");
                    String phone = resultSet.getString("employee_phone");
                    String email = resultSet.getString("employee_email");
                    String adress = resultSet.getString("employee_adress");
                    String position_name = resultSet.getString("position_name");
                    String education_degree_name = resultSet.getString("education_degree_name");
                    String division_name = resultSet.getString("division_name");

                    employee = new Employee(id, name, birthDay, idCard, salary, phone, email, adress,position_name , education_degree_name, division_name);
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
        return employee;
    }
}
