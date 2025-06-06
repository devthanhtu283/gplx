package com.demo.repositories;

import com.demo.dtos.QuestionDTO;
import com.demo.entities.Question;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionRepository extends CrudRepository<Question, Integer> {

    @Query("SELECT q FROM Question q WHERE q.isFailed = true")
    public List<Question> findAllFailedQuestions();

    @Query("SELECT q FROM Question q WHERE q.isFailed = true and q.isRankA = true" )
    public List<Question> findAllFailedQuestionsByRank();

    @Query("SELECT q FROM Question q LEFT JOIN FETCH q.answers WHERE q.id = :id")
    Question findByIdWithAnswers(@Param("id") Integer id);

    List<Question> findByStatusTrue();
}
