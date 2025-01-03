<?php

    namespace App\Strategies;

    interface GradeCalculationStrategy {
        public function calculate(array $grades): float;
    }
