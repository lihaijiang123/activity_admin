<?php
namespace app\home\model;
use think\Model;
class UsersModel extends Model
{
	protected $table = 'siging_users';

	/**
	 * 获取用户信息
	 * @Author    XZJ
	 * @DateTime  2020-04-11
	 * @param     [param]
	 * @param     [type]      $where [description]
	 * @return    [type]             [description]
	 */
	public  function find($where){
        $userInfo =  $this->where($where)->find();
        return $userInfo;
    }

    
}