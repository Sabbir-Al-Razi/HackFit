<?php

namespace App\Models;

use Encore\Admin\Form\Field\Time;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MealCategory extends Model
{
    use HasFactory;

    public function timeSlot()
    {
        return $this->hasOne(TimeSlot::class, "id", "time_slot_id");
    }
}
