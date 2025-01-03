<?php

    namespace App\Views;

    class View {

        // Метод для отображения фильтрации по группам
        public function renderGroupFilter($groups) {
            echo "<!DOCTYPE html>";
            echo "<html lang='ru'>";
            echo "<head>";
            echo "<meta charset='UTF-8'>";
            echo "<meta name='viewport' content='width=device-width, initial-scale=1.0'>";
            echo "<title>Фильтрация по группам</title>";
            echo "<link rel='stylesheet' href='/course_paper/public/styles.css'>"; // Подключение стилей
            echo "</head>";
            echo "<body>";
            echo "<div class='container'>";
            echo "<h1>Выбор группы</h1>";
            echo "<form method='GET' action='/course_paper/public/'>";
            echo "<select name='group'>";
            foreach ($groups as $group) {
                echo "<option value='{$group}'>{$group}</option>";
            }
            echo "</select>";
            echo "<button type='submit'>Выбрать</button>";
            echo "</form>";
            echo "</div>";
            echo "</body>";
            echo "</html>";
        }

        // Метод для отображения таблицы с оценками студентов
        public function renderStudentGradesTable($tableData, $disciplines, $group) {
            // Начало HTML-документа
            echo "<!DOCTYPE html>";
            echo "<html lang='en'>";
            echo "<head>";
            echo "<meta charset='UTF-8'>";
            echo "<meta name='viewport' content='width=device-width, initial-scale=1.0'>";
            echo "<title>Таблица успеваемости студентов</title>";
            echo "<link rel='stylesheet' href='/course_paper/public/styles.css'>"; // Подключение файла со стилями
            echo "</head>";
            echo "<body>";
            echo "<div class='container'>";
        
            // Заголовок таблицы
            echo "<h2>Группа: $group</h2>";
            
            // Таблица успеваемости студентов
            echo "<table>";
            echo "<tr>";
            echo "<th>Студент</th>";
            foreach ($disciplines as $discipline) {
                echo "<th>{$discipline['name']}</th>";
            }
            echo "<th>Средний балл</th>";
            echo "</tr>";
        
            // Заполнение таблицы данными
            foreach ($tableData as $row) {
                echo "<tr>";
                echo "<td>{$row['student']}</td>";
                foreach ($disciplines as $discipline) {
                    echo "<td>" . number_format($row['grades'][$discipline['name']], 2) . "</td>";
                }
                echo "<td>" . number_format($row['grades']['Средний балл'], 2) . "</td>";
                echo "</tr>";
            }
            echo "</table>";
        
            // Добавление кнопок сортировки
            echo "<div class='sort-buttons'>";
            echo "<form method='GET' action=''>";
            echo "<input type='hidden' name='group' value='$group'>";
            echo "<button type='submit' name='sort' value='alphabetical'>Сортировать по алфавиту</button>";
            echo "<button type='submit' name='sort' value='by_grade'>Ранжировать от высшего среднего балла к низшему</button>";
            echo "</form>";
            echo "</div>";
            // Кнопка назад к выбору группы
            echo "<form method='GET' action=''>";
            echo "<button type='submit' name='action' value='showGroupFilter'>Назад к выбору группы</button>";
            echo "</form>";
            echo "</div>";
            echo "</body>";
            echo "</html>";
        }
        
    }