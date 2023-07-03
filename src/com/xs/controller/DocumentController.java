package com.xs.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.xs.domain.Document;
import com.xs.service.RainService;

@Controller
public class DocumentController {
	@Autowired
	@Qualifier("RainService")
	private RainService rainservice;
	// 如果在目录下输入为空，则跳转到指定链接
		@RequestMapping(value="/document/")
		 public ModelAndView index2(ModelAndView mv){
			mv.setViewName("document/list");
			return mv;
		}
		// 如果在目录下输入任何不存在的参数，则跳转到list
		@RequestMapping(value="/document/{formName}")
		 public String index2(@PathVariable String formName){
			String blank = "/document/list";
			return blank;
		}
		@RequestMapping(value="/document/list",method=RequestMethod.GET)
		 public String index(Model model,String content){
			List<Document> job_list = rainservice.get_DocumentList();
			if (content!=null){
				job_list = rainservice.get_DocumentLikeList(content);
			}
			model.addAttribute("list",job_list);
			return "document/list";
		}
		@RequestMapping(value="/document/add",method=RequestMethod.GET)
		 public String add(Model model,Integer id){
			if(id!=null){
				Document doc = rainservice.get_DocumentInfo(id);
				model.addAttribute("doc",doc);
			}
			return "/document/add";
		}
		@RequestMapping(value="/document/add",method=RequestMethod.POST)
		 public ModelAndView add(ModelAndView mv,@ModelAttribute Document document ,Integer id,HttpSession session
				 )
				 throws Exception{
			System.out.println(id);
			if(id!=null){
				rainservice.update_DocumentInfo(document);
			}else{
				/**
				 * 上传文件
				 */
				String path = session.getServletContext().getRealPath("/upload/");
				String filename = document.getFile().getOriginalFilename();
				File uploadDir = new File(path);
				if (!uploadDir.exists()) {
					uploadDir.mkdirs();
				}
				File tempFile = new File(uploadDir, filename);
				tempFile.createNewFile();
				document.getFile().transferTo(tempFile);
				document.setFilename(filename);
				rainservice.insert_DocumentInfo(document);
			}
			mv.setViewName("redirect:/document/list");
			return mv;
		}
	//@RequestMapping(value="/document/download", method=RequestMethod.GET)
//	public void download(Integer id, HttpServletResponse response,HttpSession session) throws Exception {
//		Document document = rainservice.get_DocumentInfo(id);
//		if (document != null) {
//			String filename = document.getFilename();
//
//			String filePath = session.getServletContext().getRealPath("/upload/" + filename);
//			File downloadFile = new File(filePath);
//			FileInputStream inputStream = new FileInputStream(downloadFile);
//			response.setContentType("application/force-download");
//			response.setHeader("Content-Disposition", "attachment;filename=" + filename);
//			IOUtils.copy(inputStream, response.getOutputStream());
//			inputStream.close();
//			//待完善
//		}
//	}
	@RequestMapping(value="/document/download", method=RequestMethod.GET)
	public void download(String fileName, HttpServletRequest request, HttpServletResponse response){
		if(fileName != null){
			String path = request.getSession().getServletContext().getRealPath("/upload/");
			File file = new File(path, fileName);
			OutputStream outputStream = null;
			if(file.exists()) {
				// response.setContentType(MIME)的作用是使客户端浏览器区分不同种类的数据，
				// 并根据不同的MIME调用浏览器内不同的程序嵌入模块来处理相应的数据。
				// 强制下载 application/force-download
				response.setContentType("application/force-download");
				// Content-Disposition中指定的类型是文件的扩展名，
				// 并且弹出的下载对话框中的文件类型是按照文件的扩展名显示的，
				// 保存后，文件以filename的值命名，保存类型以Content中设置的为准。
				response.setHeader("Content-Disposition", "attachment;filename=" + fileName);

				try {
					outputStream = response.getOutputStream();
					outputStream.write(FileUtils.readFileToByteArray(file));
					outputStream.flush();
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					if(outputStream != null){
						try {
							outputStream.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
	}

	@RequestMapping(value="/document/delete",method=RequestMethod.GET)
		 public void delete(Integer id){
			System.out.println(id);
			if(id!=null){
				rainservice.delete_DocumentInfo(id);
			}
		}
}
