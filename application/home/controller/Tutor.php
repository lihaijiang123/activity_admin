<?php
namespace app\home\controller;
use think\facade\Request;
use think\Controller;
use app\home\model\TutorModel;
use app\home\model\TutorClassifyModel;
use app\home\model\CaseModel;

// 六位一体导师控制器
class Tutor extends Common{
	

    public function initialize()
    {
        parent::initialize();
      
    }


    /**
     * 服务团队
     * @Author    XZJ
     * @DateTime  2020-04-10
     * @copyright [copyright]
     * @version   [version]
     * @param     [param]
     * @return    [type]      [description]
     */
    public function list(){
         $tutor = new TutorModel();
         $service_team = TutorClassifyModel::field('id,tutor_type,english_title,describe,adept')->where('status',1)->order('sort desc')->select()->toArray();
         
         foreach ($service_team as $key => &$value) {
            $value['data'] =  TutorModel::field('id,title,thumbnail')->where(["open"=>1,'type'=>$value['id']])->order('sort')->select()->toArray();
         }
         return self::returnJson(2,'success',$service_team);
      
    }

   
    /**
     * 导师详情
     * @Author    XZJ
     * @DateTime  2020-04-10
     * @copyright [copyright]
     * @version   [version]
     * @param     [param]
     * @return    [type]      [description]
     */
    public function detail(){
      $request = input("param.");
      $id = empty($request['tutor_id']) ? "" : $request['tutor_id'];
       if(empty($id)){
         return  self::returnJson(-1,'必要参数为空！');
       }
         $case_list  = [];
         $offer_pic = [];
         $tutor_info =  TutorModel::where(["open"=>1,'id'=>$id])->order('sort')->find()->toArray();
         if($tutor_info['type'] == 1 ||$tutor_info['type'] == 2){
             $case_list  = CaseModel::field('id,title,xx_logo,score')->where(["is_show"=>1,'tutor_id'=>$id])->order('sort desc,add_time desc')->limit(6)->select()->toArray();
             foreach ($case_list as $key => &$value) {
                $value['xx_logo'] = json_decode($value['xx_logo'],true);

                 # code...
             }
              //offer图片展示
            if(!empty($tutor_info['offer_pic'])){
                $offer_pic = json_decode($tutor_info['offer_pic'],true);
            }
         }
         $data['detail'] = $tutor_info;
         $data['case_list'] = $case_list;
         $data['offer_pic'] = $offer_pic;
         return self::returnJson(2,'success',$data);
    }

  

}