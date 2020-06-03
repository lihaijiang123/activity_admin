<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;
use app\admin\model\Anli as AnliModel;
use app\admin\model\School as SchoolModel;
use think\facade\Session;

// 模型控制器
class Anli extends Common{

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
                $where[] = ['name|graduation_school|apply_degree|school_row|apply_major|siging_school.school_name','like',"%".trim($key)."%"];      //搜索字段
            }
            $model = new AnliModel();
			$list = $model->join(config('database.prefix').'siging_school','siging_school_anli.enter_school_id = siging_school.id','left')
                          ->where($where)
                          ->field('siging_school_anli.*,siging_school.school_name')
                          ->order('id desc')->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();
                    
            foreach ($list['data'] as $key => &$value) {
                // 列表页 循环处理条件 都放在这里
                //index_for_list_data
                
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
        $model = new AnliModel();
        if(request()->isPost()){
            $data = input('post.');
            // 列表页 循环处理条件 都放在这里add_for_list_data

            // 更新数据过滤掉非数据表字段数据
            if($model->allowField(true)->save($data,['id' => $data['id']])){
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
            $school  = SchoolModel::where("status",1)->field('id,school_name')->select();
            $this->assign('school',$school);



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
    	if(AnliModel::destroy(input('id'))){
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
            
            // 列表页 循环处理条件 都放在这里add_for_list_data
            
            $model = new AnliModel($data);
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
            $school  = SchoolModel::where("status",1)->field('id,school_name')->select();
            $this->assign('school',$school);
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
        $model = new AnliModel();
        // 过滤post数组中的非数据表字段数据
        if($model->allowField(true)->save($data,['id' => $data['id']])){
        	return ['status'=>1,'msg'=>'设置成功!'];
        }else{
            return ['status'=>0,'msg'=>'设置失败!'];
        }
    }


    //?{{guanlian}}?



}