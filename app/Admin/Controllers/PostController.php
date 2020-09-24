<?php

namespace App\Admin\Controllers;

// use App\Admin\Extensions\Tools\ReleasePost;
// use App\Admin\Extensions\Tools\RestorePost;
// use App\Admin\Extensions\Tools\ShowSelected;

use App\Models\Popup;
use App\Models\Post;
// use App\Models\PostComment;
// use App\Models\Tag;
use App\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Http\Request;
use Encore\Admin\Grid\Tools;

class PostController extends AdminController
{
    protected $title = 'Bài viết';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Post());
        $grid->id('ID');
        $grid->title('Tiêu đề')->editable();
        $grid->slug('Tóm tắt')->editable();
        $grid->created_at('Ngày tạo');
        $grid->user_id_created('Người tạo')->display(function () {
            return $this->user->name;
        } )->label();

        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->like('title', 'Tiêu đề');
        });

        return $grid;
    }

    protected function _form()
    {
        $form = new Form(new Post);


        return $form;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Post);

        $form->display('id', 'ID');
        $form->hidden('user_id_created')->default(Admin::user()->id);
        $form->text('slug', 'code');
        $form->text('title', 'Tiêu đề');
        $form->summernote('content', 'Nội dung');

        $form->display('created_at', 'Created At');
        $form->display('updated_at', 'Updated At');
        $form->disableEditingCheck();
        $form->disableCreatingCheck();
        $form->disableViewCheck();

        return $form;
    }

    /**
     * @param Request $request
     * @return mixed
     */
    public function users(Request $request)
    {
        $q = $request->get('q');

        return User::where('name', 'like', "%$q%")->paginate(null, ['id', 'name as text']);
    }

    public function release(Request $request)
    {
        foreach (Post::find($request->get('ids')) as $post) {
            $post->released = $request->get('action');
            $post->save();
        }
    }

    public function restore(Request $request)
    {
        return Post::onlyTrashed()->find($request->get('ids'))->each->restore();
    }

    public function fetch($code) {
        $post = Post::whereSlug($code)->first();
        $popup = Popup::first();
        return view('customer.layouts.post', compact('post', 'popup'));
    }
}