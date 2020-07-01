<?php
namespace app\admin\model;

use think\Model;

class ServeType extends Model
{
	// 表名
	protected $name = 'act_serve_type';
	// 主键
	protected $pk = 'id';



    public function getActiveTypes($type)
    {
        $data = $this->field('id, title')->where('status', 1)->order('sort desc')->select()->toArray();

        switch ($type) {
            case 'index':
                $brr = ['id' => 0, 'title' => '热门'];
                array_unshift($data, $brr);
                break;
            case 'list':
            default:
                //$brr = ['id' => 0, 'title' => '麻痹'];
                //$title = '全部';
                break;
        }
        return $data;
    }
}