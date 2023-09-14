package com.icia.memberBoard.controller;

import com.icia.memberBoard.dto.BoardDTO;
import com.icia.memberBoard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("/save")
    public String save(){
        return "/boardPages/boardSave";
    }
    @GetMapping("/list")
    public String list(){
        return "/boardPages/boardList";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.save(boardDTO);
        return "/boardPages/boardList";
    }

}
