<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Models\PlanOrder;
use Illuminate\Support\Facades\View;

class PlanOrdersServiceProvider extends ServiceProvider
{
    public function boot()
    {
        // Share $planOrders with all views
        View::share('planOrders', PlanOrder::latest()->limit(5)->get());
    }

    public function register()
    {
        //
    }
}
