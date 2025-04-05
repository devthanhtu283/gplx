package com.demo.entities;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "test")
public class Test {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String title;

    @Column(columnDefinition = "text")
    private String description;

    @ManyToOne
    @JoinColumn(name = "rank_id")
    private Rank rank;

    private Integer time;

    private Integer type;

    @Column(name = "passed_score")
    private Integer passedScore;

    @Column(name = "number_of_questions")
    private Integer numberOfQuestions;

    private boolean status;

    @OneToMany(mappedBy = "test")
    private List<Chapter> chapters;

    @OneToMany(mappedBy = "test")
    private List<TestDetails> testDetails;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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

    public Rank getRank() {
        return rank;
    }

    public void setRank(Rank rank) {
        this.rank = rank;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getPassedScore() {
        return passedScore;
    }

    public void setPassedScore(Integer passedScore) {
        this.passedScore = passedScore;
    }

    public Integer getNumberOfQuestions() {
        return numberOfQuestions;
    }

    public void setNumberOfQuestions(Integer numberOfQuestions) {
        this.numberOfQuestions = numberOfQuestions;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public List<Chapter> getChapters() {
        return chapters;
    }

    public void setChapters(List<Chapter> chapters) {
        this.chapters = chapters;
    }

    public List<TestDetails> getTestDetails() {
        return testDetails;
    }

    public void setTestDetails(List<TestDetails> testDetails) {
        this.testDetails = testDetails;
    }
}
