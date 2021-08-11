package controller;

import model.service.Imp.ServiceTypeServiceImp;
import model.service.ServiceTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServiceServlet", urlPatterns = "/service")
public class ServiceServlet extends HttpServlet {
    private ServiceTypeService serviceTypeService = new ServiceTypeServiceImp();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("serviceType", this.serviceTypeService.getList());
        request.getRequestDispatcher("service/create.jsp").forward(request, response);
    }
}
