package com.example.insys.services;

import com.example.insys.models.Grade;
import com.example.insys.models.Student;
import com.example.insys.models.Subject;
import com.example.insys.repositories.StudentRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class StudentService {
    private final StudentRepository studentRepository;
    private final SubjectService subjectService;
    private final GradeService gradeService;


    public List<Student> listStudents(String name) {
        if (name != null) return studentRepository.findByName(name);
        return studentRepository.findAll();
    }

    public void saveStudent(Student student) {
        studentRepository.save(student);
    }

    public void deleteStudent(Long id) {
        Student student = studentRepository.findById(id).orElse(null);
        if (student != null) {
            List<Subject> subjects = student.getSubjects();
            subjects.forEach(subject -> {
                List<Grade> grades = subject.getGrades();
                grades.forEach(grade -> gradeService.deleteGrade(grade.getId()));
                subjectService.deleteSubject(subject.getId());
            });

            studentRepository.deleteById(id);
        }
    }

    public Student getStudentById(Long id) {
        return studentRepository.findById(id).orElse(null);
    }
}