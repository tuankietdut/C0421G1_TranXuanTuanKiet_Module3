package model.bean;

public class CustomerContract {
    private String nameCustomer;
    private String nameService;
    private String nameAttachService;
    private int quantity;
    private int serviceId;

    public CustomerContract(String nameCustomer, String nameService, String nameAttachService, int quantity, int serviceId) {
        this.nameCustomer = nameCustomer;
        this.nameService = nameService;
        this.nameAttachService = nameAttachService;
        this.quantity = quantity;
        this.serviceId = serviceId;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public CustomerContract() {
    }

    public String getNameCustomer() {
        return nameCustomer;
    }

    public void setNameCustomer(String nameCustomer) {
        this.nameCustomer = nameCustomer;
    }

    public String getNameService() {
        return nameService;
    }

    public void setNameService(String nameService) {
        this.nameService = nameService;
    }

    public String getNameAttachService() {
        return nameAttachService;
    }

    public void setNameAttachService(String nameAttachService) {
        this.nameAttachService = nameAttachService;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
