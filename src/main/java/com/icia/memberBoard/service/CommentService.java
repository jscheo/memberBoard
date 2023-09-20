package com.icia.memberBoard.service;


import com.icia.memberBoard.dto.CommentDTO;
import com.icia.memberBoard.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    //댓글 저장
    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);
    }

    //댓글 목록 불러오기(게시글에 해당하는 댓글만)
    public List<CommentDTO> findAll(Long boardId) {
        return commentRepository.findAll(boardId);
    }


    public void delete(Long commentId) {
        commentRepository.delete(commentId);
    }
}
