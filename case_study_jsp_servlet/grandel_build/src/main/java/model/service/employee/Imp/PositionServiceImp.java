package model.service.employee.Imp;

import model.bean.Employee.Position;
import model.repository.employee.Imp.PositionRepositoryImp;
import model.repository.employee.PositionRepository;
import model.service.employee.PositionService;

import java.util.List;

public class PositionServiceImp implements PositionService {
    private PositionRepository positionRepository = new PositionRepositoryImp();
    @Override
    public List<Position> getList() {
        return this.positionRepository.getList();
    }
}
