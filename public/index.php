<?php
    require_once __DIR__ . '/../vendor/autoload.php';

    use App\Models\Database;
    use App\Models\StudentModel;
    use App\Controllers\StudentController;
    use App\Views\View;

    // Подключаем конфигурацию базы данных
    $config = require __DIR__ . '/../config/database.php';
    $db = new Database($config);
    $studentModel = new StudentModel($db);
    $view = new View();

    // Инициализация контроллера
    $controller = new StudentController($studentModel, $view);

    // Проверяем GET параметры
    if (isset($_GET['group'])) {
        $group = $_GET['group'];
        $sortType = $_GET['sort'] ?? null; // Проверяем тип сортировки (если указан)
        $controller->filterByGroup($group, $sortType);
    } else {
        $controller->showGroupFilter();
    }