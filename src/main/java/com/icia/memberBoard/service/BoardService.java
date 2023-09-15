package com.icia.memberBoard.service;

import com.icia.memberBoard.dto.BoardDTO;
import com.icia.memberBoard.dto.BoardFileDTO;
import com.icia.memberBoard.dto.PageDTO;
import com.icia.memberBoard.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;


    public void save(BoardDTO boardDTO) throws IOException {
        if(boardDTO.getBoardFile().get(0).isEmpty()){
            boardDTO.setFileAttached(0);
            boardRepository.save(boardDTO);
        }else{
            boardDTO.setFileAttached(1);
            BoardDTO saveBoard = boardRepository.save(boardDTO);
            for(MultipartFile boardFile : boardDTO.getBoardFile()){
                String originalFileName = boardFile.getOriginalFilename();
                String storedFileName = System.currentTimeMillis() + "-" + originalFileName;

                BoardFileDTO boardFileDTO = new BoardFileDTO();
                boardFileDTO.setOriginalFileName(originalFileName);
                boardFileDTO.setStoredFileName(storedFileName);
                boardFileDTO.setId(saveBoard.getId());

                String savePath = "C:\\board_img\\" + storedFileName;
                boardFile.transferTo(new File(savePath));
                boardRepository.saveFile(boardFileDTO);
            }
        }
    }

    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

    public List<BoardDTO> pagingList(int page) {
        int pageLimit = 5;
        int pagingStart = (page -1) * pageLimit;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", pageLimit);
        return boardRepository.pagingList(pagingParam);
    }

    public PageDTO pageNumber(int page) {
        int pageLimit = 5;
        int blockLimit = 3;
        int boardCount = boardRepository.boardCount();
        int maxPage = (int) (Math.ceil((double)boardCount / pageLimit));
        int startPage = (((int)(Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        int endPage = startPage + blockLimit - 1;
        if(endPage > maxPage){
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setStartPage(startPage);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setEndPage(endPage);
        return pageDTO;
    }

    public void sampleData(BoardDTO boardDTO) {
        boardDTO.setFileAttached(0);
        boardRepository.save(boardDTO);
    }

    public List<BoardDTO> searchList(String q, String type, int page) {
        Map<String, Object> searchParam = new HashMap<>();
        searchParam.put("q", q);
        searchParam.put("type", type);


        int pageLimit = 5;
        int pagingStart = (page -1) * pageLimit;
        searchParam.put("start", pagingStart);
        searchParam.put("limit", pageLimit);
        return boardRepository.searchList(searchParam);
    }

    public PageDTO searchPageNumber(String q, String type, int page) {
        int pageLimit = 5;
        int blockLimit = 3;
        Map<String, String> pagingParam = new HashMap<>();
        pagingParam.put("q", q);
        pagingParam.put("type", type);
        int boardCount = boardRepository.boardSearchCount(pagingParam);
        int maxPage = (int) (Math.ceil((double)boardCount / pageLimit));
        int startPage = (((int)(Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        int endPage = startPage + blockLimit - 1;
        if(endPage > maxPage){
           endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setEndPage(endPage);
        pageDTO.setStartPage(startPage);
        return pageDTO;
    }
}
