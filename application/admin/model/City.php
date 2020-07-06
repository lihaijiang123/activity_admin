<?php

namespace app\admin\model;

use think\Db;
use think\Model;

class City extends Model
{
    // 表名
    protected $name = 'act_city';
    // 主键
    protected $pk = 'id';


    /**
     * 传递过来的城市同级别的城市
     * @param $name
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getOtherSameLevelCities($name)
    {
         $data = $this
                ->alias('city')
                ->join('act_city city1', 'city.pid = city1.pid')
                ->field('city.name')
                ->where('city1.name', $name)
                ->select()
                ->toArray();

         if (empty($data)) {
             $data = Db::table('act_hot_country')->field('city as name')->where('city', $name)->select();
         }
         return array_column($data, 'name');
    }


    public function getCityList()
    {
        $data = $this
            ->field('city.name as name, city1.name as sheng')
            ->alias('city')
            ->join('act_city city1', 'city.pid = city1.id')
            ->select()
            ->toArray();
        $arr = [];
        foreach ($data as $k => $v){
            $arr[$v['sheng']][] = $v['name'];
        }

        return $arr;
    }
}