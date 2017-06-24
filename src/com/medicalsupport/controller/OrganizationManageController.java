package com.medicalsupport.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.CannotAcquireLockException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.medicalsupport.entity.Admin;
import com.medicalsupport.entity.Department;
import com.medicalsupport.entity.Finance;
import com.medicalsupport.entity.Product;
import com.medicalsupport.service.DepartmentService;
import com.medicalsupport.service.ProductService;
import com.sun.prism.paint.Color;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import java.lang.reflect.Field;
import java.math.BigDecimal;

import com.medicalsupport.httpentity.DepartmentReqParam;
import com.medicalsupport.httpentity.DepartmentResponse;
import com.medicalsupport.httpentity.DepartmentResponseRow;
import com.medicalsupport.httpentity.FinanceReqParam;
import com.medicalsupport.httpentity.FinanceResponse;
import com.medicalsupport.httpentity.FinanceResponseRow;
import com.medicalsupport.httpentity.ProductReqParam;
import com.medicalsupport.httpentity.ProductResponse;
import com.medicalsupport.httpentity.ProductResponseRow;
import com.medicalsupport.httpentity.ShowListInfo;

@Controller
public class OrganizationManageController {
	
	private SimpleDateFormat timeFormat = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat( "yyyy-MM-dd" );
	
	public static final int startDateColumn = 1;
	
	public static final int endDateColumn = 5;
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/departmentManage")
	public String departmentManage() {
		return "organization/departmentManage";
	}
	
	@RequestMapping(value = "/productManage")
	public String productManage() {
		return "organization/productManage";
	}
	
	@RequestMapping(value = "/listDepartment")
	public void getlistDepartment(HttpServletResponse response,DepartmentReqParam departmentReqParam) throws IOException, ParseException {
		List<Department> departmentList = departmentService.listDepartment(departmentReqParam);
		int totalPageCount = departmentService.totalPageCount(departmentReqParam);
		List<DepartmentResponseRow> departmentResponseList = new ArrayList<DepartmentResponseRow>();
		
		for (int i=0;i<departmentList.size();i++) {
			if(departmentList.get(i).getNote()==null || departmentList.get(i).getNote()=="") {
				departmentList.get(i).setNote("无");
			}
			String timeString = timeFormat.format(departmentList.get(i).getCreateTime());
			departmentList.get(i).setCreateTimeString(timeString);
			DepartmentResponseRow departmentResponseRow = new DepartmentResponseRow(i, departmentList.get(i));
			departmentResponseList.add(departmentResponseRow);
		}
		
		DepartmentResponse departmentResponse=new DepartmentResponse();
		departmentResponse.setPage(departmentReqParam.getPage());        //设置
		departmentResponse.setTotal(totalPageCount);
		departmentResponse.setRows(departmentResponseList);
		Gson gson = new Gson();
		String resultString = gson.toJson(departmentResponse);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(resultString);
		out.close();
	}
	
	@RequestMapping(value = "/listProduct")
	public void getlistProduct(HttpServletResponse response,ProductReqParam productReqParam,HttpSession session) throws IOException, ParseException {
		Admin admin = (Admin) session.getAttribute("admin");
		if(admin.getDepartmentId()!=0) {
			productReqParam.setDepartmentId(admin.getDepartmentId());
		}
	    List<Product> productList = productService.listProduct(productReqParam);
		int totalPageCount = productService.totalPageCount(productReqParam);
		List<ProductResponseRow> productResponseList = new ArrayList<ProductResponseRow>();
		for (int i=0;i<productList.size();i++) {
			String timeString = timeFormat.format(productList.get(i).getCreateTime());
			productList.get(i).setCreateTimeString(timeString);
			ProductResponseRow productResponseRow = new ProductResponseRow(i, productList.get(i));
			productResponseList.add(productResponseRow);
		}
		
		ProductResponse productResponse=new ProductResponse();
		productResponse.setPage(productReqParam.getPage());        //设置
		productResponse.setTotal(totalPageCount);
		productResponse.setRows(productResponseList);
		Gson gson = new Gson();
		String resultString = gson.toJson(productResponse);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(resultString);
		out.close();
	}
	
	@RequestMapping(value = "/addDepartment")
	public String toAddDepartment() {
		return "organization/departmentInfo";
	}
	
	@RequestMapping(value = "/saveDepartment", method = RequestMethod.POST)
	public ModelAndView toSaveDepartment(HttpSession session, Department department) {
		ModelAndView mv = new ModelAndView();
		Admin admin = (Admin) session.getAttribute("admin");
		department.setCreator(admin.getAdminName());
		department.setCreateTime(new Date());
		if(department.getNote()==null || department.getNote()=="") {
			department.setNote("无");
		}
		if(department.getId() == null || department.getId().intValue() == 0)
		{
			if(departmentService.insertDepartment(department) == false)
			{
				mv.addObject("msg", "保存失败!");
			}
			else
			{
				mv.addObject("msg", "保存成功!");
			}
		}
		else
		{
			if(departmentService.updateDepartment(department) == false)
			{
				mv.addObject("msg", "保存失败!");
			}
			else
			{
				mv.addObject("msg", "保存成功!");
			}
		}
		mv.setViewName("admin/save_result");
		return mv;
	}
	
	@RequestMapping(value = "/editDepartment")
	public ModelAndView toEditDepartment(@RequestParam int id) {
		ModelAndView mv = new ModelAndView();
		Department department = departmentService.getDepartmentByID(id);
		mv.addObject("department",department);
		mv.setViewName("organization/departmentInfo");
		return mv;
	}
	
	@RequestMapping(value = "/deleteDepartments")
	public void toDeleteDepartment(@RequestParam String ids, PrintWriter out) {
		String[] allId = ids.split(",");
		departmentService.deleteDepartments(allId);
		String msg ="{\"result\":\"success\"}";
		out.write(msg);
		out.close();
	}
	
	@RequestMapping(value = "/addProduct")
	public ModelAndView toAddProduct() {
		ModelAndView mv = new ModelAndView();
		ShowListInfo listInfo = new ShowListInfo();
		List<Map<String, Object>> departmentList = departmentService.getDepartmentList();
		listInfo.setDepartmentList(departmentList);
		mv.addObject("listInfo",listInfo);
		mv.setViewName("organization/productInfo");
		return mv;
	}
	
	@RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
	public ModelAndView toSaveProduct(HttpSession session,Product product) {
		ModelAndView mv = new ModelAndView();
		Admin admin = (Admin) session.getAttribute("admin");
		product.setCreateTime(new Date());
		product.setCreator(admin.getAdminName());
		if(product.getId() == null || product.getId().intValue() == 0)
		{
			if(productService.insertProduct(product) == false)
			{
				mv.addObject("msg", "保存失败!");
			}
			else
			{
				mv.addObject("msg", "保存成功!");
			}
		}
		else
		{
			if(productService.updateProduct(product) == false)
			{
				mv.addObject("msg", "保存失败!");
			}
			else
			{
				mv.addObject("msg", "保存成功!");
			}
		}
		mv.setViewName("admin/save_result");
		return mv;
	}
	
	@RequestMapping(value = "/editProduct")
	public ModelAndView toEditProduct(@RequestParam int id) {
		ModelAndView mv = new ModelAndView();
		Product product = productService.getProductByID(id);
		mv.addObject("product",product);
		ShowListInfo listInfo = new ShowListInfo();
		List<Map<String, Object>> departmentList = departmentService.getDepartmentList();
		listInfo.setDepartmentList(departmentList);
		mv.addObject("listInfo",listInfo);
		mv.setViewName("organization/productInfo");
		return mv;
	}
	
	@RequestMapping(value = "/deleteProducts")
	public void toDelete(@RequestParam String ids, PrintWriter out) {
		String[] allId = ids.split(",");
		productService.deleteProducts(allId);
		String msg ="{\"result\":\"success\"}";
		out.write(msg);
		out.close();
	}
	
	@RequestMapping(value = "/selectProductInfo")
	@ResponseBody
	public Object selectProductInfo(@RequestParam String productId) {
		List<Product> productList = new ArrayList<Product>();
		try{
			productList = productService.selectProductInfo(productId);
		}catch(Exception e){
			return "-1";
		}
		return productList;
	}
	
	@RequestMapping(value = "/selectFinanceInfo")
	@ResponseBody
	public void selectFinanceInfo(HttpServletResponse response,FinanceReqParam financeReqParam) {
		List<Finance> financeInfoList = new ArrayList<Finance>();
		Map<String, String> date = new HashMap<String, String>();
		date.put("beforeDate", financeReqParam.getStartDate());
		date.put("afterDate", financeReqParam.getEndDate());
		try{
			financeInfoList = productService.selectFinanceInfo(date);
			int totalPageCount = productService.financeTotalPageCount(date);
			List<FinanceResponseRow> financeResponseList = new ArrayList<FinanceResponseRow>();
			for(int i=0;i<financeInfoList.size();i++) {
				FinanceResponseRow financeResponseRow = new FinanceResponseRow(i, financeInfoList.get(i));
				financeResponseList.add(financeResponseRow);
			}
			FinanceResponse financeResponse=new FinanceResponse();
			financeResponse.setPage(financeReqParam.getPage());        //设置
			financeResponse.setTotal(totalPageCount);
			financeResponse.setRows(financeResponseList);
			Gson gson = new Gson();
			String resultString = gson.toJson(financeResponse);
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write(resultString);
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/exchangeView")
	public String toExchangeView() {
		return "organization/exchangeView";
	}
	
	@RequestMapping(value = "/exportFinanceExcel")
	@ResponseBody
	 public void exportFinanceExcel(HttpServletRequest request,HttpServletResponse response,FinanceReqParam financeReqParam) {  
//	  String result="系统提示：Excel文件导出成功！";
	  try {       
		   String path ="/com/medicalsupport/excel/Finance_Template.xlsx";
		   File file = new File(OrganizationManageController.class.getResource(path).getFile());
		   InputStream in = new FileInputStream(file);
		   List<Finance> listContent = new ArrayList<Finance>();
		   Map<String, String> date = new HashMap<String, String>();
		   date.put("beforeDate", financeReqParam.getStartDate());
		   date.put("afterDate", financeReqParam.getEndDate());
		   listContent = productService.selectFinanceInfo(date);
		   XSSFWorkbook wb = new XSSFWorkbook(in);
		   XSSFSheet sheet = wb.getSheetAt(0);
		   XSSFRow row = sheet.getRow(1);
		   XSSFCell cell = row.getCell(startDateColumn);
		   cell.setCellValue(financeReqParam.getStartDate());
		   cell = row.getCell(endDateColumn);
		   cell.setCellValue(financeReqParam.getEndDate());
		   int i = 3 ;   //从第三行开始导出excel主体数据部分
		   int countPoint = 0;
		   BigDecimal countAmount = BigDecimal.ZERO;
		   BigDecimal countCash = BigDecimal.ZERO;
		   
		   XSSFCellStyle cellStyle = wb.createCellStyle();  
		   cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);  //设置上边框  
		   cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);   //设置下边框  
		   cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN); //设置做边框  
		   cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);    //设置右边框  
		   cellStyle.setBottomBorderColor(new XSSFColor(java.awt.Color.BLACK));   
		   cellStyle.setTopBorderColor(new XSSFColor(java.awt.Color.BLACK));   
		   cellStyle.setLeftBorderColor(new XSSFColor(java.awt.Color.BLACK));   
		   cellStyle.setRightBorderColor(new XSSFColor(java.awt.Color.BLACK));
		   
		   for(Finance temp: listContent) {
			   row = sheet.getRow(i);
			   
			   countPoint = countPoint + temp.getTotalExchangePoints();
			   countAmount = countAmount.add(temp.getTotalExchangeAmount());
			   countCash = countCash.add(temp.getTotalCash());
			   
			   
			   
			   XSSFCell tempCell = row.createCell(0);
			   tempCell.setCellStyle(cellStyle);
			   tempCell.setCellValue(temp.getProductName());
			   tempCell = row.createCell(1);
			   tempCell.setCellStyle(cellStyle);
			   tempCell.setCellValue(temp.getNeedPoint());
			   tempCell = row.createCell(2);
			   tempCell.setCellStyle(cellStyle);
			   tempCell.setCellValue(temp.getNeedCash().toString());
			   tempCell = row.createCell(3);
			   tempCell.setCellStyle(cellStyle);
			   tempCell.setCellValue(temp.getTotal());
			   tempCell = row.createCell(4);
			   tempCell.setCellStyle(cellStyle);
			   tempCell.setCellValue(temp.getTotalExchangePoints());
			   tempCell = row.createCell(5);
			   tempCell.setCellStyle(cellStyle);
			   tempCell.setCellValue(temp.getTotalExchangeAmount().toString());
			   tempCell = row.createCell(6);
			   tempCell.setCellStyle(cellStyle);
			   tempCell.setCellValue(temp.getTotalCash().toString());
			   i = i + 1;
		   }
		   
		   row = sheet.getRow(i+2);//合计行
		   XSSFCell tempCell = row.createCell(4);
		   tempCell.setCellStyle(cellStyle);
		   tempCell.setCellValue(countPoint);
		   tempCell = row.createCell(5);
		   tempCell.setCellStyle(cellStyle);
		   tempCell.setCellValue(countAmount.toString());
		   tempCell = row.createCell(6);
		   tempCell.setCellStyle(cellStyle);
		   tempCell.setCellValue(countCash.toString());
		   
		   String fileName = "财务导出.xlsx";
	//	   fileName = URLEncoder.encode(fileName, "UTF-8");
	//	   response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
		   request.setCharacterEncoding("UTF-8");
		   response.setContentType("application/force-download");
		   response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));

		   OutputStream out = response.getOutputStream();
		   wb.write(out);
		   out.close();
	  } catch (Exception e) {  
//	   result="系统提示：Excel文件导出失败，原因："+ e.toString();  
//	   System.out.println(result);   
	   e.printStackTrace();  
	  }  
	}
	
	@RequestMapping(value = "/testfile")
	public void download(String filename, HttpServletRequest request, HttpServletResponse response) {
		try {
			File file = new File("d:/", "test.txt");
			FileInputStream in = new FileInputStream(file);
		
			long lFileLen = file.length();
			//设置下载参数
			String fileName = URLEncoder.encode("test.txt", "UTF-8");
			if (request.getHeader("User-Agent") != null && request.getHeader("User-Agent").contains("Firefox")) { // 解决火狐浏览器下乱码问题
				fileName = new String( filename.getBytes("UTF-8"), "ISO8859-1");
			}
			response.reset();   
			response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");   
			response.addHeader("Content-Length", "" + lFileLen);   
			response.setContentType("application/octet-stream;charset=UTF-8"); 
			//response.setContentType("application/x-msdownload");
			
			OutputStream out = response.getOutputStream();
			
			//读文件
			int iBufferSize = 65000;
			byte[] buffer = new byte[65000];
			long lReadLen = 0;
			while(lReadLen < lFileLen){
				int lRead = in.read(buffer, 0, iBufferSize);
				lReadLen += lRead;
				out.write(buffer, 0, lRead);
			}
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
