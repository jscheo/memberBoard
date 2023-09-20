package com.icia.memberBoard.repository;

import com.icia.memberBoard.dto.BoardDTO;
import com.icia.memberBoard.dto.BoardFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    //글 저장
    public BoardDTO save(BoardDTO boardDTO) {
        sql.insert("Board.save", boardDTO);
        return boardDTO;
    }
    //게시글 작성 시 사진 저장처리
    public void saveFile(BoardFileDTO boardFileDTO) {
        sql.insert("Board.saveFile", boardFileDTO);
    }
    // 글목록 출력
    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }

    // 페이지에 출력될 수 설정 후 페이지당 보여줄 갯수
    public List<BoardDTO> countList(Map<String, Integer> countParam) {
        return sql.selectList("Board.countList", countParam);
    }
    // 조건이 없을 때 페이지당 갯수 설정
    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.pagingList", pagingParam);
    }

    // 조건 없을 시/페이지 당 출력갯수 설정 후 페이지 수 설정
    public int boardCount() {
        return sql.selectOne("Board.count");
    }


    // 검색어 입력시 페이지 당 갯수 설정
    public List<BoardDTO> searchList(Map<String, Object> searchParam) {
        return sql.selectList("Board.search", searchParam);
    }
    // 검색어 입력시 시작페이지/앤드페이지 설정
    public int boardSearchCount(Map<String, String> pagingParam) {
        return sql.selectOne("Board.searchCount", pagingParam);
    }
    // 상세조회 들어갔을 시 조회수 올림
    public void updateHits(Long id) {
        sql.update("Board.updateHits", id);
    }
    // id 로 값 받아오기
    public BoardDTO findById(Long id) {
        return sql.selectOne("Board.findById", id);
    }
    // 저장된 파일 불러오기
    public List<BoardFileDTO> findFile(Long boardId) {
        return sql.selectList("Board.findFile", boardId);
    }
    //글 수정시 기존데이터 가져가기
    public BoardDTO updateForm(Long id) {
        return sql.selectOne("Board.updateForm", id);
    }
    //수정처리
    public Integer update(BoardDTO boardDTO) {
        return sql.update("Board.update", boardDTO);
    }
    //삭제처리
    public void delete(Long id) {
        sql.delete("Board.delete", id);
    }

    //파일dto 값 찾아오기
    public BoardFileDTO findByFile(Long boardId) {
        return sql.selectOne("Board.findByFile", boardId);
    }
    //파일 dto 삭제처리
    public void fileDelete(Long id) {
        sql.delete("Board.fileDelete", id);
    }

}
