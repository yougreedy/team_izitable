package com.izitable.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.izitable.model.Image;

@Controller
public class FileController {
	
	private String uploadPath = "D:/upload/";
	
	List<Image> list = new ArrayList<Image>();
	
	@GetMapping("/a")
	String index(Model model) {
		model.addAttribute("list", list);
		return "index";
	}
	
	@PostMapping("/a")
	String index(Image image) throws IOException {
		MultipartFile file = image.getUploadFile();
		System.out.println(file.getOriginalFilename());
		
		if(file != null && !file.isEmpty()) {
			String filename = file.getOriginalFilename();
			
			file.transferTo(new File(uploadPath  + filename));
			
			image.setFilename(filename);
			
			list.add(image);
			
			System.out.println(file.getOriginalFilename());
		}
		
		return "redirect:/a";
	}
}
