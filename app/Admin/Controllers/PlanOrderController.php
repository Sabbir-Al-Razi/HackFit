<?php

namespace App\Admin\Controllers;

use App\Models\PlanOrderFinal;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class PlanOrderController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Plan & Order';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new PlanOrderFinal());

        $grid->column('id', __('Id'));
        $grid->column('plan_name', __('Plan name'));
        $grid->column('description', __('Description'))
        ->display(function ($val) {
            return str_replace('||', '<br>', $val);
        });

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
        $show = new Show(PlanOrderFinal::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('plan_name', __('Plan name'));
        // $show->field('description', __('Description'));
        $show->description()->as(function ($val) {
            return str_replace('||', ', ', $val);
        });

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
        $form = new Form(new PlanOrderFinal());

        $form->text('plan_name', __('Plan name'));
        $form->textarea('description', __('Description'));

        return $form;
    }
}
