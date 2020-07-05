<?php


namespace app\admin\model;
use think\Model;


class Sign extends Model
{
    // 表名
    protected $name = 'act_sign';
    // 主键
    protected $pk = 'id';


    // 如果存在就更新  如果不存在就插入
    public function signUp($data)
    {
        $res = $this->where('uid', $data['uid'])->where('serve_id', $data['serve_id'])->find();
        if (empty($res)){
            $this->insert($data);
            return 0;
        } else {
            $this
                ->where('uid', $data['uid'])
                ->where('serve_id', $data['serve_id'])
                ->data($data)
                ->update();
            return 1;
        }

    }


    public function SignUpInfo($data)
    {
        return $this->where($data)->find();
    }
}