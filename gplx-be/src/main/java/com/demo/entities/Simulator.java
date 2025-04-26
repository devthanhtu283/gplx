package com.demo.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "simulator")
public class Simulator {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(columnDefinition = "text")
    private String title;

    @Column(columnDefinition = "text")
    private String description;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "chapter_simulator_id", nullable = false)
    private ChapterSimulator chapterSimulator;

    @Column(columnDefinition = "text")
    private String videoLink;

    @Column(columnDefinition = "text")
    private String image;

    private Integer videoLength;

    private Integer dangerSecond;

    @Column(columnDefinition = "text")
    private String guideDescription;

    @Column(columnDefinition = "text")
    private String guideImage;

    @Column(nullable = false)
    private Boolean status;

    // Getters and Setters

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

    public ChapterSimulator getChapterSimulator() {
        return chapterSimulator;
    }

    public void setChapterSimulator(ChapterSimulator chapterSimulator) {
        this.chapterSimulator = chapterSimulator;
    }

    public String getVideoLink() {
        return videoLink;
    }

    public void setVideoLink(String videoLink) {
        this.videoLink = videoLink;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getVideoLength() {
        return videoLength;
    }

    public void setVideoLength(Integer videoLength) {
        this.videoLength = videoLength;
    }

    public Integer getDangerSecond() {
        return dangerSecond;
    }

    public void setDangerSecond(Integer dangerSecond) {
        this.dangerSecond = dangerSecond;
    }

    public String getGuideDescription() {
        return guideDescription;
    }

    public void setGuideDescription(String guideDescription) {
        this.guideDescription = guideDescription;
    }

    public String getGuideImage() {
        return guideImage;
    }

    public void setGuideImage(String guideImage) {
        this.guideImage = guideImage;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
}