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
        Schema::create('general_education', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('details');
            $table->text('overview');
            $table->text('home_care')->nullable();
            $table->text('medicare')->nullable();
            $table->string('image','255')->nullable();
            $table->tinyInteger('status')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('general_education');
    }
};
