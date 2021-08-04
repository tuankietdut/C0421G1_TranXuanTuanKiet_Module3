import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "")
public class ProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = new ArrayList<>();
        productList.add(new Product("Mai Văn Hoàn", "1983-08-20","Hà Nội", "https://th.bing.com/th/id/OIP.VRaihAruZyuTJBOd8UqYMwHaE8?w=305&h=204&c=7&o=5&dpr=1.12&pid=1.7"));
        productList.add(new Product("Nguyễn Văn Nam", "1983-08-21","Bắc Giang", "https://th.bing.com/th/id/OIP.VRaihAruZyuTJBOd8UqYMwHaE8?w=305&h=204&c=7&o=5&dpr=1.12&pid=1.7"));
        productList.add(new Product("Nguyễn Thái Hòa", "1983-08-20","Nam Định", "https://th.bing.com/th/id/OIP.VRaihAruZyuTJBOd8UqYMwHaE8?w=305&h=204&c=7&o=5&dpr=1.12&pid=1.7"));

        request.setAttribute("productList", productList);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
