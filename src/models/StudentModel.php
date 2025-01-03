<?php

    namespace App\Models;

    use App\Entities\Student;
    use PDO;
    class StudentModel {
        private $db;

        public function __construct(Database $db) {
            $this->db = $db;
        }

        public function getStudentById($id) {
            $result = $this->db->query("SELECT * FROM students WHERE id = ?", [$id])->fetch();
            return new Student($result['id'], $result['name'], $result['group'], $result['enrollment_year']);
        }

        public function getGradesByStudent($studentId) {
            $query = "
                SELECT g.grade, d.name AS discipline_name, d.type AS discipline_type
                FROM grades g
                JOIN disciplines d ON g.discipline_id = d.id
                WHERE g.student_id = ?
            ";
            return $this->db->query($query, [$studentId])->fetchAll();
        }

        public function getStudentsByGroup($group) {
            $query = "SELECT * FROM students WHERE `group` = ?";
            $results = $this->db->query($query, [$group])->fetchAll();
            return array_map(function ($row) {
                return new Student($row['id'], $row['name'], $row['group'], $row['enrollment_year']);
            }, $results);
        }

        public function getAllGroups() {
            $query = "SELECT DISTINCT `group` FROM students";
            return $this->db->query($query)->fetchAll(PDO::FETCH_COLUMN);
        }

        public function getAllDisciplines() {
            $query = "SELECT id, name FROM disciplines";
            return $this->db->query($query)->fetchAll();
        }
        
    }
