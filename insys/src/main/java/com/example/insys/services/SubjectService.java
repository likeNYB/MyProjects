package com.example.insys.services;

import com.example.insys.models.Subject;
import com.example.insys.repositories.SubjectRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;


@Service
@Slf4j
@RequiredArgsConstructor
public class SubjectService {
    private final SubjectRepository subjectRepository;

    public void saveSubject(Subject subject) {
        subjectRepository.save(subject);
    }

    public Subject getSubjectById(Long id) {
        return subjectRepository.findById(id).orElse(null);
    }

    public void deleteSubject(Long id) {
            subjectRepository.deleteById(id);
        }
    }
