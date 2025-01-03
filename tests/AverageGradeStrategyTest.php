<?php

    use PHPUnit\Framework\TestCase;
    use App\Strategies\AverageGradeStrategy;

    class AverageGradeStrategyTest extends TestCase {
        public function testCalculate() {
            $strategy = new AverageGradeStrategy();
            $grades = [4.0, 5.0, 3.5];
            
            // Используем assertEqualsWithDelta для точного сравнения с допустимым отклонением
            $this->assertEqualsWithDelta(4.1666666667, $strategy->calculate($grades), 0.0001);
        }
    }
