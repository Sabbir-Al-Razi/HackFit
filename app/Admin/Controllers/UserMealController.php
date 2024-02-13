<?php

namespace App\Admin\Controllers;

use App\Models\Meal;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Models\FoodItem;
use App\Models\UserMeal;
use Encore\Admin\Controllers\AdminController;
use Illuminate\Support\Facades\Auth;

class UserMealController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'My Meals';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new UserMeal());
        $grid->model()->where('user_id', Auth::user()->id);

        $userModel = config('admin.database.users_model');
        $users = $userModel::pluck('name', 'id')->toArray();
        $meals = Meal::where('status', '1')->pluck("name", "id")->toArray();

        // $grid->column('id', __('Id'));
        // $grid->column('user_id', __('User'))
        // ->display(function ($val) use($users) {
        //     return isset($users[$val]) ? '<a href="' . admin_url('auth/users/' . $this->user_id) . '"><strong> '. $users[$val] .'</strong></a>' : '';
        // });

        $grid->column('meals', __('Meals'))
        ->display(function ($val) use ($meals) {
            $html = null;
            foreach ($val as $key => $value) {
                $html .=  isset($meals[$value]) ? '<a href="' . admin_url('meals/' . $value) . '"><strong> '. $meals[$value] . '<br>' .'</strong></a>' : '';
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

        $grid->column('remarks', __('Remarks'));
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
        $show = new Show(UserMeal::findOrFail($id));

        // $show->field('id', __('Id'));
        // $show->field('user_id', __('User id'));
        $show->field('meals', __('Meals'))->json();
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
        $form = new Form(new UserMeal());
        $userModel = config('admin.database.users_model');

        // $form->hidden('user_id')->default(auth()->user()->id)
        // ->creationRules(['required', "unique:user_meals"])
        // ->updateRules(['required', "unique:user_meals,user_id,{{id}}"]);

        $form->select('user_id', __('User'))
        ->options(function () use($userModel) {
            return $userModel::pluck("name", "id");
        })
        ->readOnly()
        ->default(auth()->user()->id)
        ->creationRules(['required', "unique:user_meals"])
        ->updateRules(['required', "unique:user_meals,user_id,{{id}}"]);
        
        $form->multipleSelect('meals', __('Meals'))
        ->options(Meal::where('status', '1')->pluck("name", "id"))
        ->rules("required");

        $form->switch('status', __('Status'))->default(1);
        $form->text('remarks', __('Remarks'));

        $form->saving(function ($form) {
            $modelData = $form->model()->getAttributes();
            $foodCalory = Meal::where('status', '1')->pluck('calories_intake', 'id')->toArray();
            $form->saved(function (Form $form) use ($modelData, $foodCalory) {
                if ($form->isCreating() || ($form->isEditing() && $form->model()->wasChanged())) {
                    $totalCalory = 0;
                    foreach (array_values($form->meals) as $key => $value) {
                        if (!empty($value)) {
                            $totalCalory += isset($foodCalory[$value]) ? $foodCalory[$value] : 0;
                        }
                    }

                    UserMeal::where('id', $form->model()->id)->update(['calories_intake' => $totalCalory]);
                }
            });
        });

        return $form;
    }
}
