package com.icia.memberBoard.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
public class BoardDTO {
    private Long id;
    private String boardTitle;
    private String boardWriter;
    private String boardContents;
    private String createdAt ;
    private int fileAttached ;
    private int boardHits ;
    private List<MultipartFile> boardFile;
}
