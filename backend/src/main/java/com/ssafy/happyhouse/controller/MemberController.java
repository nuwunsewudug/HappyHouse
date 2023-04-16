package com.ssafy.happyhouse.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.BoardDto;
import com.ssafy.happyhouse.model.service.MemberSerivce;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/member")
@CrossOrigin(origins = { "*" }, maxAge = 6000)
public class MemberController {
	
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	MemberSerivce mservice;
	
	@GetMapping("{userId}")
	public ResponseEntity<Map<String, Object>> memberinfo(@PathVariable String userId) {
		return new ResponseEntity<Map<String, Object>>(mservice.select(userId), HttpStatus.OK);
	}

	@DeleteMapping("{userId}")
	public ResponseEntity<String> deleteMember(@PathVariable String userId) {
		if (mservice.deleteMember(userId)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	

}
