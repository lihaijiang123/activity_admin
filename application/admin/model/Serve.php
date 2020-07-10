<?php

namespace app\admin\model;

use think\Model;

class Serve extends Model
{
    // 表名
    protected $name = 'act_serve';
    // 主键
    protected $pk = 'id';


    protected $autoWriteTimestamp = 'int';
//    protected $autoWriteTimestamp='true';//时间戳
    protected $createTime = "create_time";

    public function __construct($data = [])
    {
        parent::__construct($data);

    }


    public function selectServes($param, $search_where1, $order = [], $search_where2 = [])
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
            ->paginate(1000, false, ['page' => 1/**$page**/])
            ->getCollection()
            ->toArray();

        $notEndArr = $endArr = [];
        if (null == $order) {
            for ($i = 0; $i < count($data); $i++) {

                $res = $this->timeFilter($data[$i], $param['flag']);
                if (!$res) {
                    continue;
                }

                if ($data[$i]['end_time'] > time()) {
                    array_push($notEndArr, $data[$i]);
                } else {
                    array_push($endArr, $data[$i]);
                }
            }
        }
        $sortNotEndArr = sortArrayByField($notEndArr, 'begin_time', SORT_ASC);
        $sortEndArr = sortArrayByField($endArr, 'begin_time', SORT_DESC);

        $data = array_merge($sortNotEndArr, $sortEndArr);
        $arr = array_slice($data, ($page - 1) * config('pageSize'), config('pageSize'));


        $arr = $this->formatTime($arr, 'begin_time', $param['type']);
        $arr = $this->formatAddr($arr);
        return imgAddHost($arr, 'pic');
    }


    public function timeFilter($data, $flag)
    {
        switch ($flag) {
            case 2://今天
                list($s1, $e1, $s2, $e2) = array($data['begin_time'], $data['end_time'], strtotime(date('Ymd')), strtotime(date('Ymd', strtotime("+1 day"))));
                break;
            case 3://明天
                list($s1, $e1, $s2, $e2) = array($data['begin_time'], $data['end_time'], strtotime(date('Ymd', strtotime("+1 day"))), strtotime(date('Ymd', strtotime("+2 day"))));
                break;
            case 4://本周
                list($s1, $e1, $s2, $e2) = array($data['begin_time'], $data['end_time'], mktime(0, 0, 0, date('m'), date('d') - date('w') + 1, date('Y')), mktime(0, 0, 0, date('m'), date('d') - date('w') + 1 + 7, date('Y')));
                break;
            case 5://本月
                list($s1, $e1, $s2, $e2) = array($data['begin_time'], $data['end_time'], mktime(0, 0, 0, date('m'), 1, date('Y')), mktime(0, 0, 0, date('m'), date('t'), date('Y')));
                break;
            case 6://本年
                list($s1, $e1, $s2, $e2) = array($data['begin_time'], $data['end_time'], strtotime(date('Y-01-01 00:00:00')), strtotime(date('Y-01-01 00:00:00', strtotime("+1 year"))));
                break;
            case 7://明年
                list($s1, $e1, $s2, $e2) = array($data['begin_time'], $data['end_time'], strtotime(date('Y-01-01 00:00:00', strtotime("+1 year"))), strtotime(date('Y-01-01 00:00:00', strtotime("+100 year"))));
                break;
            default:
                list($s1, $e1, $s2, $e2) = [null, null, null, null];
                break;
        }
        return is_time_cross($s1, $e1, $s2, $e2);
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

    //
    public function sendMsg()
    {
        $st = strtotime(date('Y/m/d',strtotime('+3 days')));
        $et = strtotime(date('Y/m/d',strtotime('+4 days')));

        $list = $this
            ->field('s.id,s.title,s.begin_time,s.search_city,s.address,s.hold_mode,u.openid')
            ->where('begin_time', 'between', [$st, $et])
            ->alias('s')
            ->join('act_sign as', 's.id=as.serve_id')
            ->join('siging_users u', 'as.uid=u.user_id')
            ->select();

        $data = [];
        foreach ($list as $k => $v) {
            $data[$k]['id'] = $v['id'];
            $data[$k]['title'] = mb_strlen($v['title']) > 20 ? mb_substr($v['title'], 0, 17) . '...' : $v['title'];
            $data[$k]['open_id'] = $v['openid'];
            $data[$k]['begin_time'] = date('Y年m月d日 H:i', $v['begin_time']);
            $data[$k]['addr'] = ($v['hold_mode'] == 1) ? '线上活动' : ($v['search_city'].$v['address']);
            $data[$k]['tip'] = '本次活动有干货分享，可带好笔记本做记录~';
        }

        return $data;
    }
}