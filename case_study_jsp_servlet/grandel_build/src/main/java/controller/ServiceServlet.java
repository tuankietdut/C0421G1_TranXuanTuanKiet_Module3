package controller;

import model.bean.Service.Service;
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

@WebServlet(name = "ServiceServlet", urlPatterns = "/service")

public class ServiceServlet extends HttpServlet {
    private ServiceService serviceService = new ServiceServiceImp();
    private ServiceTypeService serviceTypeService = new ServiceTypeServiceImp();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Service service = new Service();

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

        if (this.serviceService.createService(service)){
            request.setAttribute("serviceType", this.serviceTypeService.getList());
            request.setAttribute("msg", "Insert into success");
            request.getRequestDispatcher("service/create.jsp").forward(request, response);
        }else {
            request.setAttribute("serviceType", this.serviceTypeService.getList());
            request.setAttribute("msg", "Can not insert into");
            request.getRequestDispatcher("service/create.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("serviceType", this.serviceTypeService.getList());
        request.getRequestDispatcher("service/create.jsp").forward(request, response);
    }
}
