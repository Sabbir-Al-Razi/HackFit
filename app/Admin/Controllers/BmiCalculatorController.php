<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Layout\Column;

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
}
