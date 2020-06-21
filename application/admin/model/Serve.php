<?php

namespace app\admin\model;

use think\Model;

class Serve extends Model
{
    // 表名
    protected $name = 'act_serve';
    // 主键
    protected $pk = 'id';


    public function __construct($data = [])
    {
        parent::__construct($data);

    }
//
//    public function getBeginTimeAttr($begin_time)
//    {
//        return date('y/m/d H:i',$begin_time);
//    }
//
//    public function getEndTimeAttr($end_time)
//    {
//        return date('y/m/d H:i',$end_time);
//    }

    /**
     * @param $search_where1
     * @param array $search_where2
     * @return array
     * @throws \think\exception\DbException
     */
    public function selectServes($type, $search_where1, $search_where2 = [])
    {
        $page = input('get.page') ? input('get.page') : 1;
        $em = $this
            ->alias('t1')
            ->field('t1.id,t1.title,begin_time,end_time,city,price,pic,serve_type_id,t2.name city,t3.title serve_category_id,address,search_serve_type as serve_type,hold_mode,search_city')
            ->join('act_city t2', 't1.city = t2.id', 'left')
            ->join('act_serve_category t3', 't1.serve_category_id=t3.id', 'left')
            ->where([$search_where1]);
        if (!empty($search_where2)) $em->whereOr([$search_where2]);
        $data = $em
            ->order('begin_time', 'asc')
            ->paginate(100, true, ['page' => $page])
            ->getCollection()
            ->toArray();

        $data = $this->formatTime($data, 'begin_time', $type);
        $data = $this->formatAddr($data);
        return imgAddHost($data, 'pic');
    }

    private function formatTime($data, $field, $type)
    {
        $weekArray = array("日", "一", "二", "三", "四", "五", "六");

        foreach ($data as &$v) {
            $v[$field] = date('m/d', $v[$field]) . ' 周' . $weekArray[date("w")];
        }
        return $data;
    }

    private function formatAddr($data)
    {
        foreach ($data as &$v) {
            $v['city'] = mb_substr($v['city'] . $v['address'], 0 ,6) . '...';
        }
        return $data;
    }
}