package model.repository.contract_detail.Imp;

import model.bean.contract_detail.ContractDetail;
import model.repository.baseRepository.BaseRepository;
import model.repository.contract_detail.ContractDetailRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContractDetailRepositoryImp implements ContractDetailRepository {
    private BaseRepository baseRepository;

    @Override
    public boolean createContractDetail(ContractDetail contractDetail) {
        baseRepository = new BaseRepository();
        Connection connection = this.baseRepository.getConnection();

        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("insert into contract_detail(contract_id, " +
                        "attach_service_id, quantity)\n" +
                        "values (?, ?, ?);");
                statement.setInt(1, contractDetail.getContractId());
                statement.setInt(2, contractDetail.getAttachServiceId());
                statement.setInt(3, contractDetail.getQuantity());
                statement.executeUpdate();
                return true;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return false;

    }
}
