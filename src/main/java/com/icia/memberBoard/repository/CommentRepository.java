package com.icia.memberBoard.repository;

import com.icia.memberBoard.dto.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    private SqlSessionTemplate sql;
    // 댓글 저장
    public void save(CommentDTO commentDTO) {
        sql.insert("Comment.save", commentDTO);
    }

    //댓글 목록 불러오기(게시글과 일치하는)
    public List<CommentDTO> findAll(Long boardId) {
        return sql.selectList("Comment.findAll", boardId);
    }


    public void delete(Long id) {
        sql.delete("Comment.delete", id);
    }
}

