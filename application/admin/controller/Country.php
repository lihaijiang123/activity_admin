<?php


namespace app\admin\controller;


use app\admin\model\HotCountry as Model;


class Country extends Common
{
    public function initialize()
    {
        parent::initialize();
    }


    public function index()
    {

        if (request()->isPost()) {

            $model = new Model();
            $list = $model->order('sort desc')->select();
            return $result = ['code' => 0, 'msg' => '获取成功!', 'data' => $list, 'count' => count($list)];
        }
        $this->assign('pageId', input('page'));
        return $this->fetch();
    }

    /**
     * 添加
     * @param array   添加数据
     * @return  array
     * @throws \think\exception\PDOException
     */
    public function add()
    {
        if (request()->isPost()) {
            $data = input('post.');

            // 列表页 循环处理条件 都放在这里add_for_list_data

            $model = new Model($data);
            // 过滤post数组中的非数据表字段数据
            if ($model->allowField(true)->save()) {
                $result['msg'] = '添加成功!';
                $result['url'] = url('index');
                $result['code'] = 1;
            } else {
                $result['msg'] = '添加失败!';
                $result['code'] = 0;
            }
            return $result;
        } else {
            // 下拉单选处理select_add_radio
            return $this->fetch();
        }
    }


    /**
     * @param string $id
     * @return mixed
     */
    public function edit($id = '')
    {
        $model = new Model();
        if (request()->isPost()) {
            $data = input('post.');

            // 更新数据过滤掉非数据表字段数据
            if ($model->allowField(true)->save($data, ['id' => $data['id']])) {
                $result['msg'] = '修改成功!';
                $result['url'] = url('index');
                $result['code'] = 1;
            } else {
                $result['msg'] = '修改失败!';
                $result['code'] = 0;
            }
            return $result;
        } else {

            $info = $model->find($id)->toArray();
            $this->assign('info_array', $info);

            $page = input('param.page');
            $this->assign('page', $page);


            $this->assign('content', $info['content']);

            // 判断   edit_explode


            $this->assign('info', json_encode($info, true));
            return $this->fetch();
        }
    }



    /**
     * 删除
     * @param int    id
     * @return array
     * @throws \think\exception\PDOException
     */
    public function Del()
    {
        if (Model::destroy(input('id'))) {
            return $result = ['code' => 1, 'msg' => '删除成功!'];
        } else {
            return $result = ['code' => 0, 'msg' => '删除失败!'];
        }
    }
}