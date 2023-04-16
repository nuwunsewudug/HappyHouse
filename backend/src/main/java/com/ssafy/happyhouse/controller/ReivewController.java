package com.ssafy.happyhouse.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.BoardDto;
import com.ssafy.happyhouse.model.dto.ReivewDto;
import com.ssafy.happyhouse.model.service.ReivewService;

import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/reivew")
public class ReivewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReivewController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private ReivewService rservice; // null
	
	@ApiOperation(value = "집번호에 해당하는 리뷰 정보를 반환한다.", response = ReivewDto.class)
	@GetMapping("{hno}")
	public ResponseEntity<Map<String, Object>> readReivew(@PathVariable String hno) {
		logger.debug("reivewRead - 호출");
		return new ResponseEntity<Map<String, Object>>(rservice.readReivew(hno), HttpStatus.OK);
	}
	
	@ApiOperation(value = "새로운 리뷰를 입력한다. 그리고 DB입력 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PostMapping
	public ResponseEntity<String> writeReivew(@RequestBody ReivewDto reivew) {
		logger.debug("writeReivew - 호출");
		if (rservice.writeReivew(reivew)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	@ApiOperation(value = "리뷰 점수 계산 후 점수가 가장 높은 아파트매물 반환. 그리고 DB입력 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@GetMapping("/hot")
	public ResponseEntity<Map<String, Object>> getHotHouse() {
		logger.debug("hotReivew - 호출");

		return new ResponseEntity<Map<String, Object>>(rservice.getHotHouse(), HttpStatus.OK);

	}
}
