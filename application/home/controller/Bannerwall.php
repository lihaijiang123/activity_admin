<?php
namespace app\home\controller;
use think\facade\Request;
use think\Controller;
use app\home\model\BannerwallModel ;

// 优质服务控制器
class Bannerwall extends Common{
	

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
        $page = input('page') ? input('page') : 1;
        $pageSize = input('limit') ? input('limit') : config('pageSize');
        $bannerwall = BannerwallModel::field('id,pic,describe')->where('status',1)->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();
         return self::returnJson(2,'success',$bannerwall);
      
    }

   
   

  

}