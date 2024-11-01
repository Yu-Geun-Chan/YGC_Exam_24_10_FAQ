<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>FAQ 게시판</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f8f9fa;
      margin: 0;
      padding: 20px;
    }

    h1 {
      text-align: center;
      color: #343a40;
      font-size: 24px; /* 제목 크기 */
    }

    .container {
      max-width: 600px; /* 컨텐츠 영역의 최대 너비 조정 */
      margin: 10% auto; /* 중앙 정렬 */
      padding: 20px; /* 패딩 추가 */
      background-color: white; /* 배경색 흰색 */
      border: 1px solid #ced4da; /* 테두리 추가 */
      border-radius: 8px; /* 테두리 둥글게 */
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
    }

    #userQuestion {
      width: 80%;
      padding: 8px; /* 패딩 조정 */
      margin: 10px 0;
      border: 1px solid #ced4da;
      border-radius: 4px;
      font-size: 14px; /* 폰트 크기 조정 */
    }

    #askButton {
      width: 10%;
      padding: 8px; /* 패딩 조정 */
      background-color: #007bff;
      margin: 10px;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 14px; /* 폰트 크기 조정 */
    }

    #askButton:hover {
      background-color: #0056b3;
    }

    #faqResponses {
      margin-top: 20px;
      font-size: 14px; /* 폰트 크기 조정 */
    }

    hr {
      border: 0;
      height: 1px;
      background-color: #e9ecef;
      margin: 5px 0; /* 마진 조정 */
    }

    p {
      margin: 4px 0; /* 마진 조정 */
    }

    strong {
      color: #007bff;
    }
  </style>
</head>
<body>
<div class="container"> <!-- 컨텐츠 영역 -->
  <h1>FAQ 게시판</h1>
  <input type="text" id="userQuestion" placeholder="질문을 입력하세요">
  <button id="askButton">질문</button>

  <div id="faqResponses"></div>
</div>

<script>
  $(document).ready(function () {
    // 질문 제출 함수
    function submitQuestion() {
      const question = $("#userQuestion").val();
      if (question.trim() === "") {
        alert("질문을 입력하세요."); // 질문이 비어있으면 경고
        return;
      }
      $.post("/ask", { question: question }, function (data) {
        let responses = "<h2>FAQ:</h2>";
        const seenQuestions = new Set(); // 중복 질문을 추적하기 위한 Set

        if (data.length > 0) {
          data.forEach(function (faq) {
            if (!seenQuestions.has(faq.question)) { // 중복 질문 확인
              seenQuestions.add(faq.question); // 질문을 Set에 추가
              responses += "<p><strong>Q: " + faq.question + "</strong></p>"; // 질문을 굵게 표시
              responses += "<p>A: " + faq.answer + "</p>"; // 답변 표시
              responses += "<hr>"; // 답변이 끝날 때마다 밑줄 추가
            }
          });
        } else {
          responses += "<p>해당 질문에 대한 답변이 없습니다.</p>";
        }
        $("#faqResponses").html(responses); // 답변 영역 업데이트
      }).fail(function () {
        alert("질문을 처리하는 중 오류가 발생했습니다."); // AJAX 호출 실패 시 오류 알림
      });
    }

    // 버튼 클릭 이벤트
    $("#askButton").click(submitQuestion);

    // 엔터 키를 눌렀을 때 질문 제출
    $("#userQuestion").keypress(function (event) {
      if (event.which === 13) { // Enter 키의 키 코드
        event.preventDefault(); // 기본 엔터키 동작 방지
        submitQuestion(); // 질문 제출 함수 호출
      }
    });
  });
</script>

</body>
</html>
