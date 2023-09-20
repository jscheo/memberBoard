package com.icia.memberBoard.dto;

import lombok.Data;

@Data
public class LikeDTO {
    private Long id;
    private Long commentId;
    private Long userId;
    private Long likeVal;


}
