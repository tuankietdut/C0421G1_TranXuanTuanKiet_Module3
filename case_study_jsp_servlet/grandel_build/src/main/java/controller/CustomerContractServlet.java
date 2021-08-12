package controller;

import model.bean.Service.Service;
import model.service.contract.ContractService;
import model.service.contract.Imp.ContractServiceImp;
import model.service.customer_contract.CustomerContractService;
import model.service.customer_contract.Imp.CustomerContractServiceImp;
import model.service.service_dich_vu.Imp.ServiceServiceImp;
import model.service.service_dich_vu.Imp.ServiceTypeServiceImp;
import model.service.service_dich_vu.ServiceService;
import model.service.service_dich_vu.ServiceTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CustomerContractServlet", urlPatterns = "/customer_contract")
public class CustomerContractServlet extends HttpServlet {
    private final ServiceTypeService serviceTypeService = new ServiceTypeServiceImp();
    private final ServiceService serviceService = new ServiceServiceImp();
    private final CustomerContractService customerContractService = new CustomerContractServiceImp();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Service service = new Service();
        service.setId(Integer.parseInt(request.getParameter("id")));
        service.setTypeService(request.getParameter("serviceType"));
        switch (service.getTypeService()){
            case "1":
                service.setName(request.getParameter("Service_name"));
                service.setArea(Integer.parseInt(request.getParameter("Service_area")));
                service.setCost(Double.parseDouble(request.getParameter("service_cost")));
                service.setMaxPeople(Integer.parseInt(request.getParameter("service_max_people")));
                service.setStandardRoom(request.getParameter("standard_room"));
                service.setDescription(request.getParameter("description_other_convenience"));
                service.setPoolArea(Double.parseDouble(request.getParameter("pool_area")));
                service.setFloor(Integer.parseInt(request.getParameter("number_of_floors")));
                break;
            case "2":
                service.setName(request.getParameter("Service_name"));
                service.setArea(Integer.parseInt(request.getParameter("Service_area")));
                service.setCost(Double.parseDouble(request.getParameter("service_cost")));
                service.setMaxPeople(Integer.parseInt(request.getParameter("service_max_people")));
                service.setStandardRoom(request.getParameter("standard_room"));
                service.setDescription(request.getParameter("description_other_convenience"));
                service.setFloor(Integer.parseInt(request.getParameter("number_of_floors")));
                break;
            case "3":
                service.setName(request.getParameter("Service_name"));
                service.setArea(Integer.parseInt(request.getParameter("Service_area")));
                service.setCost(Double.parseDouble(request.getParameter("service_cost")));
                service.setMaxPeople(Integer.parseInt(request.getParameter("service_max_people")));
                break;
        }

        if (this.serviceService.updateService(service)){
            request.setAttribute("customerContractList", this.customerContractService.getList());
            request.getRequestDispatcher("customer_contract/list.jsp").forward(request, response);
        }else {
            request.setAttribute("msg", "Can not update into");
            int id =Integer.parseInt(request.getParameter("id"));
            request.setAttribute("serviceObject", this.serviceService.findById(id));
            request.setAttribute("serviceType",this.serviceTypeService.getList());
            request.getRequestDispatcher("customer_contract/edit.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "edit":
                int id =Integer.parseInt(request.getParameter("id"));
                request.setAttribute("serviceObject", this.serviceService.findById(id));
                request.setAttribute("serviceType",this.serviceTypeService.getList());
                request.getRequestDispatcher("customer_contract/edit.jsp").forward(request, response);
                break;
            default:
                request.setAttribute("customerContractList", this.customerContractService.getList());
                request.getRequestDispatcher("customer_contract/list.jsp").forward(request, response);
                break;
        }

    }
}
