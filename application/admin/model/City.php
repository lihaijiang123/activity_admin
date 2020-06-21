<?php

namespace app\admin\model;

use think\Model;

class City extends Model
{
    // 表名
    protected $name = 'act_city';
    // 主键
    protected $pk = 'id';


    public function getOtherSameLevelCities($name)
    {
         $data = $this
                ->alias('city')
                ->join('act_city city1', 'city.pid = city1.pid')
                ->field('city.name')
                ->where('city1.name', $name)
                ->select()
                ->toArray();

         return array_column($data, 'name');
    }
}