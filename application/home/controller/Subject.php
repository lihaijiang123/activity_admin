<?php
namespace app\home\controller;
use think\facade\Request;
use think\Controller;
use think\db;
// 专业
class Subject extends Common{
	
    public function initialize()
    {
        parent::initialize();
    }
    /**
     * 美国
     * @param     [param]
     * @return    [type]      [description]
     */
    public function index(){
    	$data = input();
    	// 学科id
    	$subject_id = !isset($data['subjectId']) ? 3 : $data['subjectId'] ;
    	// 专业id
    	$major_id = !isset( $data['majorId'] ) ? 0 : $data['majorId'] ;
        $where = [];

    	// 学科列表
    	$subject_list = Db::name('siging_subject')->field('id,subject_name')->where('status',1)->order('sort asc')->select();
    	// z专业列表
    	$major_list = Db::name('siging_major')->field('major_id,major_name')->where(['status'=>1,'subject_id'=>$subject_id])->order('sort asc')->select();
         if(!empty($major_id)){
             $where['major_id'] = $major_id;
        }else{
            if($major_list){
                    $where['major_id'] = $major_list[0]['major_id'];
            }
          
        }
        $major_info = Db::name('siging_major')->where($where)->order('sort asc')->find();

    	$return['subject_list'] = $subject_list;
    	$return['major_list'] = $major_list;
    	$return['major_info'] = $major_info;
    	self::returnJson(2,'成功',$return);
    }
     /**
     * 英国
     * @param     [param]
     * @return    [type]      [description]
     */
    public function index_uk(){
        $data = input();
        // 学科id
        $subject_id = !isset($data['subjectId']) ? 9 : $data['subjectId'] ;
        // 专业id
        $major_id = !isset( $data['majorId'] ) ? 0 : $data['majorId'] ;
        $where = [];

        // 学科列表
        $subject_list = Db::name('siging_subject_uk')->field('id,subject_name')->where('status',1)->order('sort asc')->select();
        // z专业列表
        $major_list = Db::name('siging_major_uk')->field('major_id,major_name')->where(['status'=>1,'subject_id'=>$subject_id])->order('sort asc')->select();
         if(!empty($major_id)){
             $where['major_id'] = $major_id;
        }else{
            if($major_list){
                    $where['major_id'] = $major_list[0]['major_id'];
            }
          
        }
        $major_info = Db::name('siging_major_uk')->where($where)->order('sort asc')->find();
      

        $return['subject_list'] = $subject_list;
        $return['major_list'] = $major_list;
        $return['major_info'] = $major_info;
        self::returnJson(2,'成功',$return);
    }
}