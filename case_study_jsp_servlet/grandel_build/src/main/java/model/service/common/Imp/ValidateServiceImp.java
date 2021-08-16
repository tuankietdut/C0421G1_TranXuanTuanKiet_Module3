package model.service.common.Imp;

import model.service.common.ValidateService;

public class ValidateServiceImp implements ValidateService {
    @Override
    public boolean validateCodeCustomer(String codeCustomer) {
        String regexCodeCustomer = "^(KH-)[0-9]{4}$";
        return codeCustomer.matches(regexCodeCustomer);
    }

    @Override
    public boolean validateCodeService(String codeService) {
        String regexCodeService = "^(DV-)[0-9]{4}$";
        return codeService.matches(regexCodeService);
    }

    @Override
    public boolean validatePhone(String phoneNumber) {
        String regexPhoneNumber ="^((\\(84\\)\\+(090))|(090)|(091)|(\\(84\\)\\+(091)))[\\d]{7}$";
        return phoneNumber.matches(regexPhoneNumber);
    }

    @Override
    public boolean validateIdCard(String idCard) {
        String regexIdCard = "^[\\d]{9}$";
        return idCard.matches(regexIdCard);
    }

    @Override
    public boolean validateEmail(String email) {
        String regexEmail ="^[\\w.\\-]+\\@[a-z]+\\.[a-z]+$";
        return email.matches(regexEmail);
    }

    @Override
    public boolean validateMoney(double money) {
        if (money < 0) {
            return false;
        }
        return true;
    }

    @Override
    public boolean validateNumberInt(int number) {
        if (number < 0){
            return false;
        }
        return true;
    }

    @Override
    public boolean validateDateTime(String dateTime) {
        return true;
    }
}
