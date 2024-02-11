<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use App\Models\GeneralEducation;
use Illuminate\Support\Facades\Http;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        return $content
            ->title('Dashboard')
            ->description('Description...')
            // ->row(Dashboard::title())
            ->row(function (Row $row) {

                $row->column(4, function (Column $column) {
                    $response = Http::withHeaders([
                        'X-Api-Key' => 'H5eCGlzOo5lDB73CuEPVMA==5I3Zfj4xFhCVysz9'
                    ])->get('https://api.api-ninjas.com/v1/quotes', [
                        'category' => 'fitness'
                    ]);

                    $quote = "";
                    if ($response->successful()) {
                        $data = $response->json();
                        $quote = $data[0]['quote'];
                    }

                    $column->append($quote);
                });

                $row->column(8, function (Column $column) {
                    $column->append(Dashboard::extensions());
                });

            });
    }
}
