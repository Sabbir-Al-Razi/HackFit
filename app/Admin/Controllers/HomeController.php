<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use App\Models\GeneralEducation;


class HomeController extends Controller
{
    public function index(Content $content)
    {
        return $content
            ->title('Dashboard')
            ->description('Description...')
            // ->row(Dashboard::title())
            ->row(function (Row $row) {

                $generalEducations = GeneralEducation::latest('created_at')->limit(6)->get();

                $row->column(6, function (Column $column) use ($generalEducations) {
                    $column->append(view('admin.partials.general_educations_table', compact('generalEducations')));

                });

                $row->column(6, function (Column $column) {
                    $column->append(Dashboard::extensions());
                });

            });
    }
}
