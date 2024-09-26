package com.example.insys.services;

import com.example.insys.models.Grade;
import com.example.insys.repositories.GradeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class GradeService {
    private final GradeRepository gradeRepository;

    public void saveGrade(Grade grade) {
        gradeRepository.save(grade);
    }
    public void deleteGrade(Long id) {
        gradeRepository.deleteById(id);
    }

}
