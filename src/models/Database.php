<?php

    namespace App\Models;

    use PDO;

    class Database {
        private $pdo;

        public function __construct($config) {
            $dsn = "mysql:host={$config['host']};dbname={$config['dbname']};charset=utf8";
            $this->pdo = new PDO($dsn, $config['user'], $config['password'], [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            ]);
        }

        public function query($sql, $params = []) {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($params);
            return $stmt;
        }
    }
