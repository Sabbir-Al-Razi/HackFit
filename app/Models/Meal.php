<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Meal extends Model
{
    use HasFactory;

    public function category()
    {
        return $this->hasOne(MealCategory::class, "id", "meal_category_id");
    }

    public function getFoodItemsAttribute($value)
    {
        return explode(',', $value);
    }

    public function setFoodItemsAttribute($value)
    {
        $this->attributes['food_items'] = implode(',', $value);
    }
}
