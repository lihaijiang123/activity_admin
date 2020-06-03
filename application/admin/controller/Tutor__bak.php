<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;
use app\admin\model\Tutor as TutorModel;
use app\admin\model\Classifytutor ;
use think\facade\Session;


// 模型控制器
class Tutor extends Common{

    /**
     * 首页
     */
    public function index(){
        $classify  = Classifytutor::where('status',1)->field('id,tutor_type')->select();
        $this->assign('classify',$classify);
        if(request()->isPost()) {
            $page = input('page') ? input('page') : 1;
            $pageSize = input('limit') ? input('limit') : config('pageSize');
            $key=input('post.key');
            $type = input('post.type');
            $where = array();
            if(!empty($key)){
                $where[] = ['siging_tutor.title|siging_tutor.name|siging_tutor.school|siging_tutor.major|siging_tutor.degree|siging_tutor.personal_profile','like',"%".trim($key)."%"];      //搜索字段
            }
            if(!empty($type)){
                $where[] = ['siging_tutor.type','=' , trim($type)];
            }   
            $model = new TutorModel();
			$list = $model->join(config('database.prefix').'siging_tutor_classify s','siging_tutor.type = s.id','left')
                    ->where($where)
                    ->order('siging_tutor.id desc')
                    ->field('siging_tutor.id,siging_tutor.name,siging_tutor.open,siging_tutor.thumbnail,s.tutor_type')
                    ->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();
               

        //     foreach ($list['data'] as $key => &$value) {
        //         // 列表页 循环处理条件 都放在这里
        //         //index_for_list_data
                
        //     }
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
        $model = new TutorModel();
        if(request()->isPost()){
            $data = input('post.');
           
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

            $classify  = Classifytutor::where('status',1)->field('id,tutor_type')->select();
            $this->assign("offer_pic",json_decode($info['offer_pic'],true));
            $this->assign('classify',$classify);
            $this->assign('info_array',$info);
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
    	if(TutorModel::destroy(input('id'))){
    		 return $result = ['code'=>1,'msg'=>'删除成功!'];
    	}else{
              return $result = ['code'=>0,'msg'=>'删除失败!'];
        }
    }
    public function add(){

        if(request()->isPost()){
            $data = input('post.');
            $data['add_time'] = time();
            $model = new TutorModel($data);
            if($model->allowField(true)->save()){
                $result['msg'] = '添加成功!';
                $result['url'] = url('index');
                $result['code'] = 1;
            }else{
                $result['msg'] = '添加失败!';
                $result['code'] = 0;
            }
        }else {

            $tutor_type = Classifytutor::where('status',1)->field('id,tutor_type')->select();
            $this->assign('tutor_type',$tutor_type);
            // $this->assign('title_arr',$title_arr);
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
        $model = new TutorModel();
        // 过滤post数组中的非数据表字段数据
        if($model->allowField(true)->save($data,['id' => $data['id']])){
        	return ['code'=>1,'msg'=>'设置成功!'];
        }else{
            return ['code'=>0,'msg'=>'设置失败!'];
        }
    }


    //?{{guanlian}}?



}