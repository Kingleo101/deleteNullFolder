package com.ally.ebay.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ally.ebay.bean.Category;
import com.ally.ebay.bean.Product;
import com.ally.ebay.dao.CategoryMapper;
import com.ally.ebay.dao.ProductMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath*:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	CategoryMapper categoryMapper;
	
	@Autowired
	ProductMapper productMapper;
	
	@Test
	public void testCRUD() {
		/*//原生单元测试
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("applicationContext.xml");
		CategoryMapper categoryMapper = context.getBean(CategoryMapper.class);
		System.out.println(categoryMapper);*/
		/*categoryMapper.insertSelective(new Category(357, "Art"));
		categoryMapper.insertSelective(new Category(121836 , "Home"));*/
		/*List<Product> products = productMapper.selectByExampleWithCategory(null);
		for (Product product : products) {
			System.out.println(product);
		}*/
		List<Product> products = productMapper.selectByExampleWithBLOBsWithCategory(null);
		for (Product product : products) {
			System.out.println(product);
		}
	}
	
}
