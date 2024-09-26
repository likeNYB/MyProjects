package com.example.insys.contoller;

import com.example.insys.models.Grade;
import com.example.insys.models.Student;
import com.example.insys.models.Subject;
import com.example.insys.models.User;
import com.example.insys.services.GradeService;
import com.example.insys.services.StudentService;
import com.example.insys.services.SubjectService;
import com.example.insys.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class StudentController {
    private final StudentService studentService;
    private final UserService userService;
    private final SubjectService subjectService;
    private final GradeService gradeService;


    @GetMapping("/students")
    public String students(@RequestParam(name = "name", required = false) String name, Model model) {
        List<Student> students = studentService.listStudents(name);
        User loggedInUser = userService.getLoggedInUser();
        if (loggedInUser != null) {
            String role = loggedInUser.getRole();
            if ("ADMIN".equals(role)) {
                model.addAttribute("isAdmin", true);
            } else {
                model.addAttribute("isAdmin", false);
            }
        model.addAttribute("students", students);
        model.addAttribute("loggedInUser", loggedInUser);
        return "students";
        } else {
            return "redirect:/";
        }
    }

    @GetMapping("/student/{id}")
    public String studentInfo(@PathVariable("id") Long id, Model model) {
        Student student = studentService.getStudentById(id);
        User loggedInUser = userService.getLoggedInUser();
        if (loggedInUser != null) {
            String role = loggedInUser.getRole();
            if ("ADMIN".equals(role)) {
                model.addAttribute("isAdmin", true);
            } else {
                model.addAttribute("isAdmin", false);
            }
            if ("TEACHER".equals(role)) {
                model.addAttribute("isTeacher", true);
            } else {
                model.addAttribute("isTeacher", false);
            }
        model.addAttribute("student", student);
        model.addAttribute("loggedInUser", loggedInUser);
        model.addAttribute("subjects", student.getSubjects());
        return "student-info";
        } else {
            return "redirect:/";
        }
    }

    @PostMapping("/student/{studentId}/subjects/add")
    public String addSubject(@PathVariable("studentId") Long studentId, Subject subject) {
        Student student = studentService.getStudentById(studentId);
        if (student != null) {
            subject.setStudent(student);
            subjectService.saveSubject(subject);
        }
        return "redirect:/student/" + studentId;
    }

    @PostMapping("/student/{studentId}/subjects/delete/{subjectId}")
    public String deleteSubject(@PathVariable("studentId") Long studentId, @PathVariable("subjectId") Long subjectId) {
        subjectService.deleteSubject(subjectId);
        return "redirect:/student/" + studentId;
    }

    @PostMapping("/subject/{subjectId}/grades/add")
    public String addGrade(@PathVariable("subjectId") Long subjectId, Grade grade) {
        Subject subject = subjectService.getSubjectById(subjectId);
        if (subject != null) {
            grade.setSubject(subject);
            gradeService.saveGrade(grade);
        }
            return "redirect:/subject/" + subjectId + "/grades";

    }

    @GetMapping("/subject/{subjectId}/grades")
    public String subjectGrades(@PathVariable("subjectId") Long subjectId, Model model) {
        Subject subject = subjectService.getSubjectById(subjectId);
        User loggedInUser = userService.getLoggedInUser();
        if (loggedInUser != null) {
            String role = loggedInUser.getRole();
            if ("ADMIN".equals(role)) {
            model.addAttribute("isAdmin", true);
        } else {
            model.addAttribute("isAdmin", false);
        }
            if ("TEACHER".equals(role)) {
                model.addAttribute("isTeacher", true);
            } else {
                model.addAttribute("isTeacher", false);
            }
        model.addAttribute("subject", subject);
        model.addAttribute("grades", subject.getGrades());
        return "subject-grades";
        } else {
            return "redirect:/";
        }
    }

    @PostMapping("/subject/{subjectId}/grades/delete/{gradeId}")
    public String deleteGrade(@PathVariable("subjectId") Long subjectId, @PathVariable("gradeId") Long gradeId) {
        gradeService.deleteGrade(gradeId);
        return "redirect:/subject/" + subjectId + "/grades";
    }

    @PostMapping("/student/create")
    public String createStudent(Student student) throws IOException {
        studentService.saveStudent(student);
        return "redirect:/students";
    }

    @PostMapping("/student/delete/{id}")
    public String deleteStudent(@PathVariable("id") Long id) {
        studentService.deleteStudent(id);
        return "redirect:/students";
    }
}
