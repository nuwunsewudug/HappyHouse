package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.BoardDto;
import com.ssafy.happyhouse.model.service.BoardService;

import io.swagger.annotations.ApiOperation;

//http://localhost:1010/happyhouse/swagger-ui/index.html
@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private BoardService bservice; // null

	@ApiOperation(value = "선택된 페이징 게시글의 정보를 반환한다.", response = List.class)
	@GetMapping
	public ResponseEntity<Map<String, Object>> list(@RequestParam(value = "p", defaultValue = "1") int page) {
		logger.debug("list - 호출");
		return new ResponseEntity<Map<String, Object>>(bservice.makePage(page), HttpStatus.ACCEPTED);
	}

	@ApiOperation(value = "글번호에 해당하는 게시글의 정보를 반환한다.", response = BoardDto.class)
	@GetMapping("{bno}")
	public ResponseEntity<Map<String, Object>> detailBoard(@PathVariable int bno) {
		logger.debug("detailBoard - 호출");
		return new ResponseEntity<Map<String, Object>>(bservice.read(bno), HttpStatus.OK);
	}

	@ApiOperation(value = "검색된 페이징 게시글의 정보를 반환한다.", response = List.class)
	@GetMapping("/search")
	public ResponseEntity<Map<String, Object>> searchList(@RequestParam(value = "p", defaultValue = "1") int page, @RequestParam(value = "key", defaultValue = "") String keyword) {
		logger.debug("list - 호출");
		return new ResponseEntity<Map<String, Object>>(bservice.makeSearchPage(page, keyword), HttpStatus.ACCEPTED);
	}
	
	@ApiOperation(value = "새로운 게시글 정보를 입력한다. 그리고 DB입력 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PostMapping
	public ResponseEntity<String> writeBoard(@RequestBody BoardDto board) {
		logger.debug("writeBoard - 호출");
		if (bservice.writeBoard(board)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	@ApiOperation(value = "글번호에 해당하는 게시글의 정보를 수정한다. 그리고 DB수정 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PutMapping("{bno}")
	public ResponseEntity<String> updateBoard(@RequestBody BoardDto board) {
		logger.debug("updateBoard - 호출");
		logger.debug("" + board);

		if (bservice.updateBoard(board)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	@ApiOperation(value = "글번호에 해당하는 게시글의 정보를 삭제한다. 그리고 DB삭제 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@DeleteMapping("{bno}")
	public ResponseEntity<String> deleteBoard(@PathVariable int bno) {
		logger.debug("deleteBoard - 호출");
		if (bservice.deleteBoard(bno)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

}
