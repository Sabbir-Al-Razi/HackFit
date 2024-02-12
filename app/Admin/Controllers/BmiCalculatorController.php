<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Layout\Column;
use Illuminate\Http\Request;

class BmiCalculatorController extends Controller
{
    protected $data;

    public function index(Content $content)
    {
        $data['bmi'] = 0;
        $data['inputData'] = [];

        return $this->bmiCalculatorView($content, $data);
    }

    private function bmiCalculatorView(Content $content, $data)
    {
        $content->title('BMI Calculator');
        $this->data = $data;

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
        return view('admin.bmiCalculator.calculatorForm', $this->data);
    }

    private function calculatorGraph()
    {
        return view('admin.bmiCalculator.calculatorGraph', $this->data);
    }

    public function bmiCalculate(Content $content, Request $request)
    {
        $height_feet = $request->height_feet > 0 ? $request->height_feet : 0;
        $height_inches = $request->height_inches > 0 ? $request->height_inches : 0;
        $weight = $request->weight > 0 ? $request->weight : 0;

        $height = (($height_feet*12) + $height_inches) * 0.0254; // Meter

        $bmi_actual = ($height > 0) ? $weight/($height*$height) : 0;
        $bmi = round($bmi_actual, 2);
        $data['bmi'] = $bmi;
        $data['inputData'] = $request->all();

        if ($bmi > 0) {
            $bmiMeter = $this->bmiMeterCalculation($bmi_actual, $bmi);
            $data['class'] = $bmiMeter['class'];
            $data['bmi_meter'] = $bmiMeter['bmi_meter'];

            $healthy_weight_min = 18.5 * ($height*$height);
            $healthy_weight_max = 25 * ($height*$height);

            $data['healthy_weight_min'] = round($healthy_weight_min, 2);
            $data['healthy_weight_max'] = round($healthy_weight_max, 2);
            $data['bmi_prime'] = round(($bmi_actual/25), 2);
            $data['ponderal_index'] = round(($weight/($height*$height*$height)), 2);

            $data['lose_weight'] = $bmi > 25 ? round(($weight - $healthy_weight_max), 2) : 0;
            $data['gain_weight'] = $bmi < 18.5 ? round(($healthy_weight_min - $weight), 2) : 0;
        }

        return $this->bmiCalculatorView($content, $data);
    }

    private function bmiMeterCalculation($bmi_actual, $bmi)
    {
        if ($bmi < 16) {
            $class = 'Severe Thinness';
            $bm_min = 0;
            $bm_max = 15.999;
            $bmMet_min = 0;
            $bmMet_max = 17.7;
        } else if ($bmi < 17) {
            $class = 'Moderate Thinness';
            $bm_min = 16;
            $bm_max = 16.999;
            $bmMet_min = 17.8;
            $bmMet_max = 23.8;
        } else if ($bmi < 18.5) {
            $class = 'Mild Thinness';
            $bm_min = 17;
            $bm_max = 18.499;
            $bmMet_min = 23.9;
            $bmMet_max = 33;
        } else if ($bmi <= 25) {
            $class = 'Normal';
            $bm_min = 18.5;
            $bm_max = 25;
            $bmMet_min = 33.1;
            $bmMet_max = 71.9;
        } else if ($bmi < 30) {
            $class = 'Overweight';
            $bm_min = 25.001;
            $bm_max = 29.999;
            $bmMet_min = 72;
            $bmMet_max = 102;
        } else if ($bmi < 35) {
            $class = 'Obese Class I';
            $bm_min = 30;
            $bm_max = 34.999;
            $bmMet_min = 102.1;
            $bmMet_max = 132;
        } else if ($bmi < 40) {
            $class = 'Obese Class II';
            $bm_min = 35;
            $bm_max = 39.999;
            $bmMet_min = 132.1;
            $bmMet_max = 162.1;
        } else {
            $class = 'Obese Class III';
            $bm_min = 40;
            $bm_max = 43;
            $bmMet_min = 162.2;
            $bmMet_max = 180;
        }

        #BMI Meter
        $bm_diff = ($bmi_actual-$bm_min) > 0 ? $bmi_actual-$bm_min : 0;
        $bmi_meter = ((($bmMet_max-$bmMet_min)/($bm_max-$bm_min)) * $bm_diff) + $bmMet_min;
        $bmi_meter = $bmi_meter > 180 ? 180 : $bmi_meter;
        $bmi_meter = $bmi_meter < 0 ? 0 : $bmi_meter;
        $bmi_meter = round($bmi_meter, 2);

        return [
            'class' => $class,
            'bmi_meter' => $bmi_meter,
        ];
    }
}
