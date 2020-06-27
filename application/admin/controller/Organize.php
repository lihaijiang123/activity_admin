<?php


namespace app\admin\controller;


use app\admin\model\Organize as Model;

class Organize extends Common
{

    public function index()
    {

        if (request()->isPost()) {
            // $page = input('page') ? input('page') : 1;
            $key = input('post.key');


            if (!empty(input('pageId'))) {
                $page = input('pageId');
            } else {
                $page = input('page') ? input('page') : 1;
            }

            $pageSize = input('limit') ? input('limit') : config('pageSize');
            $serve_type_id = input('post.serve_type_id');
            $city = input('post.city');
            $where = array();
            if (!empty($key)) {
                $where[] = ['title', 'like', "%" . trim($key) . "%"];      //搜索字段
            }
            if (!empty($serve_type_id)) {
                $where[] = ['search_serve_type', 'like', "%" . trim($serve_type_id) . "%"];      //搜索字段
            }
            if (!empty($city)) {
                $where[] = ['search_city', 'like', "%" . trim($city) . "%"];      //搜索字段
            }
            $model = new Model();
            $list = $model->where($where)->order('id desc')->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();

            foreach ($list['data'] as $key => &$value) {
                // 列表页 循环处理条件 都放在这里
                //index_for_list_data

                // if(empty($value["end_time"])){
                //   $value["end_time"] = '';
                // }else{
                //   $value["end_time"] = date('Y-m-d H:i',$value["end_time"]);
                // }


                // if(empty($value["begin_time"])){
                //   $value["begin_time"] = '';
                // }else{
                //   $value["begin_time"] = date('Y-m-d H:i',$value["begin_time"]);
                // }

                if (!empty($value['begin_time']) && !empty($value['end_time'])) {
                    $value['real_time'] = date('Y-m-d', $value['begin_time']) . ' 至 ' . date('m-d', $value['end_time']);
                }

                if (!empty($value['serve_type_id'])) {
                    $serve_type_id_arr = explode(',', $value['serve_type_id']);
                    $str = '';
                    foreach ($serve_type_id_arr as $key => $val) {
                        $str .= $this->serve_type_id_array[$val]['title'] . ',';
                    }
                    $value['serve_type_id'] = rtrim($str, ',');
                    // $tutor_list['data']
                    // var_dump($value['serve_type_id']);die;
                }

                if (!empty($value['serve_category_id'])) {
                    $value['serve_category_id'] = $this->serve_category_id_array[$value['serve_category_id']]['title'];
                }


                // $list['serve_type_id_array'] = [];
                // $value['serve_type_id'] = $list['serve_type_id_array'][$value['serve_type_id']];

                $value['page'] = $page;


            }

            // 下拉单选处理select_index_radio


            return $result = ['code' => 0, 'msg' => '获取成功!', 'data' => $list['data'], 'count' => $list['total'], 'rel' => $page, 'page' => $page];

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

}