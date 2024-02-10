<?php

namespace App\Admin\Controllers;

use App\Models\PlanOrder;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class PlanOrderController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header(trans('admin.index'))
            ->description(trans('admin.description'))
            ->body($this->grid());
    }

    /**
     * Show interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header(trans('admin.detail'))
            ->description(trans('admin.description'))
            ->body($this->detail($id));
    }

    /**
     * Edit interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header(trans('admin.edit'))
            ->description(trans('admin.description'))
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header(trans('admin.create'))
            ->description(trans('admin.description'))
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new PlanOrder);

        // $grid->id('ID');
        $grid->plan_name('plan_name');
        $grid->workout_name('workout_name');
        $grid->workout_plan('workout_plan');
        $grid->timing('timing');
        $grid->start_time('start_time');
        $grid->end_time('end_time');
        $grid->created_at(trans('admin.created_at'));
        $grid->updated_at(trans('admin.updated_at'));

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
        $show = new Show(PlanOrder::findOrFail($id));

        // $show->id('ID');
        $show->plan_name('plan_name');
        $show->workout_name('workout_name');
        $show->workout_plan('workout_plan');
        $show->timing('timing');
        $show->start_time('start_time');
        $show->end_time('end_time');
        $show->created_at(trans('admin.created_at'));
        $show->updated_at(trans('admin.updated_at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new PlanOrder);

        $form->text('plan_name', 'Plan Name');
        $form->text('workout_name', 'Workout Name');
        $form->text('workout_plan', 'Workout Plan');
        $form->select('timing', 'Timing')->options(['hourly' => 'Hourly', 'daily' => 'Daily', 'daily twice' => 'Daily Twice', 'weekly' => 'Weekly']);
        $form->time('start_time', 'Start Time');
        $form->time('end_time', 'End Time');


        return $form;
    }
}
