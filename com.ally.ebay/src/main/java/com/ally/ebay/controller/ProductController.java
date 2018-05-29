package com.ally.ebay.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ally.ebay.bean.Product;
import com.ally.ebay.bean.UploadResult;
import com.ally.ebay.service.ProductService;
import com.ally.ebay.util.Msg;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
	@RequestMapping(value="/getItem/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getItem(@PathVariable("id")Integer id) {
		Product product = productService.getitem(id);
		return Msg.success().add("item", product);
	}
	
	/**
	 * 
	 * 获取所有商品
	 * @return
	 */
	@RequestMapping(value="/getItems",method=RequestMethod.GET)
	@ResponseBody
	public Msg getItems() {
		List<Product> products = productService.getItems();
		return Msg.success().add("items", products);
	}
	
	/**
	 * 因为本地路径服务器无法访问 所以路径暂时由Tomcat地址代替
	 * @param uploadfile
	 * @param request
	 * @return
	 */
	@RequestMapping("/fileUpload")
    @ResponseBody
    public UploadResult handleFormUpload(@RequestParam("uploadfile") List<MultipartFile> uploadfile,
                                   HttpServletRequest request) {
        UploadResult result = new UploadResult();
       

        //判断上传文件是否存在
        if (!uploadfile.isEmpty() && uploadfile.size() > 0) {
            //循环输出上传的文件
            for (MultipartFile file : uploadfile) {
                //获取上传文件的原始名称
                String oringinalFilename = file.getOriginalFilename();
                //获取源文件名后缀
                String prefixName = FilenameUtils.getExtension(oringinalFilename);

                int fileSize = 500000;
                //图片限制在500k以内
                if(file.getSize() > fileSize) {
                    result.setCode("0");
                    return result;
                } else if(prefixName.equalsIgnoreCase("jpg")
                        || prefixName.equalsIgnoreCase("png")
                        || prefixName.equalsIgnoreCase("jpeg")
                        || prefixName.equalsIgnoreCase("pneg")) {
                    //设置上传文件的保存地址目录
                    String dirPath = "G:/imgs/";
                    //区分windows和linux的\ 和 /
                    //String dirPath = "E:"+System.getProperty("file.separator")+"uploadfile" + System.getProperty("file.separator");
                    //String dirPath = System.getProperty("file.separator") + "usr" + System.getProperty("file.separator") + "local"
                           // + System.getProperty("file.separator")+"imgbak"+System.getProperty("file.separator");
                    System.out.println("dirpath==" + dirPath);
                    File filePath = new File(dirPath);
                    //如果文件地址不存在 则创建目录
                    if (!filePath.exists()) {
                        filePath.mkdirs();
                    }
                    //使用时间格式重新命名
                    String newFilename =  RandomStringUtils.randomAlphanumeric(10) + "."+prefixName;
                    /*System.out.println("/images/" + newFilename);*/
                    try {
                        //使用MultipartFilr接口的方法完成文件上传到指定位置
                        file.transferTo(new File(dirPath + newFilename));
//                      String filepath = "images/" + newFilename;
                        result.setPath(newFilename);
                    } catch (IOException e) {
                        result.setCode("1");
                        return result;
                    }
                } else {
                    System.out.println("上传图片格式不正确");
                    result.setCode("3");
                    return result;
                }
            }
            //上传成功
            return result;
        } else {
            result.setCode("404");
            return result;
        }
    }
	
	/**
	 * //添加商品
	 * @param product
	 * @return
	 */
	@RequestMapping(value="/products",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveProcuct(Product product) {
		System.out.println(product);
		productService.saveProduct(product);
		return Msg.success().add("pageInfo", product.getSku());
	}

	


}
