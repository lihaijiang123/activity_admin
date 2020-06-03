<?php


namespace app\admin\controller;


use think\Db;

class Help extends Common
{
    public function initialize()
    {
        parent::initialize();
    }

    public function index()
    {
        if (request()->isPost()) {
            Db::table('front_config')->where('name', 'help')->update(['content' => input('post.content')]);
            $result = [
                'msg' => '修改成功!',
                'url' => url('index'),
                'code' => 1,
            ];
            return $result;
        }
        $content = Db::table('front_config')->where('name', 'help')->find();
        $this->assign('info', $content['content']);
        return $this->fetch();
    }
}