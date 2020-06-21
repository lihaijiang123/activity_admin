<?php
namespace app\home\controller;
use app\admin\model\Banner;
use app\admin\model\City;

use app\admin\model\Serve;
use app\admin\model\ServeType;
use think\db;

// 首页控制器
class Index extends Common{

    /* @var $serveType ServeType */
    private $serveType;

    /* @var $banner Banner */
    private $banner;

    /* @var $city City */
    private $city;

    /* @var $serve Serve */
    private $serve;


    public function initialize()
    {
        parent::initialize();
        $this->serveType = new ServeType();
        $this->banner = new Banner();
        $this->city = new City();
        $this->serve = new Serve();

        $city_con = file_get_contents('city_json_new.txt');
        $city_con_decode = json_decode($city_con,true);
        foreach ($city_con_decode as $key => $val) {
            $this->city_arr[$key]['id'] = $val['id'];
            $this->city_arr[$key]['city'] = $val['city'];
            $this->city_arr[$key]['sheng_id'] = $val['sheng_id'];
            $this->city_arr[$key]['sheng_name'] = $val['sheng_name'];
        }

        $this->city_arr = change_key($this->city_arr);
        $this->city_arr_search = [];
        foreach ($this->city_arr as $key => $val) {
            $this->city_arr_search[$val['sheng_id']][] = $val;
        }
        // 类别
        // echo '<pre>';
        $this->active_categorys = change_key(Db::name('act_serve_category')->field('id,title')->order('sort desc')->where('status','=',1)->select());
        // var_dump($active_types);die;
    }

    /**
     * @Author   JFY
     * @DateTime 2020-05-11
     * @Describe [describe]
     * @Purpose  [purpose]
     * @param    [userId 用户id 必填]
     * @param    [page 页码 选填]
     * @param    [city 城市 选填]
     * @param    [serve_type_id 活动类型id 选填]
     * @return   [type]     [description]
     */
    public function index(){
    	$data = input();
    	$page = empty($data['page']) ? 1 : $data['page'] ;

    	// 搜索条件
    	$search_where = [];
    	// 返回值
    	$return = [];

    	// 活动类型
    	$active_types = Db::name('act_serve_type')->field('id,title')->order('sort desc')->where('status','=',1)->select();

    	// banner
    	$banners = Db::name('act_banner')->field('id,title,img,url')->order('sort desc')->where('status','=',1)->select();
    	if( !empty($banners) ){
    		foreach ($banners as $banner_key => &$banner_val) {
    			$banner_val['img'] = config('admin_path') . $banner_val['img'];
    		}
    	}
    	// 热门活动
    	if( (!empty($data['city']) && $data['city'] != '全国') || $data['serve_type_id'] != 1 ){
            /*
                去寻找当前城市是否有所在省
                if 当前城市有所在省的话，寻找所在省下面的相应数据
                else if 当前城市没有所在省的话，寻找当前城市下面的相应数据
            */

            // echo '<pre>';
            $search_city_arr = [];
            foreach ($this->city_arr_search as $key => $val) {
                foreach ($val as $key2 => $val2) {
                    if( $val2['city'] == $data['city'] && $val2['sheng_id'] != '' ){
                    // 普通城市
                        $search_city_arr[] = array_column($this->city_arr_search[$val2['sheng_id']], 'city');
                    }else if( $val2['city'] == $data['city'] && $val2['sheng_id'] == '' ){
                    // 直辖市
                        $search_city_arr[] = $val2['city'];
                    }
                }
            }

            if( is_array($search_city_arr[0]) ){
                $search_city_whereIn = implode(',', $search_city_arr[0]);
            }else{
                $search_city_whereIn = $search_city_arr[0];
            }


    	}else if( $data['city'] == '全国' ){
            // 全国
            $search_where[] = ['search_city', '<>', ''];
        }

    	if( $data['serve_type_id'] != 0 && $data['serve_type_id'] !=1 ){
            // 普通类型
    		$search_where[] = ['serve_type_id', 'like', "%" . $data['serve_type_id'] . "%"];
    	}else if( $data['serve_type_id'] == 1 ){
            // 线上
            $search_city_whereIn = [];
            // $search_where[] = ['hold_mode', '=', "1"];
            if( $data['city'] == '全国' ){
                $search_whereOr[] = ['hold_mode', '=', "1"];
                // $search_whereOr[] = ['search_city','=',$data['city']];
            }else{
                $search_where[] = ['search_city','=',$data['city']];
                $search_whereOr[] = ['hold_mode', '=', "1"];
            }
        }else if( $data['serve_type_id'] == 0 ){
            $search_where = [];
            $search_whereOr = [];
            $search_city_whereIn = [];
            $search_where[] = ['search_city','=',$data['city']];
            $search_whereOr[] = ['hold_mode', '=', "1"];
            // 全部
            // $search_where[] = ['serve_type_id', '<>', ''];
        }else{
            $search_where[] = ['serve_type_id', '<>', ''];
        }

    	$active_list = Db::name('act_serve')
    					->field('id,title,price,pic,begin_time,end_time,hold_mode,search_city as city')
    					->order('sort desc')
    					->where([['status','=',1],['is_hot','=',1]])
    					->where( $search_where );
                        if( !empty($search_whereOr) ){
                            $active_list->whereOr( $search_whereOr );
                        }
                        if( !empty($search_city_whereIn) ){
                            $active_list->whereIn( 'search_city', $search_city_whereIn );
                        }
    					$active_list = $active_list->paginate(array('list_rows' => config('pageSize'), 'page' => $page))
    					->toArray();

    	if( !empty($active_list['data']) ){
    		foreach ($active_list['data'] as $key => &$val) {
    			$val['pic'] = config('admin_path') . $val['pic'];
                $val['begin_time'] = date('m-d H:i',$val['begin_time']);
                $val['end_time'] = date('m-d H:i',$val['end_time']);
    		}
    	}

        array_unshift($active_types,['id'=>0,'title'=>'全部']);
    	$return['active_types'] = $active_types;
    	$return['banners'] = $banners;
    	$return['active_list'] = $active_list;
    	return json_msg(0,'成功',$return);
    }

    /**
     * @Author   JFY
     * @DateTime 2020-05-13
     * @Describe [活动详情]
     * @Purpose  [purpose]
     * @param    [param]
     * @return   [type]     [description]
     */
    public function activity_detail(){
        $data = input();
        $info = Db::name('act_serve')->where([['id','=',$data['activity']]])->field('id,title,see_num,cang_num,price,begin_time,end_time,hold_mode,content,pic,city,address,url,organ_infor,serve_category_id,serve_type_id,share_img')->find();
        // 浏览量+1
        $info['begin_time'] = date('m-d H:i',$info['begin_time']);
        $info['end_time'] = date('m-d H:i',$info['end_time']);
        $info['pic'] = config('admin_path') . $info['pic'];
        $info['share_img'] = $info['share_img'] ? config('admin_path') . $info['share_img'] : '';
        if( !empty($info['city']) ){
            $info['city'] = $this->city_arr[$info['city']]['city'];
        }
        // 是否收藏
        // $is_collection = Db::table('act_collection')->where([['userId'=>$data['userId']],['serve_id'=>$data['activity']]])->find();
        $is_collection = Db::table('act_collection')->where('userId','=',$data['userId'])->where('serve_id','=',$data['activity'])->find();
        if( !empty($is_collection['id']) ){
            $info['cang'] = true;
        }else{
            $info['cang'] = false;
        }

        $is_join = Db::table('act_join')->where('userId','=',$data['userId'])->where('serve_id','=',$data['activity'])->find();
        if( !empty($is_join['id']) ){
            $info['join'] = true;
        }else{
            $info['join'] = false;
        }
        $serveTypeArr = Db::table('act_serve_type')->where('id', 'in', $info['serve_type_id'])->select();
        $info['serve_type'] = array_column($serveTypeArr, 'title');

        $info['serve_category_id'] = $this->active_categorys[$info['serve_category_id']]['title'];
        Db::table('act_serve')->where('id', $data['activity'])->setInc('see_num');
        return json_msg(0,'成功',$info);
    }

    /**
     * @Author   JFY
     * @DateTime 2020-05-11
     * @Describe [describe]
     * @Purpose  [purpose]
     * @param    [userId 用户id 必填]
     * @param    [orderType 分享列表|收藏列表 (share|collection) 必填]
     * @param    [price 价格 选填]
     * @param    [page 页码 选填]
     * @param    [serve_type_id 活动类型id 选填]
     * @param    [order 排序 选填 (time_desc|time_asc)]
     * @return   [type]     [description]
     */
    public function activity(){
    	$data = input();
    	switch ($data['orderType']) {
    		// 分享列表
    		case 'share_list':
    			$this->share_list( $data );
    			break;
    		// 收藏列表
    		case 'collection_list':
    			$this->collection_list( $data );
    			break;
            //我的想参加
            case 'join_list':
                $this->join_list( $data );
                break;
    		default:
    			# code...
    			break;
    	}

    }

    /**
     * @Author   JFY
     * @DateTime 2020-05-11
     * @Describe [分享]
     * @Purpose  [purpose]
     * @param    [param]
     * @return   [type]     [description]
     */
    public function share(){
    	$data = input();
    	$data['create_time'] = time();
    	$is_exists = Db::name('act_share')->where([['userId','=',$data['userId']],['serve_id','=',$data['serve_id']]])->find();
    	$msg = '分享成功';
    	if( !$is_exists ){
    		$res = Db::name('act_share')->insert($data);
    	}
		return json_msg(0,$msg);
    }

    /**
     * @Author   JFY
     * @DateTime 2020-05-11
     * @Describe [收藏]
     * @Purpose  [purpose]
     * @param    [param]
     * @return   [type]     [description]
     */
    public function collection(){
    	$data = input();
    	$data['create_time'] = time();
    	$is_exists = Db::name('act_collection')->where([['userId','=',$data['userId']],['serve_id','=',$data['serve_id']]])->find();
    	if( !$is_exists ){
    		$res = Db::name('act_collection')->insert($data);
    		$msg = '收藏成功';
            // 收藏量+1
            Db::table('act_serve')->where('id', $data['serve_id'])->setInc('cang_num');
    	}else{
    		$res = Db::table('act_collection')->delete($is_exists['id']);
    		$msg = '取消收藏成功';
            // 收藏量-1
            Db::table('act_serve')->where('id', $data['serve_id'])->setDec('cang_num');
    	}

		return json_msg(0,$msg);
    }

    /**
     * @Author   JFY
     * @DateTime 2020-05-11
     * @Describe [想参加]
     * @Purpose  [purpose]
     * @param    [param]
     * @return   [type]     [description]
     */
    public function join(){
        $data = input();
        $data['create_time'] = time();
        $is_exists = Db::name('act_join')->where([['userId','=',$data['userId']],['serve_id','=',$data['serve_id']]])->find();
        if( !$is_exists ){
             Db::name('act_join')->insert($data);
            $msg = '想参加';
            // 收藏量+1
            Db::table('act_serve')->where('id', $data['serve_id'])->setInc('join_num');
        }else{
            $res = Db::table('act_join')->delete($is_exists['id']);
            $msg = '不想参加';
            // 收藏量-1
            Db::table('act_serve')->where('id', $data['serve_id'])->setDec('join_num');
        }

        return json_msg(0,$msg);
    }

    // 分享列表
    public function share_list( $data ){

        $page = empty($data['page']) ? 1 : $data['page'] ;

    	$list=Db::name('act_share')
            ->alias('share')
            ->distinct(true)
            ->where('share.userId','=',$data['userId'])
            ->Join('act_serve sever','sever.id=share.serve_id')
            ->field('sever.id, sever.title, sever.pic, sever.begin_time, sever.end_time, sever.see_num, serve_category_id, sever.cang_num, sever.price, sever.hold_mode, search_serve_type as serve_type, address, search_city as city')
            ->order('share.create_time desc')
            ->paginate(array('list_rows' => config('pageSize'), 'page' => $page))
            ->toArray();
        if( !empty($list) ){
            foreach ($list['data'] as $key => &$val) {
                $val['pic'] = config('admin_path') . $val['pic'];
                $val['begin_time'] = date('m-d H:i',$val['begin_time']);
                $val['end_time'] = date('m-d H:i',$val['end_time']);
                $val['serve_category_id'] = $this->active_categorys[$val['serve_category_id']]['title'];
            }
        }

        return json_msg(0,'成功',$list);
    }

    // 收藏列表
    public function collection_list( $data ){

    	$page = empty($data['page']) ? 1 : $data['page'] ;

        $list=Db::name('act_collection')
            ->alias('colle')
            ->distinct(true)
            ->where('colle.userId','=',$data['userId'])
            ->Join('act_serve sever','sever.id=colle.serve_id')
            ->field('sever.id, sever.title, sever.pic, sever.begin_time, sever.end_time, sever.see_num, serve_category_id, sever.cang_num, sever.price, sever.hold_mode, search_serve_type as serve_type, address, search_city as city')
            ->order('colle.create_time desc')
            ->paginate(array('list_rows' => config('pageSize'), 'page' => $page))
            ->toArray();


        if( !empty($list) ){
            foreach ($list['data'] as $key => &$val) {
                $val['pic'] = config('admin_path') . $val['pic'];
                $val['begin_time'] = date('m-d H:i',$val['begin_time']);
                $val['end_time'] = date('m-d H:i',$val['end_time']);
                $val['serve_category_id'] = $this->active_categorys[$val['serve_category_id']]['title'];
            }
        }

        return json_msg(0,'成功',$list);
    }

    // 想参加列表
    public function join_list( $data ){

        $page = empty($data['page']) ? 1 : $data['page'] ;

        $list=Db::name('act_join')
            ->alias('join')
            ->distinct(true)
            ->where('join.userId','=',$data['userId'])
            ->Join('act_serve sever','sever.id=join.serve_id')
            ->field('sever.id, sever.title, sever.pic, sever.begin_time, sever.end_time, sever.see_num, serve_category_id, sever.cang_num, sever.price, sever.hold_mode, search_serve_type as serve_type, address, search_city as city')
            ->order('join.create_time desc')
            ->paginate(array('list_rows' => config('pageSize'), 'page' => $page))
            ->toArray();


        if( !empty($list) ){
            foreach ($list['data'] as $key => &$val) {
                $val['pic'] = config('admin_path') . $val['pic'];
                $val['begin_time'] = date('m-d H:i',$val['begin_time']);
                $val['end_time'] = date('m-d H:i',$val['end_time']);
                $val['serve_category_id'] = $this->active_categorys[$val['serve_category_id']]['title'];
            }
        }

        return json_msg(0,'成功',$list);
    }

    /**
     * @Author   JFY
     * @DateTime 2020-05-18
     * @Describe [搜索列表]
     * @Purpose  [purpose]
     * @param    [param]
     * @return   [type]     [description]
     */
    public function search_list(){
        $data = input();
        $page = empty($data['page']) ? 1 : $data['page'] ;

        // 活动类型
        $active_types = Db::name('act_serve_type')->field('id,title')->order('sort desc')->where('status','=',1)->select();

        $where[] = ['status','=',1];

        $order = $data['order'];
        $hold_mode = $data['hold_mode'];
        $serve_type_id = $data['serve_type_id'];
        $keywords = $data['keywords'];

        // 默认的排序是按照sort降序排列
        // if( !empty(explode('__',$order)) ){
        //     $order = implode(' ',explode('__',$order));
        // }else{
        //     $order = 'sort desc';
        // }

        // if( !empty($hold_mode) ){
        //     $where[] = array('hold_mode','=',$hold_mode);
        // }else{
        //     $where[] = array('hold_mode','<>','');
        // }

        // if( $serve_type_id != 0 ){
        //     $search_where[] = array ('serve_type_id', 'like', "%" . $serve_type_id . "%" );
        // }else{
        //     $search_where[] = array('serve_type_id','<>','');
        // }

        if( !empty( $keywords ) ){
            $search_where[] = array('title','like', "%". $keywords ."%" );
        }

        // 热门活动
        if( (!empty($data['city']) && $data['city'] != '全国') || $data['serve_type_id'] != 1 ){
            /*
                去寻找当前城市是否有所在省
                if 当前城市有所在省的话，寻找所在省下面的相应数据
                else if 当前城市没有所在省的话，寻找当前城市下面的相应数据
            */

            // echo '<pre>';
            $search_city_arr = [];
            foreach ($this->city_arr_search as $key => $val) {
                foreach ($val as $key2 => $val2) {
                    if( $val2['city'] == $data['city'] && $val2['sheng_id'] != '' ){
                    // 普通城市
                        $search_city_arr[] = array_column($this->city_arr_search[$val2['sheng_id']], 'city');
                    }else if( $val2['city'] == $data['city'] && $val2['sheng_id'] == '' ){
                    // 直辖市
                        $search_city_arr[] = $val2['city'];
                    }
                }
            }

            if( is_array($search_city_arr[0]) ){
                $search_city_whereIn = implode(',', $search_city_arr[0]);
            }else{
                $search_city_whereIn = $search_city_arr[0];
            }


        }else if( $data['city'] == '全国' ){
            // 全国
            $search_where[] = ['search_city', '<>', ''];
        }

        if( $data['serve_type_id'] != 0 && $data['serve_type_id'] !=1 ){
            // 普通类型
            $search_where[] = ['serve_type_id', 'like', "%" . $data['serve_type_id'] . "%"];
        }else if( $data['serve_type_id'] == 1 || $data['serve_type_id'] == 0 ){
            // 线上
            $search_where[] = ['hold_mode', '=', "1"];
            if( $data['city'] != '全国' ){
                $search_whereOr[] = ['search_city','=',$data['city']];
            }
        }else{
            // 全部
            $search_where[] = ['serve_type_id', '<>', ''];
        }

        $active_list = Db::name('act_serve')
                        ->field('id,title,begin_time,end_time,city,price,pic,serve_type_id,city,address,search_serve_type as serve_type,hold_mode')
                        ->order( $order )
                        ->where( $search_where );
                        if( !empty($search_whereOr) ){
                            $active_list->whereOr( $search_whereOr );
                        }
                        if( !empty($search_city_whereIn) ){
                            $active_list->whereIn( 'search_city', $search_city_whereIn );

                        }
                        $active_list = $active_list->paginate(array('list_rows' => config('pageSize'), 'page' => $page))
                        ->toArray();

        if( !empty($active_list['data']) ){
            foreach ($active_list['data'] as $key => &$val) {
                $val['pic'] = config('admin_path') . $val['pic'];
                $val['begin_time'] = date('m-d H:i',$val['begin_time']);
                $val['end_time'] = date('m-d H:i',$val['end_time']);
                if( !empty($val['city']) ){
		            $val['city'] = $this->city_arr[$val['city']]['city'];
		        }
            }
        }

        array_unshift($active_types,['id'=>0,'title'=>'全部']);
        $return['active_types'] = $active_types;
        $return['active_list'] = $active_list;
        return json_msg(0,'成功',$return);
    }


    // 首页
    public function test()
    {
        $data = input();
        // 活动类型
        $active_types = $this->serveType->getActiveTypes($data['type']);
        // banner
        $banners = $this->banner->getBanner();
        $search_city_whereIn = [];
        if ((!empty($data['city']) && $data['city'] != '全国')) {
            /** 去寻找当前城市是否有所在省 if 当前城市有所在省的话，寻找所在省下面的相应数据 else if 当前城市没有所在省的话，寻找当前城市下面的相应数据 */
            $search_city_whereIn = $this->city->getOtherSameLevelCities($data['city']);
        }
        $param = $this->createParam($data);
        $search_where1 = array_merge($param, array(['hold_mode', '=', 1]));
        // 热门 | 全部 0 (所有线上类型 + 当前省的)
        if (0 == $data['serve_type_id']) {
            $search_where2 = !empty($search_city_whereIn) ? array_merge($param, array(['search_city', ['in', $search_city_whereIn]])) : null;
            $list = $this->serve->selectServes($data['type'], $search_where1, $search_where2);
        }
        // 线上 1 所有的线上
        if (1 == $data['serve_type_id']) {
            $list = $this->serve->selectServes($data['type'], $search_where1);
        }
        // !0 1 查询当前城市,当前类型的所有线下
        if (1 < $data['serve_type_id']) {
            $add_where = array(
                ['search_city', ['in', $search_city_whereIn]],
                ['serve_type_id', 'like', "%" . $data['serve_type_id'] . "%"],
                ['hold_mode', '=', 2],
            );
            $where = array_merge($param, $add_where);
            $list = $this->serve->selectServes($data['type'], $where);
        }

        $return['active_types'] = $active_types;
        $return['banners'] = $banners;
        $return['active_list'] = $list;
//        dump($return);
//        exit;
        return json_msg(0, '成功', $return);
    }


    private function createParam($data){
        $param[] = ['t1.status', '=', 1];
        if (!empty($data['keywords']))
            $param[] = ['t1.title', 'like', "%" . $data['keywords'] . "%"];
        if ($data['type'] == 'index') {
            $param[] = ['is_hot', '=', 1];
            $param[] = ['end_time', '>', time()];
            $param[] = ['begin_time', '<', time()];
        }
        return $param;
    }

    public function lists()
    {
        $data = input();
        // 活动类型
        $active_types = Db::name('act_serve_type')->field('id,title')->order('sort desc')->where('status','=',1)->select();

        // banner
        $banners = Db::name('act_banner')->field('id,title,img,url')->order('sort desc')->where('status','=',1)->select();
        if( !empty($banners) ){
            foreach ($banners as $banner_key => &$banner_val) {
                $banner_val['img'] = config('admin_path') . $banner_val['img'];
            }
        }

        $page = empty($data['page']) ? 1 : $data['page'] ;
        $data['city'] = empty( $data['city'] ) ? '全国' : $data['city'] ;
        $search_where[] = ['status','=',1];
        if( $data['debug'] == true ){
            echo '<pre>';
        }
        if( !empty( $data['keywords'] ) ){
            $search_where[] = ['title','like', "%". $data['keywords'] ."%" ];
        }
        if( $data['search_type'] == 'hot' ){
            // 热门活动
            $search_where[] = ['is_hot','=', 1];
        }

        // 城市
        // if( (!empty($data['city']) && $data['city'] != '全国') ){
        //     /*
        //         去寻找当前城市是否有所在省
        //         if 当前城市有所在省的话，寻找所在省下面的相应数据
        //         else if 当前城市没有所在省的话，寻找当前城市下面的相应数据
        //     */

        //     // echo '<pre>';
        //     $search_city_arr = [];
        //     foreach ($this->city_arr_search as $key => $val) {
        //         foreach ($val as $key2 => $val2) {
        //             if( $val2['city'] == $data['city'] && $val2['sheng_id'] != '' ){
        //             // 普通城市
        //                 $search_city_arr[] = array_column($this->city_arr_search[$val2['sheng_id']], 'city');
        //             }else if( $val2['city'] == $data['city'] && $val2['sheng_id'] == '' ){
        //             // 直辖市
        //                 $search_city_arr[] = $val2['city'];
        //             }
        //         }
        //     }
        //     if( is_array($search_city_arr[0]) ){
        //         $search_city_whereIn = implode(',', $search_city_arr[0]);
        //     }else{
        //         $search_city_whereIn = $search_city_arr[0];
        //

        // }else if( $data['city'] == '全国' ){
        //     // 全国
        //     $search_where[] = ['search_city', '<>', ''];
        // }
        // 所有的线上
        if( $data['serve_type_id'] == 0 || $data['serve_type_id'] == 1 ){
            $active_list = Db::name('act_serve')
                ->field('id,title,begin_time,end_time,city,price,pic,serve_type_id,serve_category_id,city,address,search_serve_type as serve_type,hold_mode')
                ->where( $search_where )
                ->where('serve_type_id','like',"%1%")
                ->select();
        }

        // 所有线上+当前城市所在省的
        if( $data['serve_type_id'] == 0 ){
            if( (!empty($data['city']) && $data['city'] != '全国') ){
                /*
                    去寻找当前城市是否有所在省
                    if 当前城市有所在省的话，寻找所在省下面的相应数据
                    else if 当前城市没有所在省的话，寻找当前城市下面的相应数据
                */

                // echo '<pre>';
                $search_city_arr = [];
                foreach ($this->city_arr_search as $key => $val) {
                    foreach ($val as $key2 => $val2) {
                        if( $val2['city'] == $data['city'] && $val2['sheng_id'] != '' ){
                            // 普通城市
                            $search_city_arr[] = array_column($this->city_arr_search[$val2['sheng_id']], 'city');
                        }else if( $val2['city'] == $data['city'] && $val2['sheng_id'] == '' ){
                            // 直辖市
                            $search_city_arr[] = $val2['city'];
                        }
                    }
                }
                if( is_array($search_city_arr[0]) ){
                    $search_city_whereIn = implode(',', $search_city_arr[0]);
                }else{
                    $search_city_whereIn = $search_city_arr[0];
                }
            }
            $search_where[] = ['hold_mode', '=', 2];
            $active_list_xianxia = Db::name('act_serve')
                ->field('id,title,begin_time,end_time,city,price,pic,serve_type_id,city,serve_category_id,address,search_serve_type as serve_type,hold_mode,search_city')
                ->where( $search_where );
            if( !empty($search_city_whereIn) ){
                $active_list_xianxia ->whereIn( 'search_city' , $search_city_whereIn );
            }

            $active_list_xianxia = $active_list_xianxia -> select();
            if( !empty($active_list_xianxia) ){
                $active_list = array_merge($active_list,$active_list_xianxia);
            }

        }

        // 查询当前城市，当前类型的所有线下
        if( $data['serve_type_id'] != 0 && $data['serve_type_id'] != 1 ){
            //$active_list = [];

            $active_list = Db::name('act_serve')
                ->field('id,title,begin_time,end_time,city,price,pic,serve_type_id,serve_category_id,city,address,search_serve_type as serve_type,hold_mode')
                ->where( $search_where )
                ->where('serve_type_id','like',"%1%")
                ->where('serve_type_id','like',"%". $data['serve_type_id'] ."%")
                ->select();

            if( (!empty($data['city']) && $data['city'] != '全国') ){
                /*
                    去寻找当前城市是否有所在省
                    if 当前城市有所在省的话，寻找所在省下面的相应数据
                    else if 当前城市没有所在省的话，寻找当前城市下面的相应数据
                */

                // echo '<pre>';
                $search_city_arr = [];
                foreach ($this->city_arr_search as $key => $val) {
                    foreach ($val as $key2 => $val2) {
                        if( $val2['city'] == $data['city'] && $val2['sheng_id'] != '' ){
                            // 普通城市
                            $search_city_arr[] = array_column($this->city_arr_search[$val2['sheng_id']], 'city');
                        }else if( $val2['city'] == $data['city'] && $val2['sheng_id'] == '' ){
                            // 直辖市
                            $search_city_arr[] = $val2['city'];
                        }
                    }
                }

                if( is_array($search_city_arr[0]) ){
                    $search_city_whereIn = implode(',', $search_city_arr[0]);
                }else{
                    $search_city_whereIn = $search_city_arr[0];
                }
            }

            $search_where[] = ['hold_mode', '=', 2];
            $search_where[] = ['serve_type_id', 'like', "%" .$data['serve_type_id']. "%"];
            $active_list_xianxia = Db::name('act_serve')
                ->field('id,title,begin_time,end_time,city,price,pic,serve_type_id,serve_category_id,city,address,search_serve_type as serve_type,hold_mode,search_city')
                ->where( $search_where );
            if( !empty($search_city_whereIn) ){
                $active_list_xianxia ->whereIn( 'search_city' , $search_city_whereIn );
            }
            $active_list_xianxia = $active_list_xianxia -> select();

            if( !empty($active_list_xianxia) ){
                $active_list = array_merge($active_list,$active_list_xianxia);
            }
        }


        $return_active_list = array_slice($active_list, ($page - 1) * 100, 100);

        foreach ($return_active_list as $key => &$val) {
            $val['pic'] = config('admin_path') . $val['pic'];
            $val['begin_time'] = date('m-d H:i',$val['begin_time']);
            $val['end_time'] = date('m-d H:i',$val['end_time']);
            if( !empty($val['city']) ){
                $val['city'] = $this->city_arr[$val['city']]['city'];
            }

            $return_active_list[$key]['serve_category_id'] = $this->active_categorys[$val['serve_category_id']]['title'];

        }
        array_unshift($active_types,['id'=>0,'title'=>'全部']);
        dump($return_active_list);
        exit;
        $return['active_types'] = $active_types;
        $return['banners'] = $banners;
        $return['active_list'] = $return_active_list;

        return json_msg(0,'成功',$return);
    }
    public function help()
    {
        $data = Db::table('front_config')->where('name', 'help')->find();
        return json_msg(0, '', $data);
    }

}