package controller;

import model.bean.Employee.Employee;
import model.service.employee.DivisionService;
import model.service.employee.EducationService;
import model.service.employee.EmployeeService;
import model.service.employee.Imp.DivisionServiceImp;
import model.service.employee.Imp.EducationServiceImp;
import model.service.employee.Imp.EmployeeServiceImp;
import model.service.employee.Imp.PositionServiceImp;
import model.service.employee.PositionService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    private PositionService positionService = new PositionServiceImp();
    private DivisionService divisionService = new DivisionServiceImp();
    private EducationService educationService = new EducationServiceImp();
    private EmployeeService employeeService = new EmployeeServiceImp();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                createEmployee(request, response);
                break;
            case "edit":
                editEmployee(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                showCreat(request, response);
                break;
            case "edit":
                showEdit(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            default:
                showList(request, response);
                break;
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response){
            request.setAttribute("employeeList", this.employeeService.getList());
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("employee/list.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException exception) {
                exception.printStackTrace();
            }
    }

    private void showCreat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
            request.setAttribute("positionList", this.positionService.getList());
            request.setAttribute("educationList", this.educationService.getList());
            request.setAttribute("divisionList", this.divisionService.getList());
            request.getRequestDispatcher("employee/create.jsp").forward(request, response);
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("employee", this.employeeService.findById(id));
        request.setAttribute("positionList", this.positionService.getList());
        request.setAttribute("educationList", this.educationService.getList());
        request.setAttribute("divisionList", this.divisionService.getList());
        try {
            request.getRequestDispatcher("employee/edit.jsp").forward(request, response);
        } catch (IOException exception) {
            exception.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response){
        int id =Integer.parseInt(request.getParameter("id"));
        if (this.employeeService.deleteEmployee(id)){
            try {
                response.sendRedirect("/employee");
            } catch (IOException exception) {
                exception.printStackTrace();
            }
        }else {
            request.setAttribute("msg", "Can not");
            try {
                request.getRequestDispatcher("employee/list.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException exception) {
                exception.printStackTrace();
            }
        }
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response){
        Employee employee = null;
        String name = request.getParameter("nameEmployee");
        String birthDay = request.getParameter("birthDay");
        String idCard = request.getParameter("idCard");
        Double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String mail = request.getParameter("mail");
        String address = request.getParameter("address");
        String position = request.getParameter("position");
        String education = request.getParameter("education");
        String division = request.getParameter("division");

        employee = new Employee(name, birthDay, idCard, salary, phone, mail, address, position, education, division);

        if (this.employeeService.createEmployee(employee)){
            try {
                response.sendRedirect("/employee");
            } catch (IOException exception) {
                exception.printStackTrace();
            }
        }else {
            request.setAttribute("msg","Can not");
            try {
                request.getRequestDispatcher("employee/create.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException exception) {
                exception.printStackTrace();
            }
        }
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response){
        Employee employee = null;

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("nameEmployee");
        String birthDay = request.getParameter("birthDay");
        String idCard = request.getParameter("idCard");
        Double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String mail = request.getParameter("mail");
        String address = request.getParameter("address");
        String position = request.getParameter("position");
        String education = request.getParameter("education");
        String division = request.getParameter("division");

        employee = new Employee(id, name, birthDay, idCard, salary, phone, mail, address, position, education, division);
        if (this.employeeService.editEmployee(employee)){
            try {
                response.sendRedirect("/employee");
            } catch (IOException exception) {
                exception.printStackTrace();
            }
        }else {
            request.setAttribute("employee", this.employeeService.findById(id));
            request.setAttribute("msg","Can not");
            try {
                request.getRequestDispatcher("employee/edit.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException exception) {
                exception.printStackTrace();
            }
        }
    }
}
