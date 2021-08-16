package model.service.common;

public interface ValidateService {
    boolean validateCodeCustomer(String codeCustomer);
    boolean validateCodeService(String codeService);
    boolean validatePhone(String phoneNumber);
    boolean validateIdCard(String idCard);
    boolean validateEmail (String email);
    boolean validateMoney(double money);
    boolean validateNumberInt(int number);
    boolean validateDateTime(String dateTime);
}
