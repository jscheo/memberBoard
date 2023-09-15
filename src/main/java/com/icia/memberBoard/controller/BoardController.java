package com.icia.memberBoard.controller;

import com.icia.memberBoard.dto.BoardDTO;
import com.icia.memberBoard.dto.PageDTO;
import com.icia.memberBoard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("/save")
    public String save() {
        return "/boardPages/boardSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.save(boardDTO);
        return "redirect:/board/list";
    }

    @GetMapping("/list")
    public String list(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                       @RequestParam(value = "q", required = false, defaultValue = "") String q,
                       @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
                       Model model) {
        List<BoardDTO> boardDTOList = null;
        PageDTO pageDTO = null;

        if (q.equals("")) {
            boardDTOList = boardService.pagingList(page);
            pageDTO = boardService.pageNumber(page);
        }else{
            boardDTOList = boardService.searchList(q, type, page);
            pageDTO = boardService.searchPageNumber(q, type, page);
        }
            model.addAttribute("boardList", boardDTOList);
            model.addAttribute("paging", pageDTO);
            model.addAttribute("q", q);
            model.addAttribute("type", type);
            model.addAttribute("page", page);
            return "/boardPages/boardList";
        }

        @GetMapping("/sample")
        public String sampleData(){
            for(int i = 1 ; i<= 20 ; i++){
                BoardDTO boardDTO = new BoardDTO();
                boardDTO.setBoardWriter("aa");
                boardDTO.setBoardTitle("title" + i);
                boardDTO.setBoardContents("contents" + i);
                boardService.sampleData(boardDTO);
            }
            return "redirect:/board/list";
        }

    }

