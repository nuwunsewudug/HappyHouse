package com.ssafy.happyhouse.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/naver")
public class NaverController {
	
	@GetMapping(value="/news", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String news(String keyword, HttpServletResponse response) {
		String clientId = "OuaMukX19rGXr858Q6Hf";
		String clientSecret = "vfgUc8VKWR";
		
		String text = null;
		try {
			text = URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}
		
		String apiURL = "https://openapi.naver.com/v1/search/news?query=" + text;
		
		Map<String, String> requesHeaders = new HashMap<>();
		requesHeaders.put("X-Naver-Client-Id", clientId);
		requesHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL, requesHeaders);
		
		return responseBody;
	}

	private String get(String apiUrl, Map<String, String> requesHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requesHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}
			
			int responseCode = con.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) {
				return readBody(con.getInputStream());
			} else {
				return readBody(con.getErrorStream());
			}
			
		} catch (Exception e) {
			throw new RuntimeException("API요청과 응답 실패", e);
		}finally {
			con.disconnect();
		}
		
	}

	private String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);
		
		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();
			
			String line;
			while((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}
			
			return responseBody.toString();
		} catch (Exception e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
		
	}

	private HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
		
	}
}
