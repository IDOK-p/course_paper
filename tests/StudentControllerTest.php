<?php

    use PHPUnit\Framework\TestCase;
    use App\Controllers\StudentController;
    use App\Models\StudentModel;
    use App\Views\View;

    class StudentControllerTest extends TestCase {
        public function testFilterByGroup() {
            // Создание моков для модели и представления
            $mockModel = $this->createMock(StudentModel::class);
            $mockView = $this->createMock(View::class);

            // Ожидаем, что метод getStudentsByGroup вернет массив студентов для группы "САПР 1.1"
            $mockModel->method('getStudentsByGroup')->willReturn([
                new \App\Entities\Student(1, 'Иван Иванов', 'САПР 1.1', 2021),
                new \App\Entities\Student(2, 'Петр Петров', 'САПР 1.1', 2022),
            ]);

            // Ожидаем, что метод getAllDisciplines вернет список дисциплин
            $mockModel->method('getAllDisciplines')->willReturn([
                ['id' => 1, 'name' => 'СИСТЕМНАЯ ИНЖЕНЕРИЯ'],
                ['id' => 2, 'name' => 'СИСТЕМЫ ОБРАБОТКИ БОЛЬШИХ ДАННЫХ'],
                ['id' => 3, 'name' => 'ПРОФ. ИН-ЯЗ КОММУНИКАЦИЯ'],
                ['id' => 4, 'name' => 'ИНФОРМАЦИОННО-КОММУНИКАЦИОННЫЕ ТЕХНОЛОГИИ'],
            ]);

            // Ожидаем, что метод renderStudentGradesTable будет вызван один раз
            $mockView->expects($this->once())->method('renderStudentGradesTable');

            // Создание контроллера и вызов метода filterByGroup с группой "САПР 1.1"
            $controller = new StudentController($mockModel, $mockView);
            $controller->filterByGroup('САПР 1.1');
        }
    }
