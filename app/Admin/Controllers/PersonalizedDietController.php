<?php

namespace App\Admin\Controllers;

use App\Models\Meal;
use App\Models\UserMeal;
use Encore\Admin\Widgets\Box;
use Encore\Admin\Widgets\Table;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use App\Models\FoodItem;

class PersonalizedDietController extends Controller
{
    
    protected function index(Content $content)
    {

        $headers = ['Meal Name', 'Food Items', 'Total Carbs', 'Total Fat', 'Total Protein', 'Total Calories'];

        $userMeals = UserMeal::where('user_id', auth()->user()->id)->get();
        $rows = [];
        foreach ($userMeals as $key => $value) {
            $mealsDetails = Meal::whereIn('id', $value->meals)->get();
            foreach ($mealsDetails as $mealKey => $meal) {
                $rows[$mealKey][] = $meal->name;
                $foodDetails = FoodItem::whereIn('id', $meal->food_items)->get();
                $allFoods = [];
                $totalCarbs = 0;
                $totalFat = 0;
                $totalProtein = 0;
                foreach ($foodDetails as $foodKey => $food) {
                    // $rows[$key][] = $meal->name;
                    $allFoods[] = $food->name;
                    $totalCarbs += $food->carbs;
                    $totalFat += $food->fat;
                    $totalProtein += $food->protein;
                }
                $rows[$mealKey][] = implode(', ', $allFoods);
                $rows[$mealKey][] = $totalCarbs;
                $rows[$mealKey][] = $totalFat;
                $rows[$mealKey][] = $totalProtein;
                $rows[$mealKey][] = $meal->calories_intake;
            }
        }
       

        $table = new Table($headers, $rows);
        $box = new Box('', $table);

        return $content
            ->title('Personalized Diet Plan')
            ->description('List')
            ->row($box);
    }
}
