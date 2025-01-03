<?php

    namespace App\Entities;

    class Student {
        private $id;
        private $name;
        private $group;
        private $enrollmentYear;

        public function __construct($id, $name, $group, $enrollmentYear) {
            $this->id = $id;
            $this->name = $name;
            $this->group = $group;
            $this->enrollmentYear = $enrollmentYear;
        }

        public function getId() {
            return $this->id;
        }

        public function getName() {
            return $this->name;
        }

        public function getGroup() {
            return $this->group;
        }

        public function getEnrollmentYear() {
            return $this->enrollmentYear;
        }
    }
