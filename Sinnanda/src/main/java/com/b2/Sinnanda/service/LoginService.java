package com.b2.Sinnanda.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.b2.Sinnanda.mapper.LoginMapper;
import com.b2.Sinnanda.vo.Admin;
import com.b2.Sinnanda.vo.Host;
import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class LoginService {
	
	@Autowired LoginMapper loginMapper;
	User loginUser = new User();
	
	// [이승준] 통합 로그인 
	public User getLoginCheckAll(User user) {
		log.debug("[Debug] \"START\" LoginService.getLoginCheckAll()");
		log.debug(" ├[param] user : "+user.toString());
		
		// 1. 회원유형 조회 (조회 실패 시, null 반환)
		String userLevel = loginMapper.selectLoginCheckAll(user);
		log.debug(" ├[param] userLevel : "+loginUser.getUserLevel());
		// 1-1. 회원이 아닐 시
		if(userLevel == null) {
			return null;
		}
		
		loginUser.setUserLevel(Integer.parseInt(userLevel));
		
		// 2-1. 회원인 경우
		if(loginUser.getUserLevel() == 1) {
			log.info(" ├[info] 회원 로그인");
			Member member = new Member();
			
			// 2-1-1. 매개변수 가공
			member.setMemberId(user.getUserId());
			member.setMemberPw(user.getUserPw());
			
			// 2-1-2. 입력받은 Id, Pw로 로그인 시도
			member = loginMapper.selectMemberLogin(member);
			
			// 2-1-3. Pw null로 변경
			member.setMemberPw(null);
			log.debug(" ├[param] member : "+member.toString());
			
			// 2-1-4. 리턴 값 가공
			loginUser.setMember(member);
		// 2-2. 사업자인 경우
		} else if(loginUser.getUserLevel() == 2) {
			log.info(" ├[info] 사업자 로그인");
			Host host = new Host();
			
			// 2-2-1. 매개변수 가공
			host.setHostId(user.getUserId());
			host.setHostPw(user.getUserPw());
			
			// 2-2-2. 입력받은 Id, Pw로 로그인 시도
			host = loginMapper.selectHostLogin(host);
			
			// 2-1-3. Pw null로 변경
			host.setHostPw(null);
			log.debug(" ├[param] host : "+host.toString());
			
			// 2-1-4. 리턴 값 가공
			loginUser.setHost(host);
			
		// 2-3. 관리자인 경우
		} else if(loginUser.getUserLevel() == 3) {
			log.info(" ├[info] 관리자 로그인");
			Admin admin = new Admin();
			
			// 2-3-1. 매개변수 가공
			admin.setAdminId(user.getUserId());
			admin.setAdminPw(user.getUserPw());
			
			// 2-3-2. 입력받은 Id, Pw로 로그인 시도
			admin = loginMapper.selectAdminLogin(admin);
			
			// 2-3-3. Pw null로 변경
			admin.setAdminPw(null);
			log.debug(" ├[param] admin : "+admin.toString());
			
			// 2-1-4. 리턴 값 가공
			loginUser.setAdmin(admin);
		}
		
		return loginUser;
	}
}
