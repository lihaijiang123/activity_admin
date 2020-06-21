<?php

namespace app\admin\model;

use think\Model;

class Banner extends Model
{
    // 表名
    protected $name = 'act_banner';
    // 主键
    protected $pk = 'id';


    public function getBanner()
    {
        $data = $this
            ->field('id,title,img,url')
            ->order('sort desc')
            ->where('status', '=', 1)
            ->select()
            ->toArray()
        ;

        return imgAddHost($data, 'img');
    }
}