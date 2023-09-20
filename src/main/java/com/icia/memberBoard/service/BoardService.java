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

    // 글 저장 / 파일저장처리
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
                boardFileDTO.setBoardId(saveBoard.getId());

                String savePath = "C:\\board_img\\" + storedFileName;
                boardFile.transferTo(new File(savePath));
                boardRepository.saveFile(boardFileDTO);
            }
        }
    }
    // 글 목록
    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }
    //페이지에 출력될 수 설정 후 페이지당 보여지는 갯수 설정
    public List<BoardDTO> countList(int page,int countPage) {
        Map<String, Integer> countParam = new HashMap<>();

        int pageLimit = countPage;
        int pagingStart = (page -1 ) * pageLimit;
        countParam.put("start", pagingStart);
        countParam.put("limit", pageLimit);
        return boardRepository.countList(countParam);
    }
    // 조건 없을 때 한페이지에 출력될 목록 수
    public List<BoardDTO> pagingList(int page) {
        int pageLimit = 5;
        int pagingStart = (page -1) * pageLimit;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", pageLimit);
        return boardRepository.pagingList(pagingParam);
    }
    // 페이지조건 설정 후 시작/끝 페이지 값 설정
    public PageDTO countNumber(int page, int countPage) {
        int pageLimit = countPage;
        int blockLimit = 3;

        int pageCount = boardRepository.boardCount();
        int maxPage = (int) (Math.ceil((double)pageCount / pageLimit));
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
    // 조건 없을 때 시작/끝 페이지 값 설정
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
    //샘플 데이터
    public void sampleData(BoardDTO boardDTO) {
        boardDTO.setFileAttached(0);
        boardRepository.save(boardDTO);
    }

    //검색 갑에 따라 한페이지당 출력될 갯수 설정
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

    //검색 값에 따라 시작/끝 페이지 설정
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
    //조회수 증가
    public void updateHits(Long id) {
        boardRepository.updateHits(id);
    }
    //id값으로 조회
    public BoardDTO findById(Long id) {
        return boardRepository.findById(id);
    }
    //파일 불러오기
    public List<BoardFileDTO> findFile(Long id) {
        return boardRepository.findFile(id);
    }
    // 수정 시 기존 값 불러오기
    public BoardDTO updateForm(Long id) {
        return boardRepository.updateForm(id);
    }
    //수정
    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }
    //삭제
    public void delete(Long id) {
        boardRepository.delete(id);
    }



}
