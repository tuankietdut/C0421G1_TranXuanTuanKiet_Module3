import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculator")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String textResult = "";
        float result = 0;
        try {
            float firstNumber = Float.parseFloat(request.getParameter("firstNumber"));
            float secondNumber = Float.parseFloat(request.getParameter("secondNumber"));
            String operator = request.getParameter("operator");
            switch (operator) {
                case "plus":
                    result = firstNumber + secondNumber;
                    break;
                case "except":
                    result = firstNumber - secondNumber;
                    break;
                case "multiply":
                    result = firstNumber * secondNumber;
                    break;
                case "divide":
                    if (secondNumber == 0) {
                        throw new DivideException("Chia cho 0");
                    }
                    result = firstNumber / secondNumber;
                    break;
            }
        } catch (NumberFormatException e) {
            // Exception không nhập số
            textResult = "numberException";
        } catch (DivideException e) {
            textResult = "divideException";
        }
        if (textResult.equals("")){
            request.setAttribute("result", result);
        }else if (textResult.equals("numberException")){
            request.setAttribute("textMess", textResult);
        }else {
            request.setAttribute("textMess", textResult);
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
