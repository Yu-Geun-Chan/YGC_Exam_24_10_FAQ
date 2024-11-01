package com.koreait.ygc_exam_24_10_faq.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Faq {
    private Integer id;
    private String question;
    private String answer;
}
