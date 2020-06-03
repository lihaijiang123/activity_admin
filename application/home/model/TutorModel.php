<?php
namespace app\home\model;
use think\Model;
class TutorModel extends Model
{
	protected $table = 'siging_tutor';

	/**
	 * 获取用户信息
	 * @Author    XZJ
	 * @DateTime  2020-04-11
	 * @param     [param]
	 * @param     [type]      $where [description]
	 * @return    [type]             [description]
	 */
	public  function find($where){
        $tutorInfo =  $this->where($where)->find();
        return $tutorInfo;
    }

    
}