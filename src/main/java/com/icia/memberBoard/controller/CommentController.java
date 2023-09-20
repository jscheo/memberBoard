package com.icia.memberBoard.controller;

import com.google.protobuf.RpcUtil;
import com.icia.memberBoard.dto.CommentDTO;
import com.icia.memberBoard.service.BoardService;
import com.icia.memberBoard.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private BoardService boardService;

    //댓글 저장
    @PostMapping("/save")
    public ResponseEntity save(@ModelAttribute CommentDTO commentDTO){
        commentService.save(commentDTO);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        return new ResponseEntity<>(commentDTOList, HttpStatus.OK);
    }
    //댓글 삭제
    @GetMapping("/delete")
    public String delete(@RequestParam("commentId") Long commentId,
                         @RequestParam("boardId") Long boardId,
                         Model model){
        commentService.delete(commentId);
        model.addAttribute("id", boardId);
        return "redirect:/board/detail";
    }

}
