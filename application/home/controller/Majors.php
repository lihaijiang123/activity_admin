<?php
namespace app\home\controller;
use think\facade\Request;
use think\Controller;
use app\home\model\MajorMajors;
use app\home\model\MajorType;


//专业
class Majors extends Common{
    /**
     * @Author    XZJ
     * @DateTime  2020-04-10
     * @copyright [copyright]
     * @version   [version]
     * @param     [param]
     * @return    [type]      [description]
     */
    public function initialize()
    {
         parent::initialize();
       
    }

    /**
     * 专业
     * @Author    XZJ
     * @DateTime  2020-04-10
     * @copyright [copyright]
     * @version   [version]
     * @param     [param]
     * @return    [type]      [description]
     */
    public  function index(){
        echo "这是专业";
       
    }


}