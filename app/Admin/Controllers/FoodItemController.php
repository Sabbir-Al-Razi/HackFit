<?php

namespace App\Admin\Controllers;

use App\Models\FoodItem;
use App\Models\Unit;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Contracts\Cache\Store;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Imagick\Driver;
use Illuminate\Support\Facades\Storage;

class FoodItemController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'FoodItem';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FoodItem());
        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));

        $grid->column('unit.name', __('Unit'))
        ->display(function ($val) {
            return '<a href="' . admin_url('units/' . $this->unit_id) . '"><strong> '. $val .'</strong></a>';
        });

        $grid->column('unit_value', __('Unit Value'));

        $grid->column('protein', __('Protein'));
        $grid->column('carbs', __('Carbs'));
        $grid->column('fat', __('Fat'));
        $grid->column('calories', __('Calories'));
        $grid->column('status', __('Status'))
        ->display(function($val) {
            if ($val == 1) {
                return '<span class="label label-success">Active</span>';
            } else {
                return '<span class="label label-danger">Inactive</span>';
            }
        });

        $grid->column('remarks', __('Remarks'));
        $grid->column('image', __('Image'))->image(asset('/storage'), 50, 50);

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
        $show = new Show(FoodItem::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('unit_id', __('Unit id'));
        $show->field('protein', __('Protein'));
        $show->field('carbs', __('Carbs'));
        $show->field('fat', __('Fat'));
        $show->field('calories', __('Calories'));
        $show->field('status', __('Status'));
        $show->field('remarks', __('Remarks'));
        $show->field('created_by', __('Created by'));
        $show->image()->image(asset('storage'). '/');
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
        $form = new Form(new FoodItem());
        $form->text('name', __('Name'))
        ->creationRules(['required', "unique:food_items"])
        ->updateRules(['required', "unique:food_items,name,{{id}}"]);

        $form->select('unit_id', __('Unit'))
        ->options(function () {
            return Unit::pluck("name", "id");
        })
        ->rules("required");

        $form->decimal('unit_value', __('Unit Value'))->default(0.00);

        $form->decimal('protein', __('Protein'))->default(0.00);
        $form->decimal('carbs', __('Carbs'))->default(0.00);
        $form->decimal('fat', __('Fat'))->default(0.00);
        $form->decimal('calories', __('Calories'))->default(0.00);
        $form->switch('status', __('Status'))->default(1);
        $form->text('remarks', __('Remarks'));

        $dir = public_path('/uploads/food_items/');
        // $form->image('image', __('Image'))->move(storage_path('app/public/images/food_items'));
        $form->image('image', __('Image'));

        // $thumbDir = public_path('\uploads\food_items\thumbnails');
        // $thumbsVal = $form->image('image', __('image'))
        // $form->hidden("thumbnail")->value($thumbsVal);

        $form->hidden("created_by")->value(auth()->user()->id);

        return $form;
    }
}
