package com.demo.dtos;

import jakarta.persistence.Column;
import jakarta.persistence.Id;


public class TestDTO {
    private Long id;
    private String title;
    private String description;
    private Integer type;
    private Integer time;
    private int passedScore;
    private boolean status;
    private int numberOfQuestion;
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    public int getPassedScore() {
        return passedScore;
    }
    public void setPassedScore(int passedScore) {
        this.passedScore = passedScore;
    }
    public boolean isStatus() {
        return status;
    }
    public void setStatus(boolean status) {
        this.status = status;
    }
    public int getNumberOfQuestion() {
        return numberOfQuestion;
    }
    public void setNumberOfQuestion(int numberOfQuestion) {
        this.numberOfQuestion = numberOfQuestion;
    }
}
