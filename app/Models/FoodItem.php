<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FoodItem extends Model
{
    use HasFactory;

    public function unit()
    {
        return $this->hasOne(Unit::class, "id", "unit_id");
    }

    public function user()
    {
        return $this->hasOne(User::class, "id", "created_by");
    }
}
