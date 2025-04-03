package com.demo.repositories;

import com.demo.entities.Test;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TestRepository extends CrudRepository<Test, Long> {
    public List<Test> findAllByType(int type);
}
