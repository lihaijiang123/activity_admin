<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;
use app\admin\model\Users as UsersModel;
use think\facade\Session;

// 模型控制器
class Users extends Common{

    /**
     * 首页
     */
    public function index(){
        if(request()->isPost()) {
            $page = input('page') ? input('page') : 1;
            $pageSize = input('limit') ? input('limit') : config('pageSize');
            $key=input('post.key');
            $where = array();
            if(!empty($key)){
                $where[] = ['userName','like',"%".trim($key)."%"];      //搜索字段
            }
            $model = new UsersModel();
			$list = $model->where($where)->order('user_id desc')->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();
			
            foreach ($list['data'] as $key => &$value) {
                // 列表页 循环处理条件 都放在这里
            }
            // 下拉单选处理select_index_radio
            return $result = ['code'=>0,'msg'=>'获取成功!','data'=>$list['data'],'count'=>$list['total'],'rel'=>1];

        }
        return $this->fetch();
    }

    /**
     * 修改
     * @return  array
     * @param   array    需要修改的数据注意主键一定要传  
     * @throws \think\exception\PDOException
     */
    public  function edit($id=''){
        $model = new UsersModel();
        if(request()->isPost()){
            $data = input('post.');
            // 列表页 循环处理条件 都放在这里add_for_list_data
            if(!empty($data['password'])){
                 $data['password'] = md5($data['password'].config('pre_pwd'));
            }else{
                unset($data['password']);
            }
            // 更新数据过滤掉非数据表字段数据
            if($model->allowField(true)->save($data,['user_id' => $data['user_id']])){
                $result['msg'] = '修改成功!';
                $result['url'] = url('index');
                $result['code'] = 1;
            }else{
                $result['msg'] = '修改失败!';
                $result['code'] = 0;
            }
            return $result;
        }else{
            $info = $model->find($id)->toArray();
            $this->assign('info_array',$info);
            // 列表页 循环处理条件 都放在这里edit_for_list_data
            $this->assign('info',json_encode($info,true));
            return $this->fetch();
        }
    }

    /**
     * 删除
     * @return array
     * @param   int    id   
     * @throws \think\exception\PDOException
     */
    public function Del(){
    	if(UsersModel::destroy(input('id'))){
    		 return $result = ['code'=>1,'msg'=>'删除成功!'];
    	}else{
              return $result = ['code'=>0,'msg'=>'删除失败!'];
        }
    }


    /**
     * 添加
     * @return  array
     * @param   array   添加数据  
     * @throws \think\exception\PDOException
     */
    public function add(){
      
        if(request()->isPost()){
            $data = input('post.');
            $data['password'] = md5($data['password'].config('pre_pwd'));
            $data['create_time'] = time();
            $model = new UsersModel($data);
			// 过滤post数组中的非数据表字段数据
            if($model->allowField(true)->save()){
                $result['msg'] = '添加成功!';
                $result['url'] = url('index');
                $result['code'] = 1;
            }else{
                $result['msg'] = '添加失败!';
                $result['code'] = 0;
            }
            return $result;
        }else{
            // 下拉单选处理select_add_radio
            return $this->fetch();
        }
    }

    /**
     * 修改数据
     * @return array
     * @param   int   id  
     * @throws \think\exception\PDOException
     */
    public function updata(){
        // 获取要修改数据--修改id
        $data=input('post.');
        $model = new UsersModel();
        // 过滤post数组中的非数据表字段数据
        if($model->allowField(true)->save($data,['user_id' => $data['id']])){
        	return ['status'=>1,'msg'=>'设置成功!'];
        }else{
            return ['status'=>0,'msg'=>'设置失败!'];
        }
    }


    //?{{guanlian}}?



}