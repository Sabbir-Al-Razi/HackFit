<?php

namespace App\Admin\Controllers;

use App\Models\GeneralEducation;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class GeneralEducationController extends Controller
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
            ->header(trans('General education'))
            ->description(trans('GD.....'))
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
            ->header(trans('General education'))
            ->description(trans('GD.....'))
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
        $grid = new Grid(new GeneralEducation);

        // $grid->id('ID');
        $grid->title('title');
        $grid->overview('overview');
        $grid->details('details');
        $grid->home_care('home_care');
        $grid->medicare('medicare');
        $grid->column('status', __('Status'))
            ->display(function($val) {
                if ($val == 1) {
                    return '<span class="label label-success">Active</span>';
                } else {
                    return '<span class="label label-danger">Inactive</span>';
                }
            });
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
        $show = new Show(GeneralEducation::findOrFail($id));

        // $show->id('ID');
        $show->title('title');
        $show->overview('overview');
        $show->details('details');
        $show->home_care('home_care');
        $show->medicare('medicare');
        $show->image()->image(asset('storage'). '/');
        $show->status('status');
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
        $form = new Form(new GeneralEducation);

        $form->text('title', 'title')->rules("required");
        $form->text('overview', 'overview')->rules("required");
        $form->text('details', 'details');
        $form->text('home_care', __('Home Care'));
        $form->text('medicare', 'medicare');
        $dir = public_path('/uploads/GD/');
        $form->image('image', __('Image'));
        $form->switch('status', __('Status'))->default(1);

        return $form;
    }
}
