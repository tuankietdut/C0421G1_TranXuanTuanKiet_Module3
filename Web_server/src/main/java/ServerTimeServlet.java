import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@javax.servlet.annotation.WebServlet(name = "ServerTimeServlet", urlPatterns = "/index")
public class ServerTimeServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws IOException {
        PrintWriter writer = response.getWriter();
        writer.println("<html>");

        Date today = new Date();

        writer.println("<h1>" + today + "</h1>");
        writer.println("</html>");    }
}
