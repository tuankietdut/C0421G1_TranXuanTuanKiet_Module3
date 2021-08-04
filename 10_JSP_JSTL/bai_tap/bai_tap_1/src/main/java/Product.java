public class Product {
        private String nameProduct;
        private String dateOfBirth;
        private String address;
        private String linkImage;

    public Product() {
    }

    public Product(String nameProduct, String dateOfBirth, String address, String linkImage) {
        this.nameProduct = nameProduct;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.linkImage = linkImage;
    }

        public String getNameProduct() {
        return nameProduct;
    }

        public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

        public String getDateOfBirth() {
        return dateOfBirth;
    }

        public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

        public String getAddress() {
        return address;
    }

        public void setAddress(String address) {
        this.address = address;
    }

        public String getLinkImage() {
        return linkImage;
    }

        public void setLinkImage(String linkImage) {
        this.linkImage = linkImage;
    }
}
