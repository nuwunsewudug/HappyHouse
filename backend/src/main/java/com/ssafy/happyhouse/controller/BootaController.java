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

import com.ssafy.happyhouse.model.dto.BootaBoardDto;
import com.ssafy.happyhouse.model.service.BootaService;

import io.swagger.annotations.ApiOperation;

//http://localhost:1010/happyhouse/swagger-ui/index.html
@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/boota")
public class BootaController {

	private static final Logger logger = LoggerFactory.getLogger(BootaController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private BootaService bservice; // null

	@ApiOperation(value = "선택된 페이징 게시글의 정보를 반환한다.", response = List.class)
	@GetMapping
	public ResponseEntity<Map<String, Object>> list(@RequestParam(value = "p", defaultValue = "1") int page,  @RequestParam(value = "key", defaultValue = "") String gugun) {
		logger.debug("list - 호출");
		return new ResponseEntity<Map<String, Object>>(bservice.makePage(page, gugun), HttpStatus.ACCEPTED);
	}

	@ApiOperation(value = "글번호에 해당하는 게시글의 정보를 반환한다.", response = BootaBoardDto.class)
	@GetMapping("{btbno}")
	public ResponseEntity<Map<String, Object>> detailBoard(@PathVariable int btbno) {
		logger.debug("detailBoard - 호출");
		return new ResponseEntity<Map<String, Object>>(bservice.read(btbno), HttpStatus.OK);
	}

	@ApiOperation(value = "검색된 페이징 게시글의 정보를 반환한다.", response = List.class)
	@GetMapping("/search")
	public ResponseEntity<Map<String, Object>> searchList(@RequestParam(value = "p", defaultValue = "1") int page, @RequestParam(value = "key", defaultValue = "") String keyword) {
		logger.debug("list - 호출");
		return new ResponseEntity<Map<String, Object>>(bservice.makeSearchPage(page, keyword), HttpStatus.ACCEPTED);
	}
	
	@ApiOperation(value = "새로운 게시글 정보를 입력한다. 그리고 DB입력 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PostMapping
	public ResponseEntity<String> writeBoard(@RequestBody BootaBoardDto board) {
		logger.debug("writeBoard - 호출");
		if (bservice.writeBoard(board)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	@ApiOperation(value = "글번호에 해당하는 게시글의 정보를 수정한다. 그리고 DB수정 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PutMapping("{btbno}")
	public ResponseEntity<String> updateBoard(@RequestBody BootaBoardDto board) {
		logger.debug("updateBoard - 호출");
		logger.debug("" + board);

		if (bservice.updateBoard(board)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	@ApiOperation(value = "게시글의 좋아요를 갱신한다. 그리고 DB수정 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PutMapping("/like/{btbno}")
	public ResponseEntity<String> updateLike(@PathVariable int btbno) {
		logger.debug("updateLike - 호출");

		if (bservice.updateLike(btbno)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	@ApiOperation(value = "글번호에 해당하는 게시글의 정보를 삭제한다. 그리고 DB삭제 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@DeleteMapping("{btbno}")
	public ResponseEntity<String> deleteBoard(@PathVariable int btbno) {
		logger.debug("deleteBoard - 호출");
		if (bservice.deleteBoard(btbno)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
//
//	@ApiOperation(value = "글번호에 해당하는 게시글의 좋아요수를 올린다. ", response = String.class)
//	@PutMapping("/like/{btbno}")
//	public ResponseEntity<String> updateLikeCount(@PathVariable int btbno) {
//		logger.debug("updateLikeCount - 호출");
//		if (bservice.updateLikeCount(btbno)) {
//			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
//		}
//		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
//	}
//

	@ApiOperation(value = "좋아요 계산 후 좋아요가 가장 높은 게시물 반환.", response = String.class)
	@GetMapping("/hot")
	public ResponseEntity<Map<String, Object>> getHotBoard() {
		logger.debug("hotBoard - 호출");
		return new ResponseEntity<Map<String, Object>>(bservice.getHotBoard(), HttpStatus.OK);
	}

}
