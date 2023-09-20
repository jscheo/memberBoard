package com.icia.memberBoard.controller;

import com.google.protobuf.RpcUtil;
import com.icia.memberBoard.dto.MemberDTO;
import com.icia.memberBoard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;
    //마이페이지 이동
    @GetMapping("/main")
    public String main (){
        return "/memberPages/memberMain";
    }
    //회원가입
    @GetMapping("/save")
    public String save(){
        return "memberPages/memberSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        System.out.println("memberDTO = " + memberDTO);
        memberService.save(memberDTO);
        return "memberPages/memberLogin";
    }
    //이메일 중복체크
    @GetMapping("/check")
    public @ResponseBody String emailCheck(@RequestParam("memberEmail") String memberEmail){
        MemberDTO memberDTO = memberService.findByEmail(memberEmail);
        if(memberDTO == null){
            return "yes";
        }
        return "no";
    }
    //로그인
    @GetMapping("/login")
    public String login(){
        return "memberPages/memberLogin";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model){
        MemberDTO memberDTO1 = memberService.login(memberDTO);
        System.out.println("memberDTO1 = " + memberDTO1);
        if(memberDTO1 != null){
            session.setAttribute("loginEmail", memberDTO1.getMemberEmail());
            session.setAttribute("loginId", memberDTO1.getId());
            model.addAttribute("member", memberDTO1);
            return "redirect:/board/list";
        }else{
            return "memberPages/memberLogin";
        }

    }
    //로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("loginEmail");
        return "index";
    }
    //관리자메뉴 들어가기
    @GetMapping("/admin")
    public String admin(Model model){
        List<MemberDTO> memberDTO = memberService.findAll();
        model.addAttribute("memberList", memberDTO);
        return "/memberPages/memberList";
    }
    //회원삭제
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id){
        memberService.delete(id);
        return "redirect:/member/admin";
    }
    //수정
    @GetMapping("/update")
    public String update(HttpSession session ,Model model){
        String memberEmail = String.valueOf(session.getAttribute("loginEmail"));
        MemberDTO memberDTO = memberService.findByEmail(memberEmail);
        model.addAttribute("member", memberDTO);
        return "memberPages/memberUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO){
        memberService.update(memberDTO);
        return "/memberPages/memberMain";
    }
    //회원탈퇴
    @GetMapping("/memberDelete")
    public String memberDelete(HttpSession session){
        Object memberEmail = session.getAttribute("loginEmail");
        memberService.deleteMember((String) memberEmail);
        session.removeAttribute("loginEmail");
        return "index";
    }
}
