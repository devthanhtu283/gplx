package com.demo.services;

import com.demo.dtos.TestDTO;
import com.demo.entities.Test;
import com.demo.repositories.TestRepository;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestServiceImpl implements TestService {
    @Autowired
    private TestRepository testRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Override
    public TestDTO findById(Long id) {
        try {
            System.out.println(testRepository.findById(id).get());
            return modelMapper.map(testRepository.findById(id).get(), TestDTO.class);
        } catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<TestDTO> findAllByTypeAndRankId(int type, int rankId) {
        try {
            return modelMapper.map(testRepository.findByTypeAndRankId(type, rankId), new TypeToken<List<TestDTO>>() {}.getType());
        }
        catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }


}
