package com.icia.memberBoard.repository;

import com.icia.memberBoard.dto.MemberDTO;
import com.icia.memberBoard.dto.MemberFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    //회원가입
    public MemberDTO save(MemberDTO memberDTO) {
        sql.insert("Member.save", memberDTO);
        return memberDTO;
    }
    // 프로필 사진 저장
    public void saveFile(MemberFileDTO memberFileDTO) {
        sql.insert("Member.saveFile", memberFileDTO);
    }
    // 이메일 중복체크
    public MemberDTO findByEmail(String memberEmail) {
        return sql.selectOne("Member.findByEmail", memberEmail);
    }
    // 로그인
    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }
    // 회원목록
    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }
    //삭제
    public void delete(Long id) {
        sql.delete("Member.delete", id);
    }
    //회원탈퇴
    public void update(MemberDTO memberDTO) {
        sql.update("Member.update", memberDTO);
    }

    public void deleteMember(String memberEmail) {
        sql.delete("Member.deleteMember", memberEmail);
    }

    public MemberDTO loginCheck(Map<String, String> checkParam) {
        return sql.selectOne("Member.loginCheck", checkParam);
    }


    public List<MemberDTO> findFile(Long memberId) {
        return sql.selectList("Member.findFile", memberId);
    }
}
