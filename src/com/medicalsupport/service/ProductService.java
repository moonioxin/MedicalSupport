package com.medicalsupport.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.medicalsupport.entity.Finance;
import com.medicalsupport.entity.Product;
import com.medicalsupport.httpentity.ProductReqParam;

public interface ProductService {
    List<Product> listProduct(ProductReqParam productReqParam);
    
    int totalPageCount(ProductReqParam productReqParam);
    
    boolean insertProduct(Product product);

	boolean updateProduct(Product product);
	
	Product getProductByID(int id);
	
	void deleteProducts(String[] allId);
	
	List<Product> selectProductInfo(String productId);
	
	List<Finance> selectFinanceInfo(Map<String, String> date);
	
	int financeTotalPageCount(Map<String, String> date);
}
