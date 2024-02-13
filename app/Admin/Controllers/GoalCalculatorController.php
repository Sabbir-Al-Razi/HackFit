<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Layout\Column;
use Illuminate\Http\Request;

class GoalCalculatorController extends Controller
{

    protected $title = 'Goal Calculator';


    protected $data;

    public function index(Content $content)
    {
        $data['goal'] = 0;
        $data['inputData'] = [];

        return $this->goalCalculatorView($content, $data);
    }

    private function goalCalculatorView(Content $content, $data)
    {
        $content->title($this->title);
        $this->data = $data;

        $content->row(function (Row $row) {
            $row->column(7, function (Column $column) {
                $column->append($this->goalCalculatorForm());
            });

            $row->column(5, function (Column $column) {
                $column->append($this->goalCalculatorGraph());
            });
        });

        return $content;
    }

    private function goalCalculatorForm()
    {
        return view('admin.goalCalculator.form', $this->data);
    }

    private function goalCalculatorGraph()
    {
        return view('admin.goalCalculator.goalCalculator', $this->data);
    }

    public function goalCalculate(Content $content, Request $request)
    {

        $height_feet = $request->height_feet > 0 ? $request->height_feet : 0;
        $height_inches = $request->height_inches > 0 ? $request->height_inches : 0;
        $feetInMeters = $height_feet * 0.3048;
        $inchesInMeters = $height_inches * 0.0254;

        $height = $feetInMeters + $inchesInMeters;

        $currentWeight = $request->weight;
        $age = $request->weight;
        $goal = $request->age;
        $targetWeight = $request->target_weight;
        $timeframe = $request->timeframe;

        $bmr = $this->calculateBMR($currentWeight, $height, $age);

        $activityLevel = $request->activity_level; // sedentary, lightly_active, moderately_active, very_active
        $tdee = $this->calculateTDEE($bmr, $activityLevel);

        $caloricChangePerWeek = ($targetWeight - $currentWeight) / $timeframe;
        $caloricChangePerDay = $caloricChangePerWeek / 7;

        $targetCalories = $tdee + ($caloricChangePerDay * 3500);

        $data = [
            'current_weight' => $currentWeight,
            'target_weight' => $targetWeight,
            'bmr' => $bmr,
            'tdee' => $tdee,
            'timeframe' => $timeframe,
            'target_calories' => $targetCalories,
            'activity_level' => $activityLevel
        ];

        $data['inputData'] = $request->all();


        // dd($data);
        return $this->goalCalculatorView($content, $data);
    }

    private function calculateBMR($weight, $height, $age)
    {
        $bmr = (10 * $weight) + (6.25 * $height * 100) - (5 * $age) + 5;

        return $bmr;
    }
    private function calculateTDEE($bmr, $activityLevel)
    {
        $activityFactors = [
            'sedentary' => 1.2,
            'lightly_active' => 1.375,
            'moderately_active' => 1.55,
            'very_active' => 1.725
        ];

        return $bmr * $activityFactors[$activityLevel];
    }
}
