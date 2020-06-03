<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;
use app\admin\model\Serve as ServeModel;
use think\facade\Session;

// 模型控制器
class Serve extends Common{

    private $serve_type_id_array,$city_json,$city_arr = [];

    public function initialize(){
        // 活动类型
        $this->serve_type_id_array = change_key(Db::name('act_serve_type')->where('status','=',1)->field('id,title')->order('sort desc')->select());
        // 活动类别
        $this->serve_category_id_array = change_key(Db::name('act_serve_category')->where('status','=',1)->field('id,title')->order('sort desc')->select());
        // 城市内容
        $city_con = file_get_contents('city_json.txt');
        $city_con_decode = json_decode($city_con,true);
        foreach ($city_con_decode as $key => $val) {
            $this->city_arr[$key]['id'] = $val['id'];
            $this->city_arr[$key]['city'] = $val['city'];
        }

        $this->city_arr = change_key($this->city_arr);

        $this->assign([
            'serve_type_id_array'   => $this->serve_type_id_array,
            'serve_category_id_array'   => $this->serve_category_id_array,
            'city_arr'  =>  $this->city_arr
        ]);
    }

    /**
     * 首页
     */
    public function index(){
		
		
		
        if(request()->isPost()) {
            // $page = input('page') ? input('page') : 1;
            $key=input('post.key');
			

			if(!empty(input('pageId'))){
				$page =input('pageId');
			}else{
				$page =input('page')?input('page'):1;
			}

            $pageSize = input('limit') ? input('limit') : config('pageSize');
            $serve_type_id = input('post.serve_type_id');
            $city = input('post.city');
            $where = array();
            if( !empty($key)){
                $where[] = ['title','like',"%".trim($key)."%"];      //搜索字段
            }
            if( !empty($serve_type_id)){
                $where[] = ['search_serve_type','like',"%".trim($serve_type_id)."%"];      //搜索字段
            }
            if( !empty($city)){
                $where[] = ['search_city','like',"%".trim($city)."%"];      //搜索字段
            }
            $model = new ServeModel();
			$list = $model->where($where)->order('id desc')->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();

            foreach ($list['data'] as $key => &$value) {
                // 列表页 循环处理条件 都放在这里
                //index_for_list_data

              if(empty($value["end_time"])){
                $value["end_time"] = '';
              }else{
                $value["end_time"] = date('Y-m-d H:i',$value["end_time"]);
              }


              if(empty($value["begin_time"])){
                $value["begin_time"] = '';
              }else{
                $value["begin_time"] = date('Y-m-d H:i',$value["begin_time"]);
              }

            if(!empty($value['serve_type_id'])){
                $serve_type_id_arr = explode( ',' , $value['serve_type_id'] );
                $str = '';
                foreach ($serve_type_id_arr as $key => $val) {
                    $str .= $this->serve_type_id_array[$val]['title'] . ',' ;
                }
                $value['serve_type_id'] = rtrim($str,',') ;
                // $tutor_list['data']
                // var_dump($value['serve_type_id']);die;
            }
            

    // $list['serve_type_id_array'] = []; 
    // $value['serve_type_id'] = $list['serve_type_id_array'][$value['serve_type_id']];

                $list['data'][$key]['page'] = $page;

                
            }

            // 下拉单选处理select_index_radio
            
			
            return $result = ['code'=>0,'msg'=>'获取成功!','data'=>$list['data'],'count'=>$list['total'],'rel'=>$page,'page'=>$page];

        }
		
		$this->assign('pageId',input('page'));
        return $this->fetch();
    }

    /**
     * 修改
     * @return  array
     * @param   array    需要修改的数据注意主键一定要传  
     * @throws \think\exception\PDOException
     */
    public  function edit($id=''){
        $model = new ServeModel();
        if(request()->isPost()){
            $data = input('post.');

            $data['see_num'] = empty($data['see_num']) ? 0 : $data['see_num'] ;
            $data['cang_num'] = empty($data['cang_num']) ? 0 : $data['cang_num'] ;

            // 列表页 循环处理条件 都放在这里add_for_list_data

              if(empty($data["end_time"])){
                $data["end_time"] = time();
              }else{
                $data["end_time"] = strtotime($data["end_time"]);
              }


              if(empty($data["begin_time"])){
                $data["begin_time"] = time();
              }else{
                $data["begin_time"] = strtotime($data["begin_time"]);
              }

            $data['search_city'] = $this->city_arr[$data['city']]['city'];

            if(!empty($data['serve_type_id'])){
                $serve_type_id_arr = explode( ',' , $data['serve_type_id'] );
                $str = '';
                foreach ($serve_type_id_arr as $key => $val) {
                    $str .= $this->serve_type_id_array[$val]['title'] . ',' ;
                }
                $data['search_serve_type'] = rtrim($str,',') ;
                // var_dump($value['serve_type_id']);die;
            }

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

            $page = input('param.page');
            $this->assign('page',$page);

            // 列表页 循环处理条件 都放在这里edit_for_list_data

              if(empty( $info["end_time"] )){
                 $end_time = '';
                 $this->assign("end_time",$end_time);
              }else{
                 $end_time = date('Y-m-d H:i:s',$info["end_time"]);
                 $this->assign("end_time",$end_time);
              }


              if(empty( $info["begin_time"] )){
                 $begin_time = '';
                 $this->assign("begin_time",$begin_time);
              }else{
                 $begin_time = date('Y-m-d H:i:s',$info["begin_time"]);
                 $this->assign("begin_time",$begin_time);
              }

            
            // 下拉单选处理select_edit_radio

  $this->assign('content',$info['content']);

            // 判断   edit_explode



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
    	if(ServeModel::destroy(input('id'))){
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

              $data['see_num'] = empty($data['see_num']) ? 0 : $data['see_num'] ;
              $data['cang_num'] = empty($data['cang_num']) ? 0 : $data['cang_num'] ;

              if(empty($data["end_time"])){
                $data["end_time"] = time();
              }else{
                $data["end_time"] = strtotime($data["end_time"]);
              }


              if(empty($data["begin_time"])){
                $data["begin_time"] = time();
              }else{
                $data["begin_time"] = strtotime($data["begin_time"]);
              }

              // 用于搜索的城市

              $data['search_city'] = $this->city_arr[$data['city']]['city'];

              if(!empty($data['serve_type_id'])){
                $serve_type_id_arr = explode( ',' , $data['serve_type_id'] );
                $str = '';
                foreach ($serve_type_id_arr as $key => $val) {
                    $str .= $this->serve_type_id_array[$val]['title'] . ',' ;
                }
                $data['search_serve_type'] = rtrim($str,',') ;
                // var_dump($value['serve_type_id']);die;
            }
            
            $model = new ServeModel($data);
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

    // $list['serve_type_id_array'] = []; 
    // $this->assign('serve_type_id_array',$list['serve_type_id_array']);

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
        $model = new ServeModel();
        // 过滤post数组中的非数据表字段数据
        if($model->allowField(true)->save($data,['id' => $data['id']])){
        	return ['status'=>1,'msg'=>'设置成功!'];
        }else{
            return ['status'=>0,'msg'=>'设置失败!'];
        }
    }


    //?{{guanlian}}?



}