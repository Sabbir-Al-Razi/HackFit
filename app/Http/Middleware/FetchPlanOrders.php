<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\PlanOrder;
use Illuminate\Support\Facades\Log;
class FetchPlanOrders
{
    public function handle($request, Closure $next)
    {
        // Fetch PlanOrder data and store it in the request
        $planOrders = PlanOrder::latest()->limit(5)->get();
        // Log::debug($planOrders);
        $request->merge(['planOrders' => $planOrders]);

        return $next($request);
    }
}
