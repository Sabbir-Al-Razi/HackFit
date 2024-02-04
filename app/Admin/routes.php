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
    $router->resource('time-slots', TimeSlotController::class);
    $router->resource('meal-categories', MealCategoryController::class);
    $router->resource('units', UnitController::class);
    $router->resource('food-items', FoodItemController::class);
    $router->resource('meals', MealController::class);
    $router->resource('user-meals', UserMealController::class);
});
