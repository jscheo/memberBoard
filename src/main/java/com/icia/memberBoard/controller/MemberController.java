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

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

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

    @GetMapping("/check")
    public @ResponseBody String emailCheck(@RequestParam("memberEmail") String memberEmail){
        MemberDTO memberDTO = memberService.findByEmail(memberEmail);
        if(memberDTO == null){
            return "yes";
        }
        return "no";
    }

    @GetMapping("/login")
    public String login(){
        return "memberPages/memberLogin";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model){
        MemberDTO memberDTO1 = memberService.login(memberDTO);
        session.setAttribute("loginEmail", memberDTO1.getMemberEmail());
        model.addAttribute("member", memberDTO1);
        return "memberPages/memberMain";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("loginEmail");
        return "index";
    }
}
