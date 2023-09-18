package com.icia.memberBoard.dto;

import lombok.Data;

@Data
public class CommentDTO {
    private Long id;
    private Long boardId;
    private String commentWriter;
    private String commentContents;
    private String createdAt;
}
