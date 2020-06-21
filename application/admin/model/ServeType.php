<?php
namespace app\admin\model;

use think\Model;

class ServeType extends Model
{
	// 表名
	protected $name = 'act_serve_type';
	// 主键
	protected $pk = 'id';


    /**
     * @return array|array[]|\array[][]
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getActiveTypes()
    {
        return $this
            ->field('id, title')
            ->where('status', 1)
            ->order('sort desc')
            ->select()
            ->toArray();
	}
}