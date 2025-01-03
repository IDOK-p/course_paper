<?php

    namespace App\Strategies;

    class WeightedGradeStrategy implements GradeCalculationStrategy {
        private $weights;

        public function __construct(array $weights) {
            $this->weights = $weights;
        }

        public function calculate(array $grades): float {
            $totalWeight = array_sum($this->weights);
            $weightedSum = 0;

            foreach ($grades as $index => $grade) {
                $weightedSum += $grade * ($this->weights[$index] ?? 1);
            }

            return $weightedSum / $totalWeight;
        }
    }
