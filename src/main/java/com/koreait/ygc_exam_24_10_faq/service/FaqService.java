package com.koreait.ygc_exam_24_10_faq.service;

import com.koreait.ygc_exam_24_10_faq.repository.FaqRepository;
import com.koreait.ygc_exam_24_10_faq.vo.Faq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FaqService {

    @Autowired
    private FaqRepository faqRepository;

    public List<Faq> getAnswers(String question) {
        // 사용자의 질문을 기반으로 FAQ 정보를 검색
        return faqRepository.findByKeyword(question);
    }
}

