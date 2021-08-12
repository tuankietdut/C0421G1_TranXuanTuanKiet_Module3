package controller;

import model.bean.contract_detail.ContractDetail;
import model.service.contract.ContractService;
import model.service.contract.Imp.ContractServiceImp;
import model.service.contract_detail.AttachService;
import model.service.contract_detail.ContractDetailService;
import model.service.contract_detail.Imp.AttachServiceImp;
import model.service.contract_detail.Imp.ContractDetailServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ContractDetailServlet", urlPatterns = "/contractDetail")
public class ContractDetailServlet extends HttpServlet {
    private final ContractDetailService contractDetailService = new ContractDetailServiceImp();
    private final ContractService contractService = new ContractServiceImp();
    private final AttachService attachService = new AttachServiceImp();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_contract = Integer.parseInt(request.getParameter("contractId"));
        int attach_service_id = Integer.parseInt(request.getParameter("attach_service"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        ContractDetail contractDetail = new ContractDetail(id_contract, attach_service_id, quantity);
        if (this.contractDetailService.createContractDetail(contractDetail)){
            request.setAttribute("msg", "Success");
        }else {
            request.setAttribute("msg", "Cannot");
        }
        request.setAttribute("contractList", this.contractService.getList());
        request.setAttribute("attachList", this.attachService.getList());
        request.getRequestDispatcher("contract_detail/create.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("contractList", this.contractService.getList());
        request.setAttribute("attachList", this.attachService.getList());
        request.getRequestDispatcher("contract_detail/create.jsp").forward(request, response);
    }
}
