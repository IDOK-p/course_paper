<?php

    use PHPUnit\Framework\TestCase;
    use App\Models\Database;

    class DatabaseTest extends TestCase {
        public function testConnection() {
            $config = [
                'host' => 'localhost',
                'dbname' => 'student_performance',
                'user' => 'root',
                'password' => ''
            ];
            $db = new Database($config);
            $this->assertInstanceOf(Database::class, $db);
        }
    }
