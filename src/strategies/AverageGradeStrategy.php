<?php

    namespace App\Strategies;

    class AverageGradeStrategy implements GradeCalculationStrategy {
        public function calculate(array $grades): float {
            return array_sum($grades) / count($grades);
        }
    }
