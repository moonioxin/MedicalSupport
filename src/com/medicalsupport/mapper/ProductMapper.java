package com.medicalsupport.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.medicalsupport.entity.Finance;
import com.medicalsupport.entity.Product;
import com.medicalsupport.httpentity.ProductReqParam;


public interface ProductMapper {
    public Product getProductInfo(Product product);
    
    public List<Product> listProduct(ProductReqParam productReqParam);
    
    public int totalPageCount(ProductReqParam productReqParam);
    
    public int insertProduct(Product product);
    
    public int updateProduct(Product product);
    
    public int updateProductSelective(Product product);
    
    public Product getProductByID(int id);
    
    public void deleteProducts(String[] ids);
    
    public List<Product> selectProductInfo(Integer productId);
    
    public List<Finance> selectFinanceInfo(Map<String, String> date);
    
    public int financeTotalPageCount(Map<String, String> date);
}
