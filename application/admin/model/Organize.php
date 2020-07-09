<?php

namespace app\admin\model;

use think\Db;
use think\Model;

class Organize extends Model
{
    // 表名
    protected $name = 'act_organize';
    // 主键
    protected $pk = 'id';


    public function getFocusLists($uid)
    {
        $data = $this
            ->field('o.*')
            ->alias('o')
            ->join('act_attention a', 'o.id=a.organize_id')
            ->where('userId', $uid)
            ->select();

        $list = [];
        foreach ($data as $k => $v) {
            $list[$k]['id'] = $v['id'];
            $list[$k]['name'] = $v['name'];
            $list[$k]['pic'] = $v['pic'];
            $list[$k]['desc'] = $v['desc'];
            $list[$k]['fans'] = Db::table('act_attention')->where('organize_id', $v['id'])->count();
            $list[$k]['serve_num'] = Db::table('act_serve')->where('organize_id', $v['id'])->count();
        }

        return imgAddHost($list, 'pic');
    }
}