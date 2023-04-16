package com.ssafy.happyhouse.jwt.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.jwt.dto.UserRequest;
import com.ssafy.happyhouse.jwt.service.UserService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@CrossOrigin(origins = { "*" }, maxAge = 6000)
public class UserController {
	private final UserService userService;

	// 회원가입
	@PostMapping("/join")
	public ResponseEntity join(@RequestBody UserRequest userRequest) {
//        if(userService.findByUserId(userRequest.getUser_id()).isPresent()) {
//        	System.out.println(userRequest.getUser_id() + " 111");
//        	return ResponseEntity.badRequest().build();
//        }
//        else {
		return ResponseEntity.ok().body(userService.register(userRequest));
//        }
	}

	// 로그인
	@PostMapping("/login")
	public ResponseEntity login(@RequestBody UserRequest userRequest) throws Exception {
		System.out.println("hello");
		System.out.println(userRequest);
		System.out.println(userRequest.getUser_id());
		return ResponseEntity.ok().body(userService.doLogin(userRequest));
	}

	@PostMapping("/user/test")
	public Map userResponseTest() {
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}

	// Access Token을 재발급 위한 api
	@PostMapping("/issue")
	public ResponseEntity issueAccessToken(HttpServletRequest request) throws Exception {
		return ResponseEntity.ok().body(userService.issueAccessToken(request));
	}

	// refresh 토큰 대신 인덱스를 반환하는 회원가입
	@PostMapping("/joinindex")
	public ResponseEntity join2(@RequestBody UserRequest userRequest) {
		if (userService.findByUserId(userRequest.getUser_id()).isPresent())
			return ResponseEntity.badRequest().build();
		else
			return ResponseEntity.ok(userService.registerIndex(userRequest));
	}

	// Access Token을 재발급 위한 api (refresh 토큰 인덱스를 통한 재발급)
	@PostMapping("/issueindex")
	public ResponseEntity issueAccessToken2(HttpServletRequest request) throws Exception {
		return ResponseEntity.ok().body(userService.issueAccessIndexToken(request));
	}
}