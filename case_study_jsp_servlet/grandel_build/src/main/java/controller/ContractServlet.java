package controller;

import model.bean.contract.Contract;
import model.service.contract.ContractService;
import model.service.customer.CustomerService;
import model.service.employee.EmployeeService;
import model.service.contract.Imp.ContractServiceImp;
import model.service.customer.Imp.CustomerServiceImp;
import model.service.employee.Imp.EmployeeServiceImp;
import model.service.service_dich_vu.Imp.ServiceServiceImp;
import model.service.service_dich_vu.ServiceService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ContractServlet", urlPatterns = "/contract")
public class ContractServlet extends HttpServlet {
    private EmployeeService employeeService = new EmployeeServiceImp();
    private ServiceService serviceService = new ServiceServiceImp();
    private CustomerService customerService = new CustomerServiceImp();
    private ContractService contractService = new ContractServiceImp();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        Double deposit = Double.parseDouble(request.getParameter("deposit"));
        Double total = Double.parseDouble(request.getParameter("total"));
        String employeeId = request.getParameter("employeeId");
        String serviceId = request.getParameter("serviceId");
        String customerId = request.getParameter("customerId");
        Contract contract = new Contract(startDate, endDate, deposit, total, employeeId,customerId, serviceId);

        if (this.contractService.createContract(contract)){
            request.setAttribute("msg", "Success");
        }else {
            request.setAttribute("msg", "Can not");
        }
        request.setAttribute("employeeList", this.employeeService.getList());
        request.setAttribute("serviceList",this.serviceService.getList());
        request.setAttribute("customerList", this.customerService.getList());
        request.getRequestDispatcher("contract/create.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("employeeList", this.employeeService.getList());
        request.setAttribute("serviceList",this.serviceService.getList());
        request.setAttribute("customerList", this.customerService.getList());
        request.getRequestDispatcher("contract/create.jsp").forward(request, response);
    }
}
