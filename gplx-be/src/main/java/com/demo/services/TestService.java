package com.demo.services;

import com.demo.dtos.TestDTO;
import com.demo.entities.Test;

import java.util.List;

public interface TestService {
    public TestDTO findById(Long id);
    public List<TestDTO> findAllByTypeAndRankId(int type, int rankId);
}
