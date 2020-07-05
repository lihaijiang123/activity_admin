<?php


namespace app\admin\model;

use think\Model;

class Info extends Model
{
    // 表名
    protected $name = 'act_info';
    // 主键
    protected $pk = 'id';



    public function insertOrUpdate($data)
    {
        $info = $this->where('uid', $data['uid'])->find();
        if ($info) {
            $res = $this->allowField(true)->save($data, ['uid'=>$data['uid']]);
        } else {
            $res = $this->allowField(true)->save($data);
        }

        return $res;
    }

}


