package com.icia.memberBoard.service;

import com.icia.memberBoard.dto.MemberDTO;
import com.icia.memberBoard.dto.MemberFileDTO;
import com.icia.memberBoard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

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

    public MemberDTO findByEmail(String memberEmail) {
        return memberRepository.findByEmail(memberEmail);
    }


    public MemberDTO login(MemberDTO memberDTO) {
        return memberRepository.login(memberDTO);
    }


    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    public void delete(Long id) {
        memberRepository.delete(id);
    }

    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }
}

