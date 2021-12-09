package com.b2.Sinnanda.service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.mapper.MemberMapper;
import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.MemberOut;

@Service
@Transactional
public class MemberService {
	
	@Autowired MemberMapper memberMapper;
	
	// 마이페이지
	public Member getMyPage(int memberNo) {
		return memberMapper.selectMyPage(memberNo);
	}
	
	// 회원 정보 수정
	public void modifyMember(Member member) {
		memberMapper.updateMember(member);
	}
	
	//	회원 이메일 인증
	public int certifyMember(Member member) {
		int result = memberMapper.certifyMember(member);
		return result;
	}
	public void certifyMemberUpdate(Member member) {
		memberMapper.certifyMemberUpdate(member);
	}
	
	//	회원 가입
	public void addMember(Member member) {

		//	이메일 인증코드 생성
		member.setMemberCertifycode(UUID.randomUUID().toString());
		//	회원 정보 추가 ( member_level = 0 비활성화 상태 )
		memberMapper.insertMember(member);
	}
	
	//	회원 탈퇴
	public void removeMember(Member member, MemberOut memberOut) {
		memberMapper.deleteMember(member);
		memberMapper.insertMemberOut(memberOut);
	}	
}