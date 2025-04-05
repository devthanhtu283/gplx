package com.demo.controllers;

import com.demo.dtos.QuestionDTO;
import com.demo.dtos.RankDTO;
import com.demo.dtos.TestDTO;
import com.demo.services.QuestionService;
import com.demo.services.RankService;
import com.demo.services.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/question")
public class QuestionController {
    @Autowired
    private QuestionService questionService;

    @GetMapping(value = "findAll", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<QuestionDTO>> findAll() {
        try {
            return new ResponseEntity<List<QuestionDTO>>(questionService.findAll(), HttpStatus.OK);
        }
        catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<QuestionDTO>>(HttpStatus.BAD_REQUEST);
        }
    }
}
