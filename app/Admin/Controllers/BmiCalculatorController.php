<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Layout\Column;
use Illuminate\Http\Request;

class BmiCalculatorController extends Controller
{
    public function index(Content $content)
    {
        $content->title('BMI Calculator');

        $content->row(function (Row $row) {
            $row->column(7, function (Column $column) {
                $column->append($this->calculatorForm());
            });

            $row->column(5, function (Column $column) {
                $column->append($this->calculatorGraph());
            });
        });

        return $content;
    }

    private function calculatorForm()
    {
        return view('admin.bmiCalculator.calculatorForm');
    }

    private function calculatorGraph()
    {
        return view('admin.bmiCalculator.calculatorGraph');
    }

    public function bmiCalculate(Request $request)
    {
        $height_feet = $request->height_feet > 0 ? $request->height_feet : 0;
        $height_inches = $request->height_inches > 0 ? $request->height_inches : 0;
        $weight = $request->weight > 0 ? $request->weight : 0;

        $height = (($height_feet*12) + $height_inches) * 0.0254; // Meter

        $bmi_actual = ($height > 0) ? $weight/($height*$height) : 0;
        $bmi = round($bmi_actual, 1);
        $data['bmi'] = $bmi;

        if ($bmi > 0) {
            if ($bmi < 16) {
                $class = 'Severe Thinness';
            } else if ($bmi < 17) {
                $class = 'Moderate Thinness';
            } else if ($bmi < 18.5) {
                $class = 'Mild Thinness';
            } else if ($bmi <= 25) {
                $class = 'Normal';
            } else if ($bmi < 30) {
                $class = 'Overweight';
            } else if ($bmi < 35) {
                $class = 'Obese Class I';
            } else if ($bmi < 40) {
                $class = 'Obese Class II';
            } else {
                $class = 'Obese Class III';
            }
            $data['class'] = $class;

            $healthy_weight_min = 18.5 * ($height*$height);
            $healthy_weight_max = 25 * ($height*$height);

            $data['healthy_weight_min'] = round($healthy_weight_min, 1);
            $data['healthy_weight_max'] = round($healthy_weight_max, 1);
            $data['bmi_prime'] = round(($bmi_actual/25), 2);
            $data['ponderal_index'] = round(($weight/($height*$height*$height)), 1);

            $data['lose_weight'] = $bmi > 25 ? round(($weight - $healthy_weight_max), 1) : 0;
            $data['gain_weight'] = $bmi < 18.5 ? round(($healthy_weight_min - $weight), 1) : 0;
        }



        dd($data);
    }
}
