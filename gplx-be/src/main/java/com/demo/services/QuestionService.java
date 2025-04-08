package com.demo.services;

import com.demo.dtos.QuestionDTO;

import java.util.List;

public interface QuestionService {
    public List<QuestionDTO> findAll();
}
