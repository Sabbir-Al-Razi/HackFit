<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
    $router->get('google-fit-initiate', 'HomeController@googleFitInitiate')->name('googleFitInitiate');
    $router->get('bmi-calculator', 'BmiCalculatorController@index');
    $router->post('bmi-calculator', 'BmiCalculatorController@bmiCalculate')->name('bmiCalculate');
    $router->resource('time-slots', TimeSlotController::class);
    $router->resource('meal-categories', MealCategoryController::class);
    $router->resource('units', UnitController::class);
    $router->resource('food-items', FoodItemController::class);
    $router->resource('meals', MealController::class);
    $router->resource('user-meals', UserMealController::class);
    $router->resource('auth/users', CustomUserController::class);
    $router->resource('gd', GeneralEducationController::class);
    $router->resource('plan-order', PlanOrderController::class);
    $router->resource('personalized-diet-plans', PersonalizedDietController::class);
    $router->get('goal-calculator', 'GoalCalculatorController@index');
    $router->post('goal-calculator', 'GoalCalculatorController@goalCalculate')->name('goalCalculate');


});
