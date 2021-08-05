package model.service.Imp;

import model.bean.Product;
import model.repository.Imp.ProductRepositoryImp;
import model.repository.ProductRepository;
import model.service.ProductService;

import java.util.List;

public class ProductServiceImp implements ProductService {
    private ProductRepository productRepository = new ProductRepositoryImp();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public void addProduct(Product product) {
        productRepository.addProduct(product);
    }

    @Override
    public void updateProduct(Product product) {
        productRepository.updateProduct(product);
    }

    @Override
    public void deleteProduct(int id) {
        productRepository.deleteProduct(id);
    }
}
