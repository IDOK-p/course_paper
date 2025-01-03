CREATE DATABASE IF NOT EXISTS student_performance;

USE student_performance;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    `group` VARCHAR(20) NOT NULL,
    enrollment_year INT NOT NULL
);

CREATE TABLE disciplines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type ENUM('Общая', 'Специальная', 'Факультативная') NOT NULL
);

CREATE TABLE grades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    discipline_id INT NOT NULL,
    grade FLOAT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (discipline_id) REFERENCES disciplines(id) ON DELETE CASCADE
);

-- Вставка студентов

INSERT INTO students (name, `group`, enrollment_year) VALUES
('Алексей Иванов', 'САПР 1.1', 2023),
('Екатерина Петрова', 'САПР 1.1', 2023),
('Игорь Смирнов', 'САПР 1.1', 2023),
('Марина Кузнецова', 'САПР 1.1', 2023),
('Владимир Орлов', 'САПР 1.1', 2023),
('Ольга Воронова', 'САПР 1.1', 2023),
('Анна Павлова', 'САПР 1.1', 2023),
('Дмитрий Чернов', 'САПР 1.1', 2023),
('Наталья Лебедева', 'САПР 1.1', 2023),
('Павел Морозов', 'САПР 1.1', 2023),

('Сергей Власов', 'САПР 1.3', 2023),
('Мария Акимова', 'САПР 1.3', 2023),
('Денис Крылов', 'САПР 1.3', 2023),
('Виктория Захарова', 'САПР 1.3', 2023),
('Станислав Иванов', 'САПР 1.3', 2023),
('Анастасия Семёнова', 'САПР 1.3', 2023),
('Михаил Соловьев', 'САПР 1.3', 2023),
('Ирина Казакова', 'САПР 1.3', 2023),
('Юлия Федорова', 'САПР 1.3', 2023),
('Константин Борисов', 'САПР 1.3', 2023),

('Андрей Новиков', 'САПР 1.4', 2023),
('Елена Чернышева', 'САПР 1.4', 2023),
('Дмитрий Васильев', 'САПР 1.4', 2023),
('Татьяна Морозова', 'САПР 1.4', 2023),
('Роман Сидоров', 'САПР 1.4', 2023),
('Елизавета Князева', 'САПР 1.4', 2023),
('Марк Горбунов', 'САПР 1.4', 2023),
('Ксения Павлова', 'САПР 1.4', 2023),
('Александра Белова', 'САПР 1.4', 2023),
('Филипп Волков', 'САПР 1.4', 2023),

('Максим Ковалев', 'ЭВМ 1.1', 2023),
('Алёна Гусева', 'ЭВМ 1.1', 2023),
('Виктор Лебедев', 'ЭВМ 1.1', 2023),
('Дарина Шевченко', 'ЭВМ 1.1', 2023),
('Юрий Орлов', 'ЭВМ 1.1', 2023),
('Анатолий Фомин', 'ЭВМ 1.1', 2023),
('Светлана Козлова', 'ЭВМ 1.1', 2023),
('Никита Воронов', 'ЭВМ 1.1', 2023),
('София Романова', 'ЭВМ 1.1', 2023),
('Роман Хохлов', 'ЭВМ 1.1', 2023),

('Алексей Логинов', 'ЭВМ 1.2', 2023),
('Анна Мельникова', 'ЭВМ 1.2', 2023),
('Ирина Белова', 'ЭВМ 1.2', 2023),
('Кирилл Головин', 'ЭВМ 1.2', 2023),
('Мария Козлова', 'ЭВМ 1.2', 2023),
('Евгений Соловьёв', 'ЭВМ 1.2', 2023),
('Виктория Курилова', 'ЭВМ 1.2', 2023),
('Даниил Крылов', 'ЭВМ 1.2', 2023),
('Галина Романова', 'ЭВМ 1.2', 2023),
('Фёдор Петров', 'ЭВМ 1.2', 2023),

('Ирина Петрова', 'ПОАС 1.1', 2023),
('Александр Попов', 'ПОАС 1.1', 2023),
('Евгений Ребров', 'ПОАС 1.1', 2023),
('Екатерина Козлова', 'ПОАС 1.1', 2023),
('Оксана Михайлова', 'ПОАС 1.1', 2023),
('Дмитрий Иванов', 'ПОАС 1.1', 2023),
('Сергей Горбунов', 'ПОАС 1.1', 2023),
('Никита Щербаков', 'ПОАС 1.1', 2023),
('Анастасия Яковлева', 'ПОАС 1.1', 2023),
('Елизавета Громова', 'ПОАС 1.1', 2023),

('Марина Рогова', 'ПОАС 1.2', 2023),
('Игорь Волков', 'ПОАС 1.2', 2023),
('Светлана Иванова', 'ПОАС 1.2', 2023),
('Алексей Гаврилов', 'ПОАС 1.2', 2023),
('Мария Кудрявцева', 'ПОАС 1.2', 2023),
('Ольга Герасимова', 'ПОАС 1.2', 2023),
('Николай Соколов', 'ПОАС 1.2', 2023),
('Евгений Мельников', 'ПОАС 1.2', 2023),
('Татьяна Соколова', 'ПОАС 1.2', 2023),
('Павел Тарасов', 'ПОАС 1.2', 2023);


-- Вставка дисциплин

INSERT INTO disciplines (name, type) VALUES
('СИСТЕМНАЯ ИНЖЕНЕРИЯ', 'Общая'),
('СИСТЕМЫ ОБРАБОТКИ БОЛЬШИХ ДАННЫХ', 'Специальная'),
('ПРОФ. ИН-ЯЗ КОММУНИКАЦИЯ', 'Факультативная'),
('ИНФОРМАЦИОННО-КОММУНИКАЦИОННЫЕ ТЕХНОЛОГИИ', 'Специальная');


-- Вставка оценок
-- САПР 1.1
INSERT INTO grades (student_id, discipline_id, grade) VALUES
(4, 1, 82), (4, 2, 88), (4, 3, 77), (4, 4, 79),
(5, 1, 80), (5, 2, 86), (5, 3, 72), (5, 4, 78),
(6, 1, 76), (6, 2, 84), (6, 3, 69), (6, 4, 75),
(7, 1, 79), (7, 2, 81), (7, 3, 73), (7, 4, 76),
(8, 1, 83), (8, 2, 87), (8, 3, 74), (8, 4, 80),
(9, 1, 77), (9, 2, 82), (9, 3, 70), (9, 4, 75),
(10, 1, 84), (10, 2, 89), (10, 3, 80), (10, 4, 83);

-- САПР 1.3
INSERT INTO grades (student_id, discipline_id, grade) VALUES
(11, 1, 85), (11, 2, 90), (11, 3, 78), (11, 4, 82),
(12, 1, 88), (12, 2, 91), (12, 3, 81), (12, 4, 83),
(13, 1, 80), (13, 2, 86), (13, 3, 74), (13, 4, 79),
(14, 1, 82), (14, 2, 89), (14, 3, 75), (14, 4, 81),
(15, 1, 79), (15, 2, 87), (15, 3, 71), (15, 4, 77),
(16, 1, 84), (16, 2, 90), (16, 3, 80), (16, 4, 82),
(17, 1, 78), (17, 2, 85), (17, 3, 76), (17, 4, 79),
(18, 1, 83), (18, 2, 88), (18, 3, 77), (18, 4, 81),
(19, 1, 81), (19, 2, 84), (19, 3, 72), (19, 4, 76),
(20, 1, 86), (20, 2, 93), (20, 3, 83), (20, 4, 85);

-- САПР 1.4
INSERT INTO grades (student_id, discipline_id, grade) VALUES
(21, 1, 87), (21, 2, 91), (21, 3, 79), (21, 4, 83),
(22, 1, 84), (22, 2, 89), (22, 3, 77), (22, 4, 81),
(23, 1, 80), (23, 2, 85), (23, 3, 75), (23, 4, 79),
(24, 1, 83), (24, 2, 90), (24, 3, 78), (24, 4, 82),
(25, 1, 82), (25, 2, 86), (25, 3, 80), (25, 4, 84),
(26, 1, 78), (26, 2, 88), (26, 3, 73), (26, 4, 79),
(27, 1, 85), (27, 2, 89), (27, 3, 81), (27, 4, 83),
(28, 1, 77), (28, 2, 84), (28, 3, 76), (28, 4, 78),
(29, 1, 79), (29, 2, 86), (29, 3, 71), (29, 4, 75),
(30, 1, 90), (30, 2, 94), (30, 3, 85), (30, 4, 87);

-- ЭВМ 1.1
INSERT INTO grades (student_id, discipline_id, grade) VALUES
(31, 1, 76), (31, 2, 80), (31, 3, 72), (31, 4, 75),
(32, 1, 82), (32, 2, 88), (32, 3, 79), (32, 4, 83),
(33, 1, 85), (33, 2, 91), (33, 3, 77), (33, 4, 81),
(34, 1, 78), (34, 2, 84), (34, 3, 73), (34, 4, 78),
(35, 1, 79), (35, 2, 87), (35, 3, 74), (35, 4, 79),
(36, 1, 80), (36, 2, 89), (36, 3, 75), (36, 4, 81),
(37, 1, 83), (37, 2, 90), (37, 3, 80), (37, 4, 84),
(38, 1, 76), (38, 2, 82), (38, 3, 70), (38, 4, 75),
(39, 1, 84), (39, 2, 88), (39, 3, 76), (39, 4, 80),
(40, 1, 82), (40, 2, 85), (40, 3, 79), (40, 4, 83);

-- ЭВМ 1.2
INSERT INTO grades (student_id, discipline_id, grade) VALUES
(41, 1, 74), (41, 2, 78), (41, 3, 72), (41, 4, 76),
(42, 1, 80), (42, 2, 85), (42, 3, 78), (42, 4, 82),
(43, 1, 82), (43, 2, 89), (43, 3, 74), (43, 4, 77),
(44, 1, 86), (44, 2, 92), (44, 3, 81), (44, 4, 85),
(45, 1, 79), (45, 2, 83), (45, 3, 75), (45, 4, 80),
(46, 1, 76), (46, 2, 80), (46, 3, 71), (46, 4, 75),
(47, 1, 84), (47, 2, 89), (47, 3, 76), (47, 4, 81),
(48, 1, 77), (48, 2, 85), (48, 3, 79), (48, 4, 82),
(49, 1, 79), (49, 2, 81), (49, 3, 72), (49, 4, 78),
(50, 1, 86), (50, 2, 91), (50, 3, 83), (50, 4, 87);

-- ПОАС 1.1
INSERT INTO grades (student_id, discipline_id, grade) VALUES
(56, 1, 79), (56, 2, 85), (56, 3, 74), (56, 4, 78),
(57, 1, 77), (57, 2, 83), (57, 3, 73), (57, 4, 75),
(58, 1, 79), (58, 2, 84), (58, 3, 76), (58, 4, 77),
(59, 1, 82), (59, 2, 89), (59, 3, 78), (59, 4, 80),
(60, 1, 80), (60, 2, 86), (60, 3, 75), (60, 4, 79);

-- ПОАС 1.2
INSERT INTO grades (student_id, discipline_id, grade) VALUES
(61, 1, 84), (61, 2, 89), (61, 3, 79), (61, 4, 82),
(62, 1, 81), (62, 2, 87), (62, 3, 76), (62, 4, 80),
(63, 1, 82), (63, 2, 90), (63, 3, 78), (63, 4, 83),
(64, 1, 80), (64, 2, 85), (64, 3, 75), (64, 4, 78),
(65, 1, 78), (65, 2, 83), (65, 3, 72), (65, 4, 76),
(66, 1, 77), (66, 2, 82), (66, 3, 73), (66, 4, 78),
(67, 1, 84), (67, 2, 88), (67, 3, 80), (67, 4, 82),
(68, 1, 79), (68, 2, 86), (68, 3, 76), (68, 4, 81),
(69, 1, 81), (69, 2, 87), (69, 3, 78), (69, 4, 83),
(70, 1, 85), (70, 2, 91), (70, 3, 80), (70, 4, 84);
