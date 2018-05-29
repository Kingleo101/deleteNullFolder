package com.ally.ebay.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ally.ebay.bean.Product;
import com.ally.ebay.dao.ProductMapper;

@Service
public class ProductService {

	@Autowired
	ProductMapper productMapper;

	//添加商品
	public void saveProduct(Product product) {
		// TODO Auto-generated method stub
		productMapper.insertSelective(product);
	}

	public List<Product> getItems() {
		List<Product> products = productMapper.selectByExampleWithBLOBsWithCategory(null);
		return products;
	}

	public Product getitem(Integer id) {
		// TODO Auto-generated method stub
		Product product = productMapper.selectByPrimaryKeyWithCategory(id);
		return product;
	}


	
	
	
}
