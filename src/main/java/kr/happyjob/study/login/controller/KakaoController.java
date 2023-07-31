package kr.happyjob.study.login.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Description;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.happyjob.study.login.model.KakaoProfile;
import kr.happyjob.study.login.model.LgnInfoModel;
import kr.happyjob.study.login.model.OAuthToken;
import kr.happyjob.study.login.model.UserInfo;
import kr.happyjob.study.login.model.UsrMnuAtrtModel;
import kr.happyjob.study.login.service.LoginService;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.poi.util.SystemOutLogger;

@Controller
@RequiredArgsConstructor
@Slf4j
public class KakaoController {

	@Autowired
	LoginController loginController;

	@Autowired
	LoginService loginService;

	private final Logger logger = LogManager.getLogger(this.getClass());

	// http://localhost:80/auth/kakao/callback
	@RequestMapping("/auth/kakao/callback")
	public String kakaoCallback(String code, Model model, HttpSession session,
			@RequestParam Map<String, String> paramMap, HttpServletRequest request) throws Exception {

		// 인가 코드 확인
		logger.info("카카오 로그인");
		logger.info("인가 코드 확인 =" + code);

		// 토큰 받기(POST)
		RestTemplate rt = new RestTemplate();

		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "7ee1658a3c38d5c4932cc70798e38ed8");
		params.add("redirect_uri", "http://localhost:80/auth/kakao/callback");
		params.add("code", code);

		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

		// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음.
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				kakaoTokenRequest, String.class);

		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;

		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		logger.info("토큰 내용 확인 =" + oauthToken);

		RestTemplate rt2 = new RestTemplate();

		// HttpHeader 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);

		// Http 요청하기 - Post방식으로 - 그리고 response변수의 응답 받음
		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kakaoProfileRequest2, String.class);

		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		logger.info("KakoProfile 확인 =" + kakaoProfile.getId());

		// 회원 찾기 -> 이미 회원가입 되있으면 바로 로그인으로
		// 없으면 고정값으로 찾음 id 혹은 이메일로
		// 그 다음 user 정보 가지고 회원가입
		// 가입자 혹은 비가입자 체크 해서 처리

		int result = 0;

		Map<String, Object> param = new HashMap<String, Object>();
		UserInfo user = loginService.findById("kakao_" + kakaoProfile.getId());
		if (user.getLoginID() == null) {
			System.out.println("기존 회원이 아니기에 자동 회원가입을 진행합니다");
			String pw = UUID.randomUUID().toString();
			String pw1 = pw.split("-")[0];
			param.put("loginID", "kakao_" + kakaoProfile.getId());
			param.put("user_type", "C");
			param.put("name", kakaoProfile.getProperties().getNickname());
			param.put("password", pw1);
			param.put("user_email", kakaoProfile.getKakao_account().getEmail());
			param.put("is_delete", "2");
			result = loginService.addUser(param);

			session.setAttribute("loginId", "kakao_" + kakaoProfile.getId()); // 로그인 ID
			session.setAttribute("userNm", kakaoProfile.getProperties().getNickname()); // 사용자 성명
			session.setAttribute("userType", "C"); // 로그인 사용자 권한 A:관리자  B:기업회원  C:일반회원
			session.setAttribute("password", pw1);

		} else {
			logger.info("이미 존재하는 회원");

			model.addAttribute("loginId", "kakao_" + kakaoProfile.getId());
			model.addAttribute("userNm", kakaoProfile.getProperties().getNickname());
			model.addAttribute("userType", "C");
			model.addAttribute("password", user.getPassword());
			model.addAttribute("result", "SUCCESS");

		}
		return "/login/kakaoLogin";
	}
}
