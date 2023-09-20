package com.icia.memberBoard.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
public class MemberDTO {
    private Long id ;
    private String memberEmail;
    private String memberPassword;
    private String memberName;
    private String memberMobile;
    private int memberProfile ;
    private List<MultipartFile> memberFile;
}
