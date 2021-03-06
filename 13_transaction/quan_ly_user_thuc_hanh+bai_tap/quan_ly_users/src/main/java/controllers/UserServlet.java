package controllers;
import com.mysql.cj.x.protobuf.MysqlxDatatypes;
import model.bean.User;
import model.service.IUserService;
import model.service.imp.UserServiceImp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = {"/user", ""})
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MysqlxDatatypes.Scalar.String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                editUser(request, response);
                break;
            case "create":
                createUser(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "transaction":
                transaction(request, response);
                break;
            case "addUserPermission":
                addUserPermission(request, response);
                break;
            case "findById":
                findById(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "edit":
                showEdit(request, response);
                break;
            case "create":
                showCreate(request, response);
                break;
            case "findByCountry":
                findByCountry(request, response);
            case "orderBy":
                orderBy(request, response);
                break;
            default:
                showMenu(request, response);
                break;
        }
    }

    private IUserService iUserService = new UserServiceImp();

    private void showMenu(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("userList", this.iUserService.findAll());
        try {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("user", this.iUserService.findById(id));
        try {
            request.getRequestDispatcher("edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = this.iUserService.findById(id);
        String name = request.getParameter("nameUser");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        user.setName(name);
        user.setEmail(email);
        user.setCountry(country);

        if (this.iUserService.edit(user)) {
            request.setAttribute("msg", "Success");
            request.setAttribute("userList", this.iUserService.findAll());
            try {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException exception) {
                exception.printStackTrace();
            }
        } else {
            request.setAttribute("user", user);
            request.setAttribute("msg", "Can`t edit");
            try {
                request.getRequestDispatcher("edit.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException exception) {
                exception.printStackTrace();
            }
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
//        User user = this.iUserService.findById(this.iUserService.findAll().size() - 1);
//        request.setAttribute("id", user.getId() + 2);
        try {
            request.getRequestDispatcher("create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("nameUser");
        String email = request.getParameter("emailUser");
        String country = request.getParameter("countryUser");


        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setCountry(country);

        //        S??? d???ng insertUser = store procedure
        if (this.iUserService.insertUser(user)) {
            try {
                response.sendRedirect("/user");
            } catch (IOException exception) {
                exception.printStackTrace();
            }
        } else {
                request.setAttribute("msg", "Can`t create");
                try {
                    request.getRequestDispatcher("create.jsp").forward(request, response);
                } catch (ServletException e) {
                    e.printStackTrace();
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        if (this.iUserService.delete(id)) {
            request.setAttribute("msg", "Success delete");
            request.setAttribute("userList", this.iUserService.findAll());
            try {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException exception) {
                exception.printStackTrace();
            }
        }else {
            request.setAttribute("msg", "Can`t delete");
            request.setAttribute("userList", this.iUserService.findAll());
            try {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException exception) {
                exception.printStackTrace();
            }
        }
    }

    private void findByCountry(HttpServletRequest request, HttpServletResponse response){
        String country = request.getParameter("nameCountry");
        request.setAttribute("userList", this.iUserService.findByCountry(country));
        try {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }

    private void orderBy(HttpServletRequest request, HttpServletResponse response){
        request.setAttribute("userList", this.iUserService.orderBy());
        try {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }
    private void findById(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("idUser"));
        List<User> user = this.iUserService.getUserById(id);
        if (user.size() == 0) {
            request.setAttribute("msg", "Kh??ng c?? id n??y");
            request.setAttribute("userList", this.iUserService.findAll());
        } else {
            request.setAttribute("userList", user);
        }
        try {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }

    private void addUserPermission(HttpServletRequest request, HttpServletResponse response){
        User user = new User();
        user.setName("quan");
        user.setEmail("quan.nguyen@codegym.vn");
        user.setCountry("vn");
        int[] permission = {1, 2, 4};

        this.iUserService.addUserTransaction(user, permission);
    }

    private void transaction(HttpServletRequest request, HttpServletResponse response){
        if (this.iUserService.insertUpdateUseTransaction()){
            request.setAttribute("msg","???? xong transaction");
        }else {
            request.setAttribute("msg","fail transaction");
        }
        try {
            request.getRequestDispatcher("transaction.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }
}
