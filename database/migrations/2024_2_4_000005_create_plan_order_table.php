<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('plan_order', function (Blueprint $table) {
            $table->id();
            $table->string('plan_name');
            $table->string('workout_name');
            $table->string('workout_plan');
            $table->enum('timing', ['hourly', 'daily', 'daily twice', 'weekly']);
            $table->time('start_time')->nullable();
            $table->time('end_time')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('plan_order');
    }
};
