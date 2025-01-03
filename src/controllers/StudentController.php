<?php

    namespace App\Controllers;

    use App\Models\StudentModel;
    use App\Views\View;

    class StudentController {

        private $studentModel;
        private $view;

        public function __construct(StudentModel $studentModel, View $view) {
            $this->studentModel = $studentModel;
            $this->view = $view;
        }

        public function filterByGroup($group, $sortType = null) {
            // Получаем всех студентов выбранной группы
            $students = $this->studentModel->getStudentsByGroup($group);
        
            // Получаем все предметы (или дисциплины)
            $disciplines = $this->studentModel->getAllDisciplines();
        
            // Формируем таблицу с оценками студентов по предметам
            $tableData = [];
            foreach ($students as $student) {
                $grades = $this->studentModel->getGradesByStudent($student->getId());
                $studentGrades = [];
        
                foreach ($disciplines as $discipline) {
                    $gradeForDiscipline = 0;
                    $count = 0;
                    foreach ($grades as $grade) {
                        if ($grade['discipline_name'] === $discipline['name']) {
                            $gradeForDiscipline += $grade['grade'];
                            $count++;
                        }
                    }
                    $studentGrades[$discipline['name']] = $count > 0 ? $gradeForDiscipline / $count : 0;
                }
        
                $averageStudentGrade = array_sum($studentGrades) / count($studentGrades);
                $studentGrades['Средний балл'] = $averageStudentGrade;
        
                $tableData[] = [
                    'student' => $student->getName(),
                    'grades' => $studentGrades
                ];
            }
        
            // Сортировка в зависимости от переданного типа
            if ($sortType === 'alphabetical') {
                usort($tableData, function ($a, $b) {
                    return strcmp($a['student'], $b['student']);
                });
            } elseif ($sortType === 'by_grade') {
                usort($tableData, function ($a, $b) {
                    return $b['grades']['Средний балл'] <=> $a['grades']['Средний балл'];
                });
            }
        
            // Отображаем таблицу с кнопками сортировки
            $this->view->renderStudentGradesTable($tableData, $disciplines, $group);
        }

        public function showGroupFilter() {
            $groups = $this->studentModel->getAllGroups();
            $this->view->renderGroupFilter($groups);
        }
    }
