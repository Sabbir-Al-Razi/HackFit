<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class UserMeal extends Model
{
    use HasFactory;

    public function user()
    {
        return $this->hasOne(Administrator::class, "id", "user_id");
    }

    public function getMealsAttribute($value)
    {
        return explode(',', $value);
    }

    public function setMealsAttribute($value)
    {
        $this->attributes['meals'] = implode(',', $value);
    }
}
