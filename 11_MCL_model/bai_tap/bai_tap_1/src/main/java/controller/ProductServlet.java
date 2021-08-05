package controller;

import model.bean.Product;
import model.service.Imp.ProductServiceImp;
import model.service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductServiceImp();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                addProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
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
                showCreate(request, response);
                break;
            case "edit":
                showEdit(request, response);
                break;
            case "delete":
                showDelete(request, response);
                break;
            case "view":
                showView(request, response);
                break;
            default:
                showMenu(request, response);
                break;
        }
    }

    private void showMenu(HttpServletRequest request, HttpServletResponse response){
        request.setAttribute("product", this.productService.findAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
        try {
          dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }

    private void showView(HttpServletRequest request, HttpServletResponse response){
        Product product = this.productService.findById(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("viewProduct", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher dispatcher = request.getRequestDispatcher("create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("idProduct"));
        String name = request.getParameter("nameProduct");
        String desProduct = request.getParameter("desProduct");
        float price = Float.parseFloat(request.getParameter("priceProduct"));
        String made = request.getParameter("madeBy");
        this.productService.addProduct(new Product(id, name, price, desProduct, made));
        RequestDispatcher dispatcher = request.getRequestDispatcher("create.jsp");
        request.setAttribute("message", "Đã thêm sản phẩm");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("edit.jsp");
        request.setAttribute("product", product);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }
    private void editProduct(HttpServletRequest request, HttpServletResponse response){
        String name = request.getParameter("nameProduct");
        String desProduct = request.getParameter("desProduct");
        float price = Float.parseFloat(request.getParameter("priceProduct"));
        String made = request.getParameter("madeBy");
        Product product = this.productService.findById(Integer.parseInt(request.getParameter("id")));
        product.setNameProduct(name);
        product.setDescribe(desProduct);
        product.setPrice(price);
        product.setMadeBy(made);
        this.productService.updateProduct(product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("edit.jsp");
        request.setAttribute("message", "Đã edit sản phẩm");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("delete.jsp");
        request.setAttribute("product", product);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        this.productService.deleteProduct(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("delete.jsp");
        request.setAttribute("message", "Đã xóa sản phẩm");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }
}
