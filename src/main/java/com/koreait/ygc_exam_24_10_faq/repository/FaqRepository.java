package com.koreait.ygc_exam_24_10_faq.repository;

import com.koreait.ygc_exam_24_10_faq.vo.Faq;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface FaqRepository {
    @Select("SELECT * FROM faq WHERE question LIKE CONCAT('%', #{keyword}, '%')")
    List<Faq> findByKeyword(String keyword);
}
