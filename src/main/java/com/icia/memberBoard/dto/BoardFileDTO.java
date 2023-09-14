package com.icia.memberBoard.dto;

import lombok.Data;

@Data
public class BoardFileDTO {
    private Long id;
    private Long boardId;
    private String originalFileName;
    private String storedFileName;
}
