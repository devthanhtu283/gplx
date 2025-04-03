package com.demo.controllers;

import com.demo.dtos.TestDTO;
import com.demo.entities.Test;
import com.demo.repositories.TestRepository;
import com.demo.services.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static org.springframework.data.jpa.domain.AbstractPersistable_.id;

@RestController
@RequestMapping("api/test")
public class TestController {
    @Autowired
    private TestService testService;
    @GetMapping(value = "findById/{id}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<TestDTO> findById(@PathVariable Long id) {
        try {
            return new ResponseEntity<TestDTO>(testService.findById(id), HttpStatus.OK);
        }
        catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<TestDTO>(HttpStatus.BAD_REQUEST);
        }
    }
    @GetMapping(value = "findAllByType/{type}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<TestDTO>> findAllByType(@PathVariable int type) {
        try {
            return new ResponseEntity<List<TestDTO>>(testService.findAllByType(type), HttpStatus.OK);
        }
        catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<TestDTO>>(HttpStatus.BAD_REQUEST);
        }
    }
}
