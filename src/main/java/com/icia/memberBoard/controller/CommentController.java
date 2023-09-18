package com.icia.memberBoard.controller;

import com.icia.memberBoard.dto.CommentDTO;
import com.icia.memberBoard.service.BoardService;
import com.icia.memberBoard.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private BoardService boardService;

    @PostMapping("/save")
    public ResponseEntity save(@ModelAttribute CommentDTO commentDTO){
        commentService.save(commentDTO);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        System.out.println("commentDTOList = " + commentDTOList);
        return new ResponseEntity<>(commentDTOList, HttpStatus.OK);
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id){
        System.out.println("id = " + id);
        commentService.delete(id);
        return "/boardPages/boardList";
    }
}
