package controller;

import model.bean.Customer.Customer;
import model.service.CustomerService;
import model.service.CustomerTypeService;
import model.service.Imp.CustomerServiceImp;
import model.service.Imp.CustomerTypeServiceImp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    private CustomerService customerService = new CustomerServiceImp();
    private CustomerTypeService customerTypeService = new CustomerTypeServiceImp();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                createCustomer(request, response);
                break;
            case "edit":
                editCustomer(request, response);
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
                    deleteCustomer(request, response);
                    break;
                default:
                    showList(request, response);
                    break;
            }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response){
        request.setAttribute("customerList", this.customerService.getList());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }

    private void showCreat(HttpServletRequest request, HttpServletResponse response){
        request.setAttribute("customerType", this.customerTypeService.getList());
        try {
            request.getRequestDispatcher("customer/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("customer", this.customerService.findById(id));
        request.setAttribute("customerType", this.customerTypeService.getList());
        try {
            request.getRequestDispatcher("customer/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response){
        Customer customer = null;
        String name = request.getParameter("nameCustomer");
        String birthDay = request.getParameter("birthDay");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String mail = request.getParameter("mail");
        String address = request.getParameter("address");
        String customerType = request.getParameter("customerType");

        customer = new Customer(name, birthDay, gender, idCard, phone,mail, address, customerType);

        if (this.customerService.createCustomer(customer)){
            try {
                response.sendRedirect("/customer");
            } catch (IOException exception) {
                exception.printStackTrace();
            }
        }else {
            request.setAttribute("msg","Can not");
            try {
                request.getRequestDispatcher("customer/create.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException exception) {
                exception.printStackTrace();
            }
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response){
        Customer customer = null;

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("nameCustomer");
        String birthDay = request.getParameter("birthDay");
        String idCard = request.getParameter("idCard");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String phone = request.getParameter("phone");
        String mail = request.getParameter("mail");
        String address = request.getParameter("address");
        String customerType = request.getParameter("customerType");

        customer = new Customer(id, name, birthDay, gender, idCard, phone, mail, address, customerType);
        if (this.customerService.editCustomer(customer)){
            try {
                response.sendRedirect("/customer");
            } catch (IOException exception) {
                exception.printStackTrace();
            }
        }else {
            request.setAttribute("customer", this.customerService.findById(id));
            request.setAttribute("customerType", this.customerTypeService.getList());
            request.setAttribute("msg","Can not");
            try {
                request.getRequestDispatcher("customer/edit.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException exception) {
                exception.printStackTrace();
            }
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        if (this.customerService.deleteCustomer(id)){
            try {
                response.sendRedirect("/customer");
            } catch (IOException exception) {
                exception.printStackTrace();
            }
        }else {
                request.setAttribute("msg", "Can not");
                try {
                    request.getRequestDispatcher("customer/list.jsp").forward(request,response);
                } catch (ServletException e) {
                    e.printStackTrace();
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
        }

    }
}
