package model.repository.Imp;

import model.bean.Product;
import model.repository.ProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImp implements ProductRepository {
    private static Map<Integer, Product> productMap = new HashMap<>();
    static {
        productMap.put(1, new Product(1,"Chuối", 50,"Chuối vàng","made by Việt Nam"));
        productMap.put(2, new Product(2,"Mận", 30,"Mận ngọt","made by Việt Nam"));
        productMap.put(3, new Product(3,"Dưa hấu", 60,"Dưa hấu ko hạt","made by Việt Nam"));
        productMap.put(4, new Product(4,"Kiwi", 100,"Kiwi xanh","made by Việt Nam"));
        productMap.put(5, new Product(5,"Vải", 70,"Vải thiều","made by Việt Nam"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    @Override
    public void addProduct(Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public void updateProduct(Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public void deleteProduct(int id) {
        productMap.remove(id);
    }
}
