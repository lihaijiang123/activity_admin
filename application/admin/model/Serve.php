<?php

namespace app\admin\model;

use think\Model;

class Serve extends Model
{
    // 表名
    protected $name = 'act_serve';
    // 主键
    protected $pk = 'id';


    protected $autoWriteTimestamp='int';
//    protected $autoWriteTimestamp='true';//时间戳
    protected $createTime="create_time";

    public function __construct($data = [])
    {
        parent::__construct($data);

    }


    public function selectServes($type, $search_where1, $order = [], $search_where2 = [])
    {
        $page = input('get.page') ? input('get.page') : 1;
        $em = $this
            ->alias('t1')
            ->field('t1.id,t1.title,begin_time,end_time,currency,price,pic,serve_type_id,t3.title serve_category_id,address,search_serve_type as serve_type,hold_mode,t1.create_time,search_city,count(t1.id) as shareNum')
            //->join('act_city t2', 't1.city = t2.id', 'left')
            ->join('act_serve_category t3', 't1.serve_category_id=t3.id', 'left')
            ->join('act_share sh', 't1.id = sh.serve_id', 'left')
            ->where([$search_where1]);
        if (!empty($search_where2)) $em->whereOr([$search_where2]);
        $data = $em
            ->group('t1.id')
            ->order($order)
            ->paginate(1000, true, ['page' => $page])
            ->getCollection()
            ->toArray();

        $notEndArr = $endArr = [];
        if (null == $order) {
            for ($i=0; $i<count($data); $i++){
                if($data[$i]['end_time'] > time()) {
                    array_push($notEndArr, $data[$i]);
                } else {
                    array_push($endArr, $data[$i]);
                }
            }
        }
        $sortNotEndArr = sortArrayByField($notEndArr, 'begin_time', SORT_ASC);
        $sortEndArr = sortArrayByField($endArr, 'begin_time', SORT_DESC);

        $data = array_merge($sortNotEndArr, $sortEndArr);
        //array_slice($active_list, ($page - 1) * config('pageSize') , config('pageSize');


        $data = $this->formatTime($data, 'begin_time', $type);
        $data = $this->formatAddr($data);
        return imgAddHost($data, 'pic');
    }

    public function formatTime($data, $field, $type)
    {
        if ($type == 'index') {
            $weekArray = array("日", "一", "二", "三", "四", "五", "六");
            foreach ($data as &$v) {
                $v[$field] = date('m/d', $v[$field]) . ' 周' . $weekArray[date("w")];
            }
        } elseif ($type == 'list') {
            foreach ($data as &$v) {
                if ($v['end_time'] - $v['begin_time'] <= 24 * 60 * 60) {
                    $v[$field] = date('Y.m.d H:i', $v['end_time']);
                } elseif (date('Y', $v['begin_time']) != date('Y', $v['end_time'])) {
                    $v[$field] = date('Y.m.d', $v['begin_time']) . '-' . date('Y.m.d', $v['end_time']);
                } else {
                    $v[$field] = date('Y.m.d', $v['begin_time']) . '-' . date('m.d', $v['end_time']);
                }
            }
        } elseif ($type == 'detail') {
            if ($data['end_time'] - $data['begin_time'] <= 24 * 60 * 60) {
                $data[$field] = date('Y.m.d H:i', $data['end_time']);
            } elseif (date('Y', $data['begin_time']) != date('Y', $data['end_time'])) {
                $data[$field] = date('Y.m.d', $data['begin_time']) . '-' . date('Y.m.d', $data['end_time']);
            } else {
                $data[$field] = date('Y.m.d', $data['begin_time']) . '-' . date('m.d', $data['end_time']);
            }
        }

        return $data;
    }

    private function formatAddr($data)
    {
        foreach ($data as &$v) {

            $v['city'] = mb_strlen($v['search_city']) > 6 ? (mb_substr($v['search_city'], 0, 6) . '...') : $v['search_city'];
        }
        return $data;
    }
}