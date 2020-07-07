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

    private static $zhixia = ['北京市','天津市','上海市','重庆市'];

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


    public function getCityListTree()
    {
        $data = $this
            ->field('city.name as name, city1.name as sheng')
            ->alias('city')
            ->join('act_city city1', 'city.pid = city1.id')
            ->select()
            ->toArray();
        $arr = [];
        foreach ($data as $k => $v){
            if (in_array($v['sheng'], self::$zhixia) || $v['sheng'] != $v['name']) {
                $arr[$v['sheng']][] = $v['name'];
            }
        }

        return $arr;
    }


    public function getCityList()
    {
        $arr = $this->selectOrFail()->toArray();

        return array_filter($arr, function ($item){
            if (in_array($item['name'], self::$zhixia) || $item['pid'] != $item['id']) {
                return true;
            }else{
                return false;
            }
        });

    }
}