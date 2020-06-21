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
                $title = '热门';
                break;
            case 'list':
            default:
                $title = '全部';
                break;
        }

        array_unshift($data, ['id' => 0, 'title' => $title]);
        return $data;
    }
}