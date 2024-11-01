package com.koreait.ygc_exam_24_10_faq.controller;

import com.koreait.ygc_exam_24_10_faq.service.FaqService;
import com.koreait.ygc_exam_24_10_faq.vo.Faq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class FaqController {

    @Autowired
    private FaqService faqService;

    @GetMapping("/usr/home/faq")
    public String showFaqPage(Model model) {
        return "usr/home/faq"; // FAQ 페이지를 보여주는 메소드
    }

    @PostMapping("/ask")
    @ResponseBody // JSON 응답을 반환하기 위해 추가
    public List<Faq> askQuestion(@RequestParam String question) {
        // 사용자 질문을 처리하고 관련된 FAQ 정보를 반환
        return faqService.getAnswers(question);
    }
}

