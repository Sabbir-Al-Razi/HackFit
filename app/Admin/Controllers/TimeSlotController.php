<?php

namespace App\Admin\Controllers;

use App\Models\TimeSlot;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class TimeSlotController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'TimeSlot';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new TimeSlot());

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));
        $grid->column('time_frame', __('Time frame'));
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
        $show = new Show(TimeSlot::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('time_frame', __('Time frame'));
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
        $form = new Form(new TimeSlot());

        $form->text('name', __('Name'))
        ->creationRules(['required', "unique:time_slots"])
        ->updateRules(['required', "unique:time_slots,name,{{id}}"]);

        $form->text('time_frame', __('Time frame'))
        ->rules("required");

        $form->switch('status', __('Status'))->default(1);
        $form->text('remarks', __('Remarks'));

        return $form;
    }
}
