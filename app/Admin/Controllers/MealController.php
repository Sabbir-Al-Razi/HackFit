<?php

namespace App\Admin\Controllers;

use App\Models\FoodItem;
use App\Models\Meal;
use App\Models\MealCategory;
use App\Models\MealDetail;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class MealController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Meal';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Meal());
        $foodItems = FoodItem::where('status', '1')->pluck("name", "id")->toArray();

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));
        $grid->column('category.name', __('Meal category'))
        ->display(function ($val) {
            return '<a href="' . admin_url('meal-categories/' . $this->meal_category_id) . '"><strong> '. $val .'</strong></a>';
        });

        $grid->column('food_items', __('Food Items'))
        ->display(function ($val) use ($foodItems) {
            $html = null;
            foreach ($val as $key => $value) {
                $html .=  isset($foodItems[$value]) ? '<a href="' . admin_url('food-items/' . $value) . '"><strong> '. $foodItems[$value] . '<br>' .'</strong></a>' : '';
            }
            return $html;
        });

        $grid->column('calories_intake', __('Total Calories'));
        $grid->column('status', __('Status'))
        ->display(function($val) {
            if ($val == 1) {
                return '<span class="label label-success">Active</span>';
            } else {
                return '<span class="label label-danger">Inactive</span>';
            }
        });

        // $grid->column('remarks', __('Remarks'));
        $grid->column('created_at', __('Created at'))
        ->display(function($val) {
            return !empty($val) ? date('Y-m-d H:i:s', strtotime($val)) : null;
        });

        $grid->column('updated_at', __('Updated at'))
        ->display(function($val) {
            return !empty($val) ? date('Y-m-d H:i:s', strtotime($val)) : null;
        });

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Meal::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('food_items', __('Food Items'))->json();
        $show->field('meal_category_id', __('Meal category id'));
        $show->field('calories_intake', __('Calories intake'));
        $show->field('status', __('Status'));
        $show->field('remarks', __('Remarks'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Meal());

        $form->text('name', __('Name'))
        ->creationRules(['required', "unique:meals"])
        ->updateRules(['required', "unique:meals,name,{{id}}"]);

        $form->select('meal_category_id', __('Meal category'))
        ->options(function () {
            return MealCategory::where('status', '1')->pluck("name", "id");
        })
        ->rules("required");

        $form->multipleSelect('food_items', __('Food Items'))
        ->options(FoodItem::where('status', '1')->pluck("name", "id"))
        ->rules("required");

        $form->switch('status', __('Status'))->default(1);
        $form->text('remarks', __('Remarks'));

        $form->saving(function ($form) {
            $modelData = $form->model()->getAttributes();
            $foodCalory = FoodItem::where('status', '1')->pluck('calories', 'id')->toArray();
            $form->saved(function (Form $form) use ($modelData, $foodCalory) {
                if ($form->isCreating() || ($form->isEditing() && $form->model()->wasChanged())) {
                    $totalCalory = 0;
                    foreach (array_values($form->food_items) as $key => $value) {
                        if (!empty($value)) {
                            $totalCalory += isset($foodCalory[$value]) ? $foodCalory[$value] : 0;
                        }
                    }

                    Meal::where('id', $form->model()->id)->update(['calories_intake' => $totalCalory]);
                }
            });
        });
        
        return $form;
    }
}
