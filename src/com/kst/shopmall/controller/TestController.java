package com.kst.shopmall.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TestController {

	@RequestMapping("/formTest")
	public void formTest(){
		System.out.println("연습용 ");
	
	}
	
	@RequestMapping(value="/form",method=RequestMethod.POST)
	public void form(@RequestParam String[] check){
		
		System.out.println("length : "+check.length);
		System.out.println("toString() : "+check.toString());
		System.out.println("[1] : "+check[0]);
		
		for(int i = 0 ; i < check.length ; i++){
			System.out.println(check[i]);
		}
		
	}
}
