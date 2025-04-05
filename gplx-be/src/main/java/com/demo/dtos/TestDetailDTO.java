package com.demo.dtos;

public class TestDetailDTO {
    private Integer testId;
    private Integer chapterId;
    private QuestionDTO question;

    public TestDetailDTO() {
    }

    public TestDetailDTO(Integer testId, Integer chapterId, QuestionDTO question) {
        this.testId = testId;
        this.chapterId = chapterId;
        this.question = question;
    }

    public Integer getTestId() {
        return testId;
    }

    public void setTestId(Integer testId) {
        this.testId = testId;
    }

    public Integer getChapterId() {
        return chapterId;
    }

    public void setChapterId(Integer chapterId) {
        this.chapterId = chapterId;
    }

    public QuestionDTO getQuestion() {
        return question;
    }

    public void setQuestion(QuestionDTO question) {
        this.question = question;
    }
}
