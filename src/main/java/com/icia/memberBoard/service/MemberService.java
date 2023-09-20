package com.icia.memberBoard.service;

import com.icia.memberBoard.dto.MemberDTO;
import com.icia.memberBoard.dto.MemberFileDTO;
import com.icia.memberBoard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    // 회원가입/ 프로필 사진 저장 처리
    public void save(MemberDTO memberDTO) throws IOException {
        if (memberDTO.getMemberFile() == null) {
            memberDTO.setMemberProfile(0);
            memberRepository.save(memberDTO);
        } else {
            memberDTO.setMemberProfile(1);
            MemberDTO saveMember = memberRepository.save(memberDTO);
            MultipartFile memberFile = memberDTO.getMemberFile();
            String originalFileName = memberFile.getOriginalFilename();
            String storedFileName = System.currentTimeMillis() + "-" + originalFileName;
            MemberFileDTO memberFileDTO = new MemberFileDTO();
            memberFileDTO.setOriginalFileName(originalFileName);
            memberFileDTO.setStoredFileName(storedFileName);
            memberFileDTO.setMemberId(saveMember.getId());
            String savePath = "C:\\member_img\\" + storedFileName;
            memberFile.transferTo(new File(savePath));
            memberRepository.saveFile(memberFileDTO);
        }

    }

    // 이메일 중목체크
    public MemberDTO findByEmail(String memberEmail) {
        return memberRepository.findByEmail(memberEmail);
    }

    //로그인 처리
    public MemberDTO login(MemberDTO memberDTO) {
        return memberRepository.login(memberDTO);
    }

    //회원목록(관리자 삭제)
    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    // 회원삭제
    public void delete(Long id) {
        memberRepository.delete(id);
    }

    //수정
    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }

    //회원탈퇴
    public void deleteMember(String memberEmail) {
        memberRepository.deleteMember(memberEmail);
    }

    public MemberDTO loginCheck(String memberEmail, String memberPassword) {
        Map<String, String> checkParam = new HashMap<>();
        checkParam.put("memberEmail", memberEmail);
        checkParam.put("memberPassword", memberPassword);
        return memberRepository.loginCheck(checkParam);
    }
}

