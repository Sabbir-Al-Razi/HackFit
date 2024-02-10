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
        $grid = new Grid(new GeneralEducation);

        // $grid->id('ID');
        $grid->title('title');
        $grid->overview('overview');
        $grid->details('details');
        $grid->home_care('home_care');
        $grid->medicare('medicare');
        $grid->image('image');
        $grid->status('status');
        $grid->created_at('created_at');
        $grid->update_at('update_at');
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
        $show = new Show(GeneralEducation::findOrFail($id));

        // $show->id('ID');
        $show->title('title');
        $show->overview('overview');
        $show->details('details');
        $show->home_care('home_care');
        $show->medicare('medicare');
        $show->image('image');
        $show->status('status');
        $show->created_at('created_at');
        $show->update_at('update_at');
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
        $form = new Form(new GeneralEducation);

        // $form->display('ID');
        $form->text('title', 'title');
        $form->text('overview', 'overview');
        $form->text('details', 'details');
        $form->text('home_care', __('Home Care'));
        $form->text('medicare', 'medicare');
        $form->file('image', 'image');
        $form->switch('status', __('Status'))->default(1);

        return $form;
    }
}
