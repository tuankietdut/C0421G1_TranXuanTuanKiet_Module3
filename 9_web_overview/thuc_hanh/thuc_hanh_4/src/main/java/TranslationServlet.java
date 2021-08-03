import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "TranslationServlet", urlPatterns = "/translate")
public class TranslationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] engString = {"book", "school", "male", "female", "boy", "girl"};
        String[] vnString = {"sách", "trường", "nam", "nữ", "con trai", "con gái"};
        String para = request.getParameter("engWord");
        String result = "";
        for (byte i=0; i< engString.length; i++){
            if (engString[i].equals(para)){
                result = vnString[i];
                break;
            }
        }
        PrintWriter fileWriter = response.getWriter();
        if (result.equals("")){
            fileWriter.println("<html>");
            fileWriter.println("<h1>Không có trong từ điển");
            fileWriter.println("</h1>");
            fileWriter.println("</html>");
        }else {
            fileWriter.println("<html>");
            fileWriter.println("<h1>" + result);
            fileWriter.println("</h1>");
            fileWriter.println("</html>");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
